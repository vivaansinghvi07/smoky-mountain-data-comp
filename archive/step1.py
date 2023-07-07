#%%

""" imports to avoid error """
import os
import cv2
import math
import random
import imutils
import numpy as np
from matplotlib import pyplot as plt
from trdg.generators import GeneratorFromStrings

# type decls
cv2.Image = np.ndarray
cv2.Contour = np.ndarray

# shows an image on ipynb
def imshow(img: cv2.Image) -> None:
    plt.axis('off')
    plt.grid(False)
    plt.imshow(cv2.cvtColor(img, cv2.COLOR_BGR2RGB))
    plt.show()

def grayscale(img: cv2.Image) -> cv2.Image:
    return cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)


#%%
""" 
For image processing - cropped the image to only the rectangle.
However, the code is not needed for now, as PaddleOCR automatically
detects text rotations and does it itself.
"""

def get_largest_contour(img: cv2.Image) -> cv2.Contour:
    gray = grayscale(img)
    blur = cv2.GaussianBlur(gray, (51, 51), 0)
    thresh = cv2.threshold(blur, 150, 255, 0)[1]
    contours = cv2.findContours(thresh, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)[0]
    return thresh, sorted(contours, key=cv2.contourArea, reverse=True)[0]

# not used for now D:
def crop_image(img: cv2.Image, debug: bool = False) -> cv2.Image:

    if debug: imshow(img)

    thresh, big_contour = get_largest_contour(img)
    x, y, w, h = cv2.boundingRect(big_contour)
    newimg = img[y:y+h, x:x+w]

    # perform 90-deg rotation if the cropped image is wider than tall
    if h > w: newimg = np.array([[newimg[j][i] for j in reversed(range(len(newimg)))] for i in range(len(newimg[0]))])

    # get the longest line in the approximation
    newimg_thresh, newimg_big_contour = get_largest_contour(newimg)
    approx = cv2.approxPolyDP(newimg_big_contour, 0.010*cv2.arcLength(newimg_big_contour, True), True)
    simplified_approx = list(map(lambda x: tuple(x[0]), approx))
    max_lines = sorted(
        zip(simplified_approx, simplified_approx[1:] + [simplified_approx[0]]),  # connects all the points with the adjacent one
        key=lambda l: (l[0][0]-l[1][0])**2 + (l[0][1]-l[1][1])**2                # distance formula
    )[-2:]

    def get_angle(line: tuple[tuple[int]]) -> float:

        # flatten the longest line, from / to __
        y_dist = line[0][1]-line[1][1]
        x_dist = line[0][0]-line[1][0]
        angle = math.degrees(math.atan(y_dist/x_dist))
        return angle

    if debug:
        drawn_contours = cv2.drawContours(cv2.cvtColor(newimg_thresh.copy(), cv2.COLOR_GRAY2BGR), [approx], -1, (0, 0, 255), 10)
        imshow(drawn_contours)
        
    newimg = imutils.rotate(newimg, angle=float(np.average([*map(get_angle, max_lines)])))

    return newimg
#%%
"""
For generating synthetic data. We currently are using PaddleOCR,
but if we change that, we may need this.
"""

ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
IMG_COUNT = 100
DATA_PATH = 'synthetic-data'
IMAGES_PATH = f'{DATA_PATH}/images'

os.system(f"{'rm -rf' if os.name != 'nt' else 'rmdir /s /q'} {DATA_PATH}")
os.system(f"mkdir {DATA_PATH} {IMAGES_PATH}")
os.system(f"echo '*' > {DATA_PATH}/.gitignore")

def get_random_text():
    treatment = random.choice(['C', 'D'])
    block = f"B{random.choice(['1', '2'])}"
    row = f"R{random.randint(1, 99)}"
    position = f"P{random.randint(1, 99)}"
    
    gen_length = random.randint(2, 4)
    num_count = random.choices([1, 2, 3], weights=(70, 15, 15))[0]
    num_lengths = random.choices([1, 2, 3, 4], weights=(15, 15, 15, 55), k=num_count)

    genotype = (
        "".join([ALPHABET[random.randint(0, 25)] for _ in range(gen_length)]) + 
        f"-{'-'.join([str(random.randint(10**(i-1), 10**i-1)) for i in num_lengths])}_LM"
    )

    return ','.join([treatment, block, row, position, genotype])

# generate the new images, limiting count
generator = GeneratorFromStrings(
    [get_random_text() for _ in range(1000)],
    random_blur=True,
    random_skew=True,
    fonts=['assets/image_font.ttf']
)
i = 0
for img, lbl in generator:
    if i == IMG_COUNT: break
    img.save(f'{IMAGES_PATH}/{lbl}_{i}.png')
    i += 1

# randomly selects one image for exemplary purposes
example_img = random.choice(os.listdir(IMAGES_PATH))
imshow(cv2.imread(f"{IMAGES_PATH}/{example_img}"))
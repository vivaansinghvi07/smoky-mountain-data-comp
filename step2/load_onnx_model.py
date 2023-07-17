# Code used is taken from Meta AI's Segment Anything Model
# View here: https://github.com/facebookresearch/segment-anything/blob/main/notebooks/onnx_model_example.ipynb

import os
import torch
import warnings
from onnxruntime.quantization import QuantType
from segment_anything import sam_model_registry
from segment_anything.utils.onnx import SamOnnxModel
from onnxruntime.quantization.quantize import quantize_dynamic

# const information
DEVICE = "cuda" if torch.cuda.is_available() else "cpu"
MODEL_TYPE = "vit_h"
SAM_MODEL_NAME = "sam_vit_h_4b8939.pth"
DATA_PATH = "seg_from_SAM"

# checks for the model being downloaded
if SAM_MODEL_NAME not in os.listdir():
    if os.name == 'nt':
        os.system(r"cd .. && .\scripts\SAM.bat && cd step2")
    else:
        os.system("cd .. && sh ./scripts/SAM.sh && cd step2")

sam = sam_model_registry[MODEL_TYPE](checkpoint=SAM_MODEL_NAME)

onnx_model_path = "onnx_model.onnx"

onnx_model = SamOnnxModel(sam, return_single_mask=True)

dynamic_axes = {
    "point_coords": {1: "num_points"},
    "point_labels": {1: "num_points"},
}

embed_dim = sam.prompt_encoder.embed_dim
embed_size = sam.prompt_encoder.image_embedding_size
mask_input_size = [4 * x for x in embed_size]
dummy_inputs = {
    "image_embeddings": torch.randn(1, embed_dim, *embed_size, dtype=torch.float),
    "point_coords": torch.randint(low=0, high=1024, size=(1, 5, 2), dtype=torch.float),
    "point_labels": torch.randint(low=0, high=4, size=(1, 5), dtype=torch.float),
    "mask_input": torch.randn(1, 1, *mask_input_size, dtype=torch.float),
    "has_mask_input": torch.tensor([1], dtype=torch.float),
    "orig_im_size": torch.tensor([1500, 2250], dtype=torch.float),
}
output_names = ["masks", "iou_predictions", "low_res_masks"]

with warnings.catch_warnings():
    warnings.filterwarnings("ignore", category=torch.jit.TracerWarning)
    warnings.filterwarnings("ignore", category=UserWarning)
    with open(onnx_model_path, "wb") as f:
        torch.onnx.export(
            onnx_model,
            tuple(dummy_inputs.values()),
            f,
            export_params=True,
            verbose=False,
            opset_version=17,
            do_constant_folding=True,
            input_names=list(dummy_inputs.keys()),
            output_names=output_names,
            dynamic_axes=dynamic_axes,
        )    
    
quantize_dynamic(
    model_input=onnx_model_path,
    model_output=onnx_model_path,
    optimize_model=True,
    per_channel=False,
    reduce_range=False,
    weight_type=QuantType.QUInt8,
)
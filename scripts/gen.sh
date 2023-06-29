rm -rf synthetic-data
mkdir synthetic-data synthetic-data/images
echo '*' > synthetic-data/.gitignore
python3 generate_dataset.py

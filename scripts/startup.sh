# run basic startup scripts already written
. scripts/venv.sh
bash scripts/load_files.sh

# get the files required for step 2
cd step2
wget https://dl.fbaipublicfiles.com/segment_anything/sam_vit_h_4b8939.pth
python3 load_onnx_model.py
cd ..
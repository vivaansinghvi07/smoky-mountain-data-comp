if [ ! -d leaf_identification ]
then 
  cd step2
fi
if [ ! -f sam_vit_h_4b8939 ]
then
  wget https://dl.fbaipublicfiles.com/segment_anything/sam_vit_h_4b8939.pth
fi
if [ -d step2 ]
then 
  cd ..
fi
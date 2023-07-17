cd step2
if [ ! -f sam_vit_h_4b8939 ]
then
  wget https://dl.fbaipublicfiles.com/segment_anything/$1
fi
cd ..
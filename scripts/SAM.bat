CD step2
IF EXIST sam_vit_h_4b8939 GOTO END
WGET https://dl.fbaipublicfiles.com/segment_anything/%1
:END
CD ..
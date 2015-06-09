#!/bin/bash

echo "fullscreen? Please enter 1 or 0. (1 = yes, 0 = no, default = no)"
read full
echo "video width? (default = 1024)"
read width 
echo "video height? (default = 768)"
read height

export LD_LIBRARY_PATH=/opt/unigine-sanctuary/bin:$LD_LIBRARY_PATH
/opt/unigine-sanctuary/bin/Sanctuary	-video_app opengl \
					-sound_app openal \
					-engine_config ../data/unigine.cfg \
					-data_path ../ \
					-extern_define RELEASE \
					-video_fullscreen ${full:-0} \
					-video_mode -1 \
					-video_width ${width:-1024} \
					-video_height ${height:-768}

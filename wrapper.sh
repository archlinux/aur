#!/bin/sh

basedir='/opt/vkcv/'

createmenu ()
{
        select option; do
                if [ 0 -eq "$REPLY" ]; then
                        echo "uhm.. "
                else
                        opt=$(echo ${option})
                        dir=${basedir}${option}"/"
                        bin=${basedir}${option}"/"${option}
                        break;
                fi
        done
}

list="bindless_textures
fire_works
first_mesh
first_scene
first_triangle
head_demo
indirect_dispatch
indirect_draw
mesh_shader
mpm
particle_simulation
path_tracer
ray_tracer
rt_ambient_occlusion
sph
voxelization"

if [ "$list" == "" ]; then
        exit 2
fi

array=($(echo "$list"))

createmenu "${array[@]}"

echo "you selected ${option}"
cd ${dir} && ${bin}

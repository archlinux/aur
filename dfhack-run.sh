#!/bin/bash

src_dir="/opt/dwarffortress"
df_dir="${XDG_DATA_HOME:-$HOME/.local/share}/dwarffortress"
df_conf_dir="${XDG_CONFIG_HOME:-$HOME/.config}/dwarffortress"

# check for dwarffortress user directory
if [[ ! -d ${df_dir} ]] ; then
  mkdir -p ${df_dir}/data
  mkdir -p ${df_conf_dir}/data

  ln -s  "${src_dir}/raw"            "${df_dir}/raw"
  ln -s  "${src_dir}/libs"           "${df_dir}/libs"
  cp -rn "${src_dir}/data/init"      "${df_conf_dir}/data/init"
  ln -s  "${df_conf_dir}/data/init"  "${df_dir}/data/init"

  for link in announcement art dipscript help index initial_movies movies shader.fs shader.vs sound speech ; do
    cp -r "${src_dir}/data/$link"     "${df_conf_dir}/data/$link"
    ln -s "${df_conf_dir}/data/$link" "${df_dir}/data/$link"
  done

  cp -a "${src_dir}/data/init/init.custom.txt"   "${df_conf_dir}/data/init/init.txt"
  cp -a "${src_dir}/data/init/d_init.custom.txt" "${df_conf_dir}/data/init/d_init.txt"
  
fi

# check for dfhack user directory
if [[ ! -d ${df_dir}/hack ]] ; then
  ln -s "${src_dir}/hack"                "${df_dir}/hack"
  ln -s "${src_dir}/stonesense"          "${df_dir}/stonesense"
  ln -s "${src_dir}/dfhack"              "${df_dir}/dfhack"
  ln -s "${src_dir}/dfhack-run"          "${df_dir}/dfhack-run"
  ln -s "${src_dir}/dfhack.init-example" "${df_dir}/dfhack.init-example"
  cp -r "${src_dir}/dfhack-config"       "${df_conf_dir}/dfhack-config"
  ln -s "${df_conf_dir}/dfhack-config"   "${df_dir}/dfhack-config"

  cp    "${src_dir}/dfhack.init"     "${df_conf_dir}/dfhack.init"
  ln -s "${df_conf_dir}/dfhack.init" "${df_dir}/dfhack.init"
fi

# workaround for bug in Debian/Ubuntu SDL patch
export SDL_DISABLE_LOCK_KEYS=1

cd ${df_dir}
exec ./dfhack-run "$@"

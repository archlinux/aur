[ -z "$INTEL_OPENVINO_DIR" ] && export INTEL_OPENVINO_DIR='/opt/intel/openvino'

export InferenceEngine_DIR="${INTEL_OPENVINO_DIR}/deployment_tools/inference_engine/share"
export ngraph_DIR="${INTEL_OPENVINO_DIR}/cmake"

if command -v python >/dev/null 2>&1
then
    _pyver=$(python -c 'import sys; print("%s.%s" %sys.version_info[0:2])')
    export PYTHONPATH="${PYTHONPATH:+${PYTHONPATH}:}${INTEL_OPENVINO_DIR}/python/python${_pyver}"
fi

export LD_LIBRARY_PATH="${LD_LIBRARY_PATH:+${LD_LIBRARY_PATH}:}${INTEL_OPENVINO_DIR}/deployment_tools/inference_engine/lib/intel64"
export LD_LIBRARY_PATH+=":${INTEL_OPENVINO_DIR}/deployment_tools/inference_engine/external/gna/lib"
export LD_LIBRARY_PATH+=":${INTEL_OPENVINO_DIR}/lib"

export LIBRARY_PATH="${LIBRARY_PATH:+${LIBRARY_PATH}:}${INTEL_OPENVINO_DIR}/deployment_tools/inference_engine/lib/intel64"
export LIBRARY_PATH+=":${INTEL_OPENVINO_DIR}/deployment_tools/inference_engine/external/gna/lib"
export LIBRARY_PATH+=":${INTEL_OPENVINO_DIR}/lib"

export CPATH="${CPATH:+${CPATH}:}${INTEL_OPENVINO_DIR}/deployment_tools/inference_engine/include"
export CPATH+=":${INTEL_OPENVINO_DIR}/deployment_tools/inference_engine/external/gna/include"
export CPATH+=":${INTEL_OPENVINO_DIR}/include"

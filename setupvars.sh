[ -z "$INTEL_OPENVINO_DIR" ] && export INTEL_OPENVINO_DIR='/opt/intel/openvino'

export InferenceEngine_DIR="${INTEL_OPENVINO_DIR}/runtime/cmake"
export ngraph_DIR="${INTEL_OPENVINO_DIR}/runtime/cmake"
export OpenVINO_DIR="${INTEL_OPENVINO_DIR}/runtime/cmake"

if command -v python >/dev/null 2>&1
then
    _pyver=$(python -c 'import sys; print("%s.%s" %sys.version_info[0:2])')
    export PYTHONPATH="${PYTHONPATH:+${PYTHONPATH}:}${INTEL_OPENVINO_DIR}/python/python${_pyver}"
fi

export LD_LIBRARY_PATH="${LD_LIBRARY_PATH:+${LD_LIBRARY_PATH}:}${INTEL_OPENVINO_DIR}/runtime/lib/intel64"

export LIBRARY_PATH="${LIBRARY_PATH:+${LIBRARY_PATH}:}${INTEL_OPENVINO_DIR}/runtime/lib/intel64"

export CPATH+=":${INTEL_OPENVINO_DIR}/runtime/include/ie"
export CPATH+=":${INTEL_OPENVINO_DIR}/runtime/include/ngraph"
export CPATH+=":${INTEL_OPENVINO_DIR}/runtime/include/openvino"

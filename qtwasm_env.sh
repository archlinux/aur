#/opt/qt6-wasm/emsdk/emsdk activate EMSDKVER

# load emsdk environment
# EM_CACHE issue: https://github.com/emscripten-core/emsdk/issues/535
EM_CACHE_PATH=~/.cache/qt6-wasm
export EM_CACHE=$EM_CACHE_PATH
source /opt/qt6-wasm/emsdk/emsdk_env.sh
export EM_CACHE=$EM_CACHE_PATH
echo "EM_CACHE (override) = $EM_CACHE"

# Export Qt6 WebAssembly bin Path
echo $PATH | grep -w "/opt/qt6-wasm/bin" > /dev/null
if [ $? -ne 0 ]; then
    export PATH=/opt/qt6-wasm/bin:$PATH
fi

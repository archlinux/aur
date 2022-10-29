if [[ ${CARCH} == "aarch64" ]]; then
  export ELECTRON_BUILDER_ARCH_ARGS="--arm64"
elif [[ ${CARCH} == "armv7h" ]]; then
  export ELECTRON_BUILDER_ARCH_ARGS="--armv7l"
elif [[ ${CARCH} == "i686" ]]; then
  export ELECTRON_BUILDER_ARCH_ARGS="--ia32"
elif [[ ${CARCH} == "x86_64" ]]; then
  export ELECTRON_BUILDER_ARCH_ARGS="--x64"
fi
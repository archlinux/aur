# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Stephen Zhang <zsrkmyn at gmail dot com>

_pkgname=pytorch
pkgbase="python-${_pkgname}"
pkgname=("${pkgbase}" "${pkgbase}-opt" "${pkgbase}-cuda" "${pkgbase}-opt-cuda")
pkgver=2.0.0rc4
_pkgver=2.0.0-rc4
pkgrel=1
_pkgdesc='Tensors and Dynamic neural networks in Python with strong GPU acceleration'
pkgdesc="${_pkgdesc}"
arch=('x86_64')
url="https://pytorch.org"
license=('BSD')
depends=('google-glog' 'gflags' 'opencv' 'openmp' 'nccl' 'pybind11' 'python' 'python-yaml' 'libuv'
         'python-numpy' 'protobuf' 'ffmpeg4.4' 'python-future' 'qt5-base' 'intel-oneapi-mkl'
         'python-typing_extensions')
makedepends=('python' 'python-setuptools' 'python-yaml' 'python-numpy' 'cmake' 'cuda'
             'cudnn' 'git' 'magma' 'ninja' 'pkgconfig' 'doxygen' 'onednn'
             'vulkan-headers' 'shaderc')
source=("${_pkgname}-${pkgver}::git+https://github.com/pytorch/pytorch.git#tag=v$_pkgver"
        # generated using parse-submodules
        "${pkgname}-ARM_NEON_2_x86_SSE::git+https://github.com/intel/ARM_NEON_2_x86_SSE.git"
        "${pkgname}-FP16::git+https://github.com/Maratyszcza/FP16.git"
        "${pkgname}-FXdiv::git+https://github.com/Maratyszcza/FXdiv.git"
        "${pkgname}-NNPACK::git+https://github.com/Maratyszcza/NNPACK.git"
        "${pkgname}-PeachPy::git+https://github.com/malfet/PeachPy.git"
        "${pkgname}-QNNPACK::git+https://github.com/pytorch/QNNPACK"
        "${pkgname}-VulkanMemoryAllocator::git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git"
        "${pkgname}-XNNPACK::git+https://github.com/google/XNNPACK.git"
        "${pkgname}-benchmark::git+https://github.com/google/benchmark.git"
        "${pkgname}-cpuinfo::git+https://github.com/pytorch/cpuinfo.git"
        "${pkgname}-cub::git+https://github.com/NVlabs/cub.git"
        "${pkgname}-cudnn-frontend::git+https://github.com/NVIDIA/cudnn-frontend.git"
        "${pkgname}-cutlass::git+https://github.com/NVIDIA/cutlass.git"
        "${pkgname}-eigen::git+https://gitlab.com/libeigen/eigen.git"
        "${pkgname}-enum34::git+https://github.com/PeachPy/enum34.git"
        "${pkgname}-fbgemm::git+https://github.com/pytorch/fbgemm"
        "${pkgname}-fbjni::git+https://github.com/facebookincubator/fbjni.git"
        "${pkgname}-flatbuffers::git+https://github.com/google/flatbuffers.git"
        "${pkgname}-fmt::git+https://github.com/fmtlib/fmt.git"
        "${pkgname}-foxi::git+https://github.com/houseroad/foxi.git"
        "${pkgname}-gemmlowp::git+https://github.com/google/gemmlowp.git"
        "${pkgname}-gloo::git+https://github.com/facebookincubator/gloo"
        "${pkgname}-googletest::git+https://github.com/google/googletest.git"
        "${pkgname}-ideep::git+https://github.com/intel/ideep"
        "${pkgname}-ios-cmake::git+https://github.com/Yangqing/ios-cmake.git"
        "${pkgname}-ittapi::git+https://github.com/intel/ittapi.git"
        "${pkgname}-json::git+https://github.com/nlohmann/json.git"
        "${pkgname}-kineto::git+https://github.com/pytorch/kineto"
        "${pkgname}-nccl::git+https://github.com/NVIDIA/nccl"
        "${pkgname}-onnx-tensorrt::git+https://github.com/onnx/onnx-tensorrt"
        "${pkgname}-onnx::git+https://github.com/onnx/onnx.git"
        "${pkgname}-pocketfft::git+https://github.com/mreineck/pocketfft"
        "${pkgname}-protobuf::git+https://github.com/protocolbuffers/protobuf.git"
        "${pkgname}-psimd::git+https://github.com/Maratyszcza/psimd.git"
        "${pkgname}-pthreadpool::git+https://github.com/Maratyszcza/pthreadpool.git"
        "${pkgname}-pybind11::git+https://github.com/pybind/pybind11.git"
        "${pkgname}-six::git+https://github.com/benjaminp/six.git"
        "${pkgname}-sleef::git+https://github.com/shibatch/sleef"
        "${pkgname}-tbb::git+https://github.com/01org/tbb"
        "${pkgname}-tensorpipe::git+https://github.com/pytorch/tensorpipe.git"
        "${pkgname}-zstd::git+https://github.com/facebook/zstd.git"
        fix_include_system.patch
        use-system-libuv.patch
        fix-building-for-torchvision.patch
        87773.patch
        disable-werror1.patch
        disable-werror2.patch
        disable-werror3.patch
        disable-werror4.patch
        ffmpeg4.4.patch)
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        '77f85808e480bd37dfb5f072d565466ae30a8f827f49ef97591fc2fc03bea54944eb1adeaa4a1e3466518a5640f575eda88d15b4c4d549a6f41f0bf4f2cfb086'
        '1f7ce593fa9fc62535ca1c3d85c996a73006cc614c7b7258160c3fc53cd52a1cfddcb18baf897f2e1223ecdfee52ca1471b91c9f845368ed6ac51b66f6e0e676'
        'fdea0b815d7750a4233c1d4668593020da017aea43cf4cb63b4c00d0852c7d34f0333e618fcf98b8df2185313a2089b8c2e9fe8ec3cfb0bf693598f9c61461a8'
        '0a8fc110a306e81beeb9ddfb3a1ddfd26aeda5e3f7adfb0f7c9bc3fd999c2dde62e0b407d3eca573097a53fd97329214e30e8767fb38d770197c7ec2b53daf18'
        '844d0b7b39777492a6d456fa845d5399f673b4bb37b62473393449c9ad0c29dca3c33276dc3980f2e766680100335c0acfb69d51781b79575f4da112d9c4018c'
        '985e331b2025e1ca5a4fba5188af0900f1f38bd0fd32c9173deb8bed7358af01e387d4654c7e0389e5f98b6f7cbed053226934d180b8b3b1270bdbbb36fc89b2'
        '96de2729b29c7ce3e4fdd8008f575d24c2c3ef9f85d6217e607902d7b870ac71b9290fde71e87a68d75bb75ef28eacbf5ce04e071146809ccf1e76a03f97b479'
        'eea86bbed0a37e1661035913536456f90e0cd1e687c7e4103011f0688bc8347b6fc2ff82019909c41e7c89ddbc3b80dde641e88abf406f4faebc71b0bb693d25'
        '6286b05d5b5143f117363e3ce3c7d693910f53845aeb6f501b3eea64aa71778cb2d7dcd4ac945d5321ef23b4da02446e86dedc6a9b6a998df4a7f3b1ce50550a')
options=('!lto')

get_pyver () {
  python -c 'import sys; print(str(sys.version_info[0]) + "." + str(sys.version_info[1]))'
}

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # generated using parse-submodules
  git submodule init

  git config submodule."android/libs/fbjni".url "${srcdir}/${pkgname}"-fbjni
  git config submodule."third_party/NNPACK".url "${srcdir}/${pkgname}"-NNPACK
  git config submodule."third_party/NNPACK_deps/FP16".url "${srcdir}/${pkgname}"-FP16
  git config submodule."third_party/NNPACK_deps/FXdiv".url "${srcdir}/${pkgname}"-FXdiv
  git config submodule."third_party/NNPACK_deps/psimd".url "${srcdir}/${pkgname}"-psimd
  git config submodule."third_party/NNPACK_deps/pthreadpool".url "${srcdir}/${pkgname}"-pthreadpool
  git config submodule."third_party/QNNPACK".url "${srcdir}/${pkgname}"-QNNPACK
  git config submodule."third_party/VulkanMemoryAllocator".url "${srcdir}/${pkgname}"-VulkanMemoryAllocator
  git config submodule."third_party/XNNPACK".url "${srcdir}/${pkgname}"-XNNPACK
  git config submodule."third_party/benchmark".url "${srcdir}/${pkgname}"-benchmark
  git config submodule."third_party/cpuinfo".url "${srcdir}/${pkgname}"-cpuinfo
  git config submodule."third_party/cub".url "${srcdir}/${pkgname}"-cub
  git config submodule."third_party/cudnn_frontend".url "${srcdir}/${pkgname}"-cudnn-frontend
  git config submodule."third_party/cutlass".url "${srcdir}/${pkgname}"-cutlass
  git config submodule."third_party/eigen".url "${srcdir}/${pkgname}"-eigen
  git config submodule."third_party/fbgemm".url "${srcdir}/${pkgname}"-fbgemm
  git config submodule."third_party/flatbuffers".url "${srcdir}/${pkgname}"-flatbuffers
  git config submodule."third_party/fmt".url "${srcdir}/${pkgname}"-fmt
  git config submodule."third_party/foxi".url "${srcdir}/${pkgname}"-foxi
  git config submodule."third_party/gemmlowp/gemmlowp".url "${srcdir}/${pkgname}"-gemmlowp
  git config submodule."third_party/gloo".url "${srcdir}/${pkgname}"-gloo
  git config submodule."third_party/googletest".url "${srcdir}/${pkgname}"-googletest
  git config submodule."third_party/ideep".url "${srcdir}/${pkgname}"-ideep
  git config submodule."third_party/ios-cmake".url "${srcdir}/${pkgname}"-ios-cmake
  git config submodule."third_party/ittapi".url "${srcdir}/${pkgname}"-ittapi
  git config submodule."third_party/kineto".url "${srcdir}/${pkgname}"-kineto
  git config submodule."third_party/nccl/nccl".url "${srcdir}/${pkgname}"-nccl
  git config submodule."third_party/neon2sse".url "${srcdir}/${pkgname}"-ARM_NEON_2_x86_SSE
  git config submodule."third_party/nlohmann".url "${srcdir}/${pkgname}"-json
  git config submodule."third_party/onnx".url "${srcdir}/${pkgname}"-onnx
  git config submodule."third_party/onnx-tensorrt".url "${srcdir}/${pkgname}"-onnx-tensorrt
  git config submodule."third_party/pocketfft".url "${srcdir}/${pkgname}"-pocketfft
  git config submodule."third_party/protobuf".url "${srcdir}/${pkgname}"-protobuf
  git config submodule."third_party/pybind11".url "${srcdir}/${pkgname}"-pybind11
  git config submodule."third_party/python-enum".url "${srcdir}/${pkgname}"-enum34
  git config submodule."third_party/python-peachpy".url "${srcdir}/${pkgname}"-PeachPy
  git config submodule."third_party/python-six".url "${srcdir}/${pkgname}"-six
  git config submodule."third_party/sleef".url "${srcdir}/${pkgname}"-sleef
  git config submodule."third_party/tbb".url "${srcdir}/${pkgname}"-tbb
  git config submodule."third_party/tensorpipe".url "${srcdir}/${pkgname}"-tensorpipe
  git config submodule."third_party/zstd".url "${srcdir}/${pkgname}"-zstd

  git -c protocol.file.allow=always submodule update --init --recursive

  # https://bugs.archlinux.org/task/64981
  patch -N torch/utils/cpp_extension.py "${srcdir}"/fix_include_system.patch

  # Use system libuv
  patch -Np1 -i "${srcdir}"/use-system-libuv.patch

  # fix https://github.com/pytorch/vision/issues/3695
  patch -Np1 -i "${srcdir}/fix-building-for-torchvision.patch"

  # Fix building against glog 0.6
  patch -Np1 -i "${srcdir}/87773.patch"

  # Disable -Werror
  patch -Np1 -d third_party/fbgemm -i "${srcdir}/disable-werror1.patch"
  patch -Np1 -d third_party/benchmark -i "${srcdir}/disable-werror2.patch"
  patch -Np1 -d third_party/ideep/mkl-dnn -i "${srcdir}/disable-werror3.patch"
  patch -Np1 -i "${srcdir}/disable-werror4.patch"

  # build against ffmpeg4.4
  patch -Np1 -i "${srcdir}/ffmpeg4.4.patch"

  cd "${srcdir}"

  cp -r "${_pkgname}-${pkgver}" "${_pkgname}-${pkgver}-opt"
  cp -r "${_pkgname}-${pkgver}" "${_pkgname}-${pkgver}-cuda"
  cp -r "${_pkgname}-${pkgver}" "${_pkgname}-${pkgver}-opt-cuda"

  export VERBOSE=1
  export PYTORCH_BUILD_VERSION="${pkgver}"
  export PYTORCH_BUILD_NUMBER=1

  # Check tools/setup_helpers/cmake.py, setup.py and CMakeLists.txt for a list of flags that can be set via env vars.
  export ATEN_NO_TEST=ON  # do not build ATen tests
  export USE_MKLDNN=ON
  export BUILD_CUSTOM_PROTOBUF=OFF
  export BUILD_CAFFE2=ON
  export BUILD_CAFFE2_OPS=ON
  # export BUILD_SHARED_LIBS=OFF
  export USE_FFMPEG=ON
  export USE_GFLAGS=ON
  export USE_GLOG=ON
  export USE_VULKAN=ON
  export BUILD_BINARY=ON
  export USE_OBSERVERS=ON
  export USE_OPENCV=ON
  # export USE_SYSTEM_LIBS=ON  # experimental, not all libs present in repos
  export USE_SYSTEM_NCCL=ON
  export NCCL_VERSION=$(pkg-config nccl --modversion)
  export NCCL_VER_CODE=$(sed -n 's/^#define NCCL_VERSION_CODE\s*\(.*\).*/\1/p' /usr/include/nccl.h)
  # export BUILD_SPLIT_CUDA=ON  # modern preferred build, but splits libs and symbols, ABI break
  # export USE_FAST_NVCC=ON  # parallel build with nvcc, spawns too many processes
  export USE_CUPTI_SO=ON  # make sure cupti.so is used as shared lib
  export CC=/usr/bin/gcc
  export CXX=/usr/bin/g++
  export CUDAHOSTCXX=/opt/cuda/bin/g++
  export CUDA_HOST_COMPILER="${CUDAHOSTCXX}"
  export CUDA_HOME=/opt/cuda
  # hide build-time CUDA devices
  export CUDA_VISIBLE_DEVICES=""
  export CUDNN_LIB_DIR=/usr/lib
  export CUDNN_INCLUDE_DIR=/usr/include
  export TORCH_NVCC_FLAGS="-Xfatbin -compress-all"
  # CUDA arch 8.7 is not supported (needed by Jetson boards, etc.)
  export TORCH_CUDA_ARCH_LIST="5.2;5.3;6.0;6.1;6.2;7.0;7.2;7.5;8.0;8.6;8.9;9.0;9.0+PTX"  #include latest PTX for future compat
  export OVERRIDE_TORCH_CUDA_ARCH_LIST="${TORCH_CUDA_ARCH_LIST}"
}

build() {
  echo "Building without cuda and without non-x86-64 optimizations"
  export USE_CUDA=0
  export USE_CUDNN=0
  cd "${srcdir}/${_pkgname}-${pkgver}"
  echo "add_definitions(-march=x86-64)" >> cmake/MiscCheck.cmake
  # this horrible hack is necessary because the current release
  # ships inconsistent CMake which tries to build objects before
  # thier dependencies, build twice when dependencies are available
  python setup.py build || python setup.py build

  echo "Building without cuda and with non-x86-64 optimizations"
  export USE_CUDA=0
  export USE_CUDNN=0
  cd "${srcdir}/${_pkgname}-${pkgver}-opt"
  echo "add_definitions(-march=haswell)" >> cmake/MiscCheck.cmake
  # same horrible hack as above
  python setup.py build || python setup.py build

  echo "Building with cuda and without non-x86-64 optimizations"
  export USE_CUDA=1
  export USE_CUDNN=1
  cd "${srcdir}/${_pkgname}-${pkgver}-cuda"
  echo "add_definitions(-march=x86-64)" >> cmake/MiscCheck.cmake
  # same horrible hack as above
  python setup.py build || python setup.py build

  echo "Building with cuda and with non-x86-64 optimizations"
  export USE_CUDA=1
  export USE_CUDNN=1
  cd "${srcdir}/${_pkgname}-${pkgver}-opt-cuda"
  echo "add_definitions(-march=haswell)" >> cmake/MiscCheck.cmake
  # same horrible hack as above
  python setup.py build || python setup.py build
}

_package() {
  # Prevent setup.py from re-running CMake and rebuilding
  sed -e 's/RUN_BUILD_DEPS = True/RUN_BUILD_DEPS = False/g' -i setup.py

  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  pytorchpath="usr/lib/python$(get_pyver)/site-packages/torch"
  install -d "${pkgdir}/usr/lib"

  # put CMake files in correct place
  mv "${pkgdir}/${pytorchpath}/share/cmake" "${pkgdir}/usr/lib/cmake"

  # put C++ API in correct place
  mv "${pkgdir}/${pytorchpath}/include" "${pkgdir}/usr/include"
  find "${pkgdir}/${pytorchpath}"/lib/ -type f,l \( -iname '*.so' -or -iname '*.so*' \) -print0 | while read -rd $'\0' _lib; do
    mv "${_lib}" "${pkgdir}"/usr/lib/
  done

  # clean up duplicates
  # TODO: move towards direct shared library dependecy of:
  #   c10, caffe2, libcpuinfo, CUDA RT, gloo, GTest, Intel MKL,
  #   NVRTC, ONNX, protobuf, libthreadpool, QNNPACK
  rm -rf "${pkgdir}/usr/include/pybind11"

  # python module is hardcoded to look there at runtime
  ln -s /usr/include "${pkgdir}/${pytorchpath}/include"
  find "${pkgdir}"/usr/lib -maxdepth 1 -type f,l \( -iname '*.so' -or -iname '*.so*' \) -print0 | while read -rd $'\0' _lib; do
    ln -s ${_lib#"$pkgdir"} "${pkgdir}/${pytorchpath}/lib/"
  done
}

package_python-pytorch() {
  pkgdesc="${_pkgdesc}"

  cd "${srcdir}/${_pkgname}-${pkgver}"
  _package
}

package_python-pytorch-opt() {
  pkgdesc="${_pkgdesc} (with AVX2 CPU optimizations)"
  conflicts=(python-pytorch)
  provides=(python-pytorch)

  cd "${srcdir}/${_pkgname}-${pkgver}-opt"
  _package
}

package_python-pytorch-cuda() {
  pkgdesc="${_pkgdesc} (with CUDA)"
  depends+=(cuda cudnn magma onednn)
  conflicts=(python-pytorch)
  provides=(python-pytorch)

  cd "${srcdir}/${_pkgname}-${pkgver}-cuda"
  _package
}

package_python-pytorch-opt-cuda() {
  pkgdesc="${_pkgdesc} (with CUDA and AVX2 CPU optimizations)"
  depends+=(cuda cudnn magma onednn)
  conflicts=(python-pytorch)
  provides=(python-pytorch python-pytorch-cuda)

  cd "${srcdir}/${_pkgname}-${pkgver}-opt-cuda"
  _package
}

# vim:set ts=2 sw=2 et:

# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Stephen Zhang <zsrkmyn at gmail dot com>

pkgbase=python-pytorch
pkgname=("python-pytorch" "python-pytorch-cuda")
_pkgname="pytorch"
pkgver=1.10.0
_pkgver=1.10.0
pkgrel=4
_pkgdesc='Tensors and Dynamic neural networks in Python with strong GPU acceleration'
pkgdesc="${_pkgdesc}"
arch=('x86_64')
url="https://pytorch.org"
license=('BSD')
depends=('google-glog' 'gflags' 'opencv' 'openmp' 'nccl' 'pybind11' 'python' 'python-yaml' 'libuv'
         'python-numpy' 'protobuf' 'ffmpeg' 'python-future' 'qt5-base' 'onednn' 'intel-mkl'
         'python-typing_extensions')
makedepends=('python' 'python-setuptools' 'python-yaml' 'python-numpy' 'cmake' 'cuda'
             'cudnn' 'git' 'magma' 'ninja' 'pkgconfig' 'doxygen')
source=("${_pkgname}-${pkgver}::git+https://github.com/pytorch/pytorch.git#tag=v$_pkgver"
        # generated using parse-submodules
        "${pkgname}-ios-cmake::git+https://github.com/Yangqing/ios-cmake.git"
        "${pkgname}-pthreadpool::git+https://github.com/Maratyszcza/pthreadpool.git"
        "${pkgname}-FP16::git+https://github.com/Maratyszcza/FP16.git"
        "${pkgname}-NNPACK::git+https://github.com/Maratyszcza/NNPACK.git"
        "${pkgname}-FXdiv::git+https://github.com/Maratyszcza/FXdiv.git"
        "${pkgname}-PeachPy::git+https://github.com/Maratyszcza/PeachPy.git"
        "${pkgname}-cub::git+https://github.com/NVlabs/cub.git"
        "${pkgname}-psimd::git+https://github.com/Maratyszcza/psimd.git"
        "${pkgname}-cpuinfo::git+https://github.com/pytorch/cpuinfo.git"
        "${pkgname}-enum34::git+https://github.com/PeachPy/enum34.git"
        "${pkgname}-ideep::git+https://github.com/intel/ideep"
        "${pkgname}-QNNPACK::git+https://github.com/pytorch/QNNPACK"
        "${pkgname}-foxi::git+https://github.com/houseroad/foxi.git"
        "${pkgname}-ARM_NEON_2_x86_SSE::git+https://github.com/intel/ARM_NEON_2_x86_SSE.git"
        "${pkgname}-six::git+https://github.com/benjaminp/six.git"
        "${pkgname}-eigen-git-mirror::git+https://github.com/eigenteam/eigen-git-mirror.git"
        "${pkgname}-gloo::git+https://github.com/facebookincubator/gloo"
        "${pkgname}-nccl::git+https://github.com/NVIDIA/nccl"
        "${pkgname}-gemmlowp::git+https://github.com/google/gemmlowp.git"
        "${pkgname}-kineto::git+https://github.com/pytorch/kineto"
        "${pkgname}-sleef::git+https://github.com/shibatch/sleef"
        "${pkgname}-onnx-tensorrt::git+https://github.com/onnx/onnx-tensorrt"
        "${pkgname}-pocketfft::git+https://github.com/mreineck/pocketfft"
        "${pkgname}-cudnn-frontend::git+https://github.com/NVIDIA/cudnn-frontend.git"
        "${pkgname}-benchmark::git+https://github.com/google/benchmark.git"
        "${pkgname}-tbb::git+https://github.com/01org/tbb"
        "${pkgname}-XNNPACK::git+https://github.com/google/XNNPACK.git"
        "${pkgname}-fbjni::git+https://github.com/facebookincubator/fbjni.git"
        "${pkgname}-tensorpipe::git+https://github.com/pytorch/tensorpipe.git"
        "${pkgname}-pybind11::git+https://github.com/pybind/pybind11.git"
        "${pkgname}-breakpad::git+https://github.com/driazati/breakpad.git"
        "${pkgname}-fbgemm::git+https://github.com/pytorch/fbgemm"
        "${pkgname}-googletest::git+https://github.com/google/googletest.git"
        "${pkgname}-zstd::git+https://github.com/facebook/zstd.git"
        "${pkgname}-onnx::git+https://github.com/onnx/onnx.git"
        "${pkgname}-protobuf::git+https://github.com/protocolbuffers/protobuf.git"
        "${pkgname}-fmt::git+https://github.com/fmtlib/fmt.git"
        https://github.com/oneapi-src/oneDNN/commit/1fe0f2594a1bfc6386fd8f6537f971d5ae9c1214.patch
        fix_old_nnapi_lite_interpreter_config.patch
        fix-jit-frontend-nullptr-deref.patch
        fix_include_system.patch
        use-system-libuv.patch
        fix-building-for-torchvision.patch
        fix_c10.patch
        66219.patch)
sha256sums=('SKIP'
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
            '7728e99500d8034c837bbbe2b48b780d8563de4e56fff38a96766caad08cce05'
            '21476edfa61573892a325cb8a91e13f601142e39b34e24e4575d2cdebb063b3f'
            'c272684a4c747f034163fcfd9dbb7264d5fe821dd25a060f0b791760ad0083ae'
            '557761502bbd994d9795bef46779e4b8c60ba0b45e7d60841f477d3b7f28a00a'
            'cd9ac4aaa9f946ac5eafc57cf66c5c16b3ea7ac8af32c2558fad0705411bb669'
            '600bd6a4bbcec9f99ab815d82cee1c2875530b2b75f4010da5ba72ce9bf31aff'
            '4d0d7da4a3fb099ed75f3007559fad04ac96eed87c523b274fb3bb6020e6b9b8'
            'd86efbe915386989d75d313fc76785e6d9c5638b983f17e98cca32174ac1fcee')

get_pyver () {
  python -c 'import sys; print(str(sys.version_info[0]) + "." + str(sys.version_info[1]))'
}

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # generated using parse-submodules
  git submodule init

  git config submodule."third_party/pybind11".url "${srcdir}/${pkgname}"-pybind11
  git config submodule."third_party/cub".url "${srcdir}/${pkgname}"-cub
  git config submodule."third_party/eigen".url "${srcdir}/${pkgname}"-eigen-git-mirror
  git config submodule."third_party/googletest".url "${srcdir}/${pkgname}"-googletest
  git config submodule."third_party/benchmark".url "${srcdir}/${pkgname}"-benchmark
  git config submodule."third_party/protobuf".url "${srcdir}/${pkgname}"-protobuf
  git config submodule."third_party/ios-cmake".url "${srcdir}/${pkgname}"-ios-cmake
  git config submodule."third_party/NNPACK".url "${srcdir}/${pkgname}"-NNPACK
  git config submodule."third_party/gloo".url "${srcdir}/${pkgname}"-gloo
  git config submodule."third_party/NNPACK_deps/pthreadpool".url "${srcdir}/${pkgname}"-pthreadpool
  git config submodule."third_party/NNPACK_deps/FXdiv".url "${srcdir}/${pkgname}"-FXdiv
  git config submodule."third_party/NNPACK_deps/FP16".url "${srcdir}/${pkgname}"-FP16
  git config submodule."third_party/NNPACK_deps/psimd".url "${srcdir}/${pkgname}"-psimd
  git config submodule."third_party/zstd".url "${srcdir}/${pkgname}"-zstd
  git config submodule."third_party/cpuinfo".url "${srcdir}/${pkgname}"-cpuinfo
  git config submodule."third_party/python-enum".url "${srcdir}/${pkgname}"-enum34
  git config submodule."third_party/python-peachpy".url "${srcdir}/${pkgname}"-PeachPy
  git config submodule."third_party/python-six".url "${srcdir}/${pkgname}"-six
  git config submodule."third_party/onnx".url "${srcdir}/${pkgname}"-onnx
  git config submodule."third_party/onnx-tensorrt".url "${srcdir}/${pkgname}"-onnx-tensorrt
  git config submodule."third_party/sleef".url "${srcdir}/${pkgname}"-sleef
  git config submodule."third_party/ideep".url "${srcdir}/${pkgname}"-ideep
  git config submodule."third_party/nccl/nccl".url "${srcdir}/${pkgname}"-nccl
  git config submodule."third_party/gemmlowp/gemmlowp".url "${srcdir}/${pkgname}"-gemmlowp
  git config submodule."third_party/QNNPACK".url "${srcdir}/${pkgname}"-QNNPACK
  git config submodule."third_party/neon2sse".url "${srcdir}/${pkgname}"-ARM_NEON_2_x86_SSE
  git config submodule."third_party/fbgemm".url "${srcdir}/${pkgname}"-fbgemm
  git config submodule."third_party/foxi".url "${srcdir}/${pkgname}"-foxi
  git config submodule."third_party/tbb".url "${srcdir}/${pkgname}"-tbb
  git config submodule."android/libs/fbjni".url "${srcdir}/${pkgname}"-fbjni
  git config submodule."third_party/XNNPACK".url "${srcdir}/${pkgname}"-XNNPACK
  git config submodule."third_party/fmt".url "${srcdir}/${pkgname}"-fmt
  git config submodule."third_party/tensorpipe".url "${srcdir}/${pkgname}"-tensorpipe
  git config submodule."third_party/cudnn_frontend".url "${srcdir}/${pkgname}"-cudnn-frontend
  git config submodule."third_party/kineto".url "${srcdir}/${pkgname}"-kineto
  git config submodule."third_party/pocketfft".url "${srcdir}/${pkgname}"-pocketfft
  git config submodule."third_party/breakpad".url "${srcdir}/${pkgname}"-breakpad

  git submodule update --init --recursive

  # https://bugs.archlinux.org/task/64981
  patch -N torch/utils/cpp_extension.py "${srcdir}"/fix_include_system.patch

  # Use system libuv
  patch -Np1 -i "${srcdir}"/use-system-libuv.patch

  # fix https://github.com/pytorch/vision/issues/3695
  patch -Np1 -i "${srcdir}/fix-building-for-torchvision.patch"

  # cuda 11.4.1 fix
  patch -Np1 -i "${srcdir}/fix_c10.patch"

  # https://discuss.pytorch.org/t/about-build-android-sh-lite-and-nnapi/133581
  patch -Np1 -i "${srcdir}/fix_old_nnapi_lite_interpreter_config.patch"

  # fix nullptr dereference
  patch -Np1 -i "${srcdir}/fix-jit-frontend-nullptr-deref.patch"

  # disable vec tests
  sed -e '/set(ATen_VEC_TEST_SRCS ${ATen_VEC_TEST_SRCS} PARENT_SCOPE)/d' -i aten/CMakeLists.txt

  # https://github.com/pytorch/pytorch/issues/67153, https://github.com/pytorch/pytorch/pull/66219
  patch -Np1 -i "${srcdir}/66219.patch" 

  # fix ideep/mkl-dnn
  patch -Np1 -d third_party/ideep/mkl-dnn -i "${srcdir}/1fe0f2594a1bfc6386fd8f6537f971d5ae9c1214.patch"

  # remove local nccl
  rm -rf third_party/nccl/nccl
  # also remove path from nccl module, so it's not checked
  sed -e '/path = third_party\/nccl\/nccl/d' -i ./.gitmodules

  # fix build with google-glog 0.5 https://github.com/pytorch/pytorch/issues/58054
  sed -e '/namespace glog_internal_namespace_/d' -e 's|::glog_internal_namespace_||' -i c10/util/Logging.cpp

  cd "${srcdir}"

  cp -r "${_pkgname}-${pkgver}" "${_pkgname}-${pkgver}-cuda"

  export VERBOSE=1
  export PYTORCH_BUILD_VERSION="${pkgver}"
  export PYTORCH_BUILD_NUMBER=1

  # Check tools/setup_helpers/cmake.py, setup.py and CMakeLists.txt for a list of flags that can be set via env vars.
  export ATEN_NO_TEST=ON  # do not build ATen tests
  export USE_MKLDNN=ON
  export BUILD_CUSTOM_PROTOBUF=OFF
  # export BUILD_SHARED_LIBS=OFF
  export USE_FFMPEG=ON
  export USE_GFLAGS=ON
  export USE_GLOG=ON
  export BUILD_BINARY=ON
  export USE_OPENCV=ON
  # export USE_SYSTEM_LIBS=ON  # experimental, not all libs present in repos
  export USE_SYSTEM_NCCL=ON
  export NCCL_VERSION=$(pkg-config nccl --modversion)
  export NCCL_VER_CODE=$(sed -n 's/^#define NCCL_VERSION_CODE\s*\(.*\).*/\1/p' /usr/include/nccl.h)
  # export BUILD_SPLIT_CUDA=ON  # modern preferred build, but splits libs and symbols, ABI break
  # export USE_FAST_NVCC=ON  # parallel build with nvcc, spawns too many processes
  export USE_CUPTI_SO=ON  # make sure cupti.so is used as shared lib
  export CUDAHOSTCXX=/usr/bin/g++
  export CUDA_HOST_COMPILER="${CUDAHOSTCXX}"
  export CUDA_HOME=/opt/cuda
  # hide buildt-time CUDA devices
  export CUDA_VISIBLE_DEVICES=""
  export CUDNN_LIB_DIR=/usr/lib
  export CUDNN_INCLUDE_DIR=/usr/include
  export TORCH_NVCC_FLAGS="-Xfatbin -compress-all"
  export TORCH_CUDA_ARCH_LIST="5.2;6.0;6.2;7.0;7.2;7.5;8.0;8.6;8.6+PTX"  #include latest PTX for future compat
  export OVERRIDE_TORCH_CUDA_ARCH_LIST="${TORCH_CUDA_ARCH_LIST}"
}

build() {
  echo "Building without cuda and with non-x86-64 optimizations"
  export USE_CUDA=0
  export USE_CUDNN=0
  cd "${srcdir}/${_pkgname}-${pkgver}"
  echo "add_definitions(-march=haswell)" >> cmake/MiscCheck.cmake
  # this horrible hack is necessary because the current release
  # ships inconsistent CMake which tries to build objects before
  # thier dependencies, build twice when dependencies are available
  python setup.py build || python setup.py build


  echo "Building with cuda and with non-x86-64 optimizations"
  export USE_CUDA=1
  export USE_CUDNN=1
  cd "${srcdir}/${_pkgname}-${pkgver}-cuda"
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
  mv "${pkgdir}/${pytorchpath}/lib"/*.so* "${pkgdir}/usr/lib/"

  # clean up duplicates
  # TODO: move towards direct shared library dependecy of:
  #   c10, caffe2, libcpuinfo, CUDA RT, gloo, GTest, Intel MKL,
  #   NVRTC, ONNX, protobuf, libthreadpool, QNNPACK
  rm -rf "${pkgdir}/usr/include/pybind11"

  # python module is hardcoded to look there at runtime
  ln -s /usr/include "${pkgdir}/${pytorchpath}/include"
  find "${pkgdir}"/usr/lib -type f -name "*.so*" -print0 | while read -rd $'\0' _lib; do
    ln -s ${_lib#"$pkgdir"} "${pkgdir}/${pytorchpath}/lib/"
  done
}

package_python-pytorch() {
  pkgdesc="${_pkgdesc} (with AVX2 CPU optimizations)"
  replaces=(python-pytorch-opt)
  cd "${srcdir}/${_pkgname}-${pkgver}"
  _package
}

package_python-pytorch-cuda() {
  pkgdesc="${_pkgdesc} (with CUDA and AVX2 CPU optimizations)"
  depends+=(cuda cudnn magma)
  replaces=(python-pytorch-opt-cuda)
  conflicts=(python-pytorch)
  provides=(python-pytorch)

  cd "${srcdir}/${_pkgname}-${pkgver}-cuda"
  _package
}

# vim:set ts=2 sw=2 et:

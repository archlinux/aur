startup --output_user_root=${srcdir}/base

build --repository_cache=${srcdir}/repo
build --disk_cache=${srcdir}/cache
build --sandbox_base=${srcdir}/sandbox

build --action_env=CLANG_COMPILER_PATH="/usr/lib/llvm20/bin/clang-20"
build --action_env=CLANG_CUDA_COMPILER_PATH="/usr/lib/llvm20/bin/clang-20"
build --repo_env=HERMETIC_CUDA_VERSION=13.1.1
build --repo_env=HERMETIC_CUDNN_VERSION=9.18.1.3
build --repo_env=HERMETIC_PYTHON_VERSION=3.14
build --verbose_failures=true
build --define=xnn_enable_avxvnniint8=false
build --action_env=CLANG_COMPILER_PATH="/usr/lib/llvm20/bin/clang-20"
build --config=avx_posix
build --config=build_cuda_with_nvcc
build --config=clang
build --config=cuda13
build --config=cuda_clang_local
build --config=cuda_libraries_from_stubs
build --config=mkl_open_source_only
build --repo_env=BAZEL_COMPILER="/usr/lib/llvm20/bin/clang-20"
build --repo_env=CC="/usr/lib/llvm20/bin/clang-20"
build --repo_env=CXX="/usr/lib/llvm20/bin/clang++"

build --jobs=12
build --local_resources=cpu=12

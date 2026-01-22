# Release notes https://rocm.docs.amd.com/en/latest/about/release-notes.html
amdgpu_repo='https://repo.radeon.com/amdgpu/7.2/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/7.2'
opencl_lib='opt/rocm-7.2/opencl/lib'
rocm_lib='opt/rocm-7.2/lib'
hip_lib='opt/rocm-7.2/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd-dev
pkgdesc="ROCm extra runtime and developer packages. This package needs 14.03GB of disk space."
pkgver=7.2.0
pkgrel=1
epoch=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('opencl-amd' 'suitesparse' 'blas' 'lapack')
provides=('composablekernel' 'hip-doc' 'hip-samples' 'hipcc' 'rocm-llvm' 'rocblas' 'rocsolver' 'half' 'hipblas' 'hipblas-common' 'hipblaslt' 'hiprand' 'rocdecode' 'rocpydecode' 'rocjpeg' 'rocprim' 'hipcub' 'rocfft' 'hipfft' 'hipfort' 'hipify-clang' 'hipsolver' 'rocsparse' 'hipsparse' 'hipsparselt' 'hiptensor' 'openmp-extras-dev'
'rccl' 'rocrand' 'rocal' 'rocalution' 'rocm-hip-libraries' 'rocthrust' 'rocprofiler-compute' 'rocprofiler-debug' 'rocprofiler-systems' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma' 'rocprofiler-sdk' 'rocprofiler-sdk-roctx' 'rocprofiler-sdk-rocpd' 'rocm-developer-tools' 'rocshmem' 'migraphx' 'miopen' 'miopen-hip' 'mivisionx' 'rocm-ml-libraries'
'rocm-ml-sdk' 'rpp')
conflicts=('composablekernel' 'hip-doc' 'hip-samples' 'hipcc' 'rocm-llvm' 'rocblas' 'rocsolver' 'hipblas' 'hipblas-common' 'hipblaslt' 'hiprand' 'rocdecode' 'rocpydecode' 'rocjpeg' 'rocprim' 'hipcub' 'rocfft' 'hipfft' 'hipfort' 'hipify-clang' 'hipsolver' 'rocsparse' 'hipsparse' 'hipsparselt' 'hiptensor' 'openmp-extras-dev'
'rccl' 'rocrand' 'rocal' 'rocalution' 'rocm-hip-libraries' 'rocthrust' 'rocprofiler-compute' 'rocprofiler-debug' 'rocprofiler-systems' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma' 'rocprofiler-sdk' 'rocprofiler-sdk-roctx' 'rocprofiler-sdk-rocpd' 'rocm-developer-tools' 'rocshmem' 'migraphx' 'miopen' 'miopen-hip' 'mivisionx' 'rocm-ml-libraries'
'rocm-ml-sdk' 'rpp')
options=('!strip')

source=(
# ROCm runtime
"https://repo.radeon.com/rocm/apt/7.2/pool/main/h/half/half_1.12.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/h/hiprand/hiprand_3.1.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/h/hiprand-dev/hiprand-dev_3.1.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/h/hipblas/hipblas_3.2.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/h/hipblas-dev/hipblas-dev_3.2.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/h/hipblas-common-dev/hipblas-common-dev_1.4.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/h/hipfft/hipfft_1.0.22.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/h/hipfft-dev/hipfft-dev_1.0.22.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/h/hipsolver/hipsolver_3.2.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/h/hipsolver-dev/hipsolver-dev_3.2.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/h/hipsparse/hipsparse_4.2.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/h/hipsparse-dev/hipsparse-dev_4.2.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/h/hipsparselt/hipsparselt_0.2.6.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/h/hipsparselt-dev/hipsparselt-dev_0.2.6.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/h/hiptensor/hiptensor_2.2.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/h/hiptensor-dev/hiptensor-dev_2.2.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rocfft/rocfft_1.0.36.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rocfft-dev/rocfft-dev_1.0.36.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rocrand/rocrand_4.2.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rocrand-dev/rocrand-dev_4.2.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rpp/rpp_2.2.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rpp-dev/rpp-dev_2.2.0.70200-43~24.04_amd64.deb"
# Missing from Ubuntu release
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rocal/rocal_2.5.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rocal-dev/rocal-dev_2.5.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rocdecode/rocdecode_1.5.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rocdecode-dev/rocdecode-dev_1.5.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rocpydecode/rocpydecode_0.8.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rocjpeg/rocjpeg_1.3.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rocjpeg-dev/rocjpeg-dev_1.3.0.70200-43~24.04_amd64.deb"
# ROCm runtime or dev
"https://repo.radeon.com/rocm/apt/7.2/pool/main/c/composablekernel-dev/composablekernel-dev_1.2.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/h/hipify-clang/hipify-clang_22.0.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/o/openmp-extras-runtime/openmp-extras-runtime_20.70.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rocm-cmake/rocm-cmake_0.14.0.70200-43~24.04_amd64.deb"
# Runtime but big size or dependencies of a big sized package
"https://repo.radeon.com/rocm/apt/7.2/pool/main/h/hipblaslt/hipblaslt_1.2.1.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/h/hipblaslt-dev/hipblaslt-dev_1.2.1.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/m/miopen-hip/miopen-hip_3.5.1.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/m/miopen-hip-dev/miopen-hip-dev_3.5.1.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/m/migraphx/migraphx_2.15.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/m/migraphx-dev/migraphx-dev_2.15.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/m/mivisionx/mivisionx_3.5.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/m/mivisionx-dev/mivisionx-dev_3.5.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rccl/rccl_2.27.7.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rccl-dev/rccl-dev_2.27.7.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rocblas/rocblas_5.2.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rocblas-dev/rocblas-dev_5.2.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rocsparse/rocsparse_4.2.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rocsparse-dev/rocsparse-dev_4.2.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rocalution/rocalution_4.1.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rocalution-dev/rocalution-dev_4.1.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rocsolver/rocsolver_3.32.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rocsolver-dev/rocsolver-dev_3.32.0.70200-43~24.04_amd64.deb"
# ROCm dev
"https://repo.radeon.com/rocm/apt/7.2/pool/main/h/hipcc/hipcc_1.1.1.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/h/hip-dev/hip-dev_7.2.26015.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/h/hip-samples/hip-samples_7.2.26015.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/h/hip-doc/hip-doc_7.2.26015.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/h/hipcub-dev/hipcub-dev_4.2.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/h/hipfort-dev/hipfort-dev_0.7.1.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/o/openmp-extras-dev/openmp-extras-dev_20.70.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rocm-llvm/rocm-llvm_22.0.0.26014.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rocprim-dev/rocprim-dev_4.2.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rocthrust-dev/rocthrust-dev_4.2.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rocwmma-dev/rocwmma-dev_2.2.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rocprofiler-sdk/rocprofiler-sdk_1.1.0-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rocprofiler-sdk-rocpd/rocprofiler-sdk-rocpd_1.1.0-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rocprofiler-sdk-roctx/rocprofiler-sdk-roctx_1.1.0-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rocprofiler-compute/rocprofiler-compute_3.4.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rocprofiler-systems/rocprofiler-systems_1.3.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rocshmem-dev/rocshmem-dev_3.2.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/roctracer/roctracer_4.1.70200.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/roctracer-dev/roctracer-dev_4.1.70200.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/t/transferbench-dev/transferbench-dev_1.64.00.70200-43~24.04_amd64.deb"
)

sha256sums=(
"a2d832972f2ef5ef0841e193c4c9286401498c001c3a4096b4047faedde3684c"
"204e07f30be525cbfd1c96f2c6d593b72d8c03943f17b81ef66b10b27e063d04"
"40108d244525a18dd73607bf14077a40ab404760487c4381a2f52b03006679a7"
"837e7b11365e71ad3316b7167911504795a8477141e17ebed98cc4cd86046bd9"
"f093c8f895fd62f2e72ad16da9444e6940e7ffa9f4aabcb8d58ac26e7e62f077"
"0c89dde907a94ac008c298849f2a805c630711c407f515420997df650f319664"
"c62377fcb6b56c1c3a7b600b029a7a6b07d41e580fc60deeb7dd50a25384dd63"
"e064902454d3a95bd4cd49651e2cfc2568f56934c213d42cd487ac4171b95803"
"ee3e7cef6a3e324576441d5b14d518092c2766a4db071848df9fc9792e58fc65"
"091305ae1433a206bde5ea9de996df6d170247a7a4ae2234412aa9a90eb542f6"
"7cd67c76d80fbe054c22300c8ec3a30806fe99667e65d1eb502252171de023ad"
"e5f3b80ba816e87b9f9dc94e211663a5c06ae8e756ef6e3a1544460e035ad60e"
"5b21029bddddaacb4010131c9a8f3f1b82813bec7308c700a8b4ab58faa29d80"
"53f9def5edcc2671bf241fdaacfcfeffb2fe501f2700c533d19eed38658e4664"
"7fc578309b774087465efedb5b3fc0b29a2f6e1327d70f4ade9545fe97d84f46"
"c84fc4300483d0cca1f65d53357e599d8dd9005432180a203554353f6db15682"
"d584bb500ba4c7c4158672a2c86a7f76e29a32466a6d95aba3946862bb69dd4e"
"0d4c1a15b5220d535030226d8b41456c7cb73c48fbd0265c2fae18082512d2f0"
"661d902bae191e3eda4bbc126c6593e30b346737b2e2f9f9bf65097e66500a75"
"d566b5b04cbfa9a6e07a7cb8e90ba9bec070348ee6a3f521b32c7ba1fcff5c99"
"bfbeaad235c418540dc5f4d4b7c9aee36a5eaee4966b6ae23dcfe5150c1dc507"
"d2e3a9c6a467920ad54a051c076bbe11486a5e93ef4f946e781a80d7ec11ab7f"
"11daa7be22a637f84e50d9069e1c525701387308fe370fd888b27858ebf8c2b5"
"e72fd03ebdf63620ec6914acdf26b41b027d663867053903849a84777def1206"
"6af05469174657403b51c2a9ba94a57d147ef43c67c83a5dbe1c38aef30987e4"
"b47829e391b60ad9c33eb0ef02b12532bf00d2c15b69236015c2b567625b7cfe"
"cb10da02a116b6f2e11ada3357cde306f34ce9bb3d140d9f073c4e9ddcf0d948"
"002f4d9fc5b3b14e50dfceecd78282550da8d5664e310b9aba27a5325f425ec7"
"d10ab54879c96d25a5294aa06ef2f2a13c8aeb220768e7c476ee80621d9e449c"
"a5ef3880408831256da592286334203d250d5afbfea597e005d006cc23c7e6e1"
"7b476c88e809fa433c6971d034aca45b18405b918ea0c706aa0bc50733c85f4a"
"af67fcd97ab8266817bed6c78ff9b4bd769a2af97ca9e224c8c939873f9d0f9d"
"9f293590c13659269a9f4623682f51fb674d017365c0f21e68afd6e6841f825d"
"b34184c1dc0a590b6f2b149f423891fd416730deacfd4e4991cc328aa95d60f4"
"06d4d11b80e9ea237b045f880d746cabda77494d6936354e2f9bfe34f81e189f"
"6c3105d785a7c339783920663dc51a240ff29a711d99e54ccf0d3848b9c83fd4"
"a1dcc98e847fd419a57c1fed4917ccb00f1f4093215ec3ebca267cf4c3fd2169"
"b06d48c3097bfb9063eb0da6fc47d79309f2cb0b5ebd7170c7d375aef4f4f9a0"
"d99155727eae05a41f631c179dc1092724c1be256172b31aa5c487247c192072"
"51281e4336c641729ba82c8513286cf4780a8a7ffcfab345d18568a357c9d765"
"a01be3f6968579c2b8f945543e3186d5c6bb9227cc3702bc0037fb9716c08752"
"ba831fd38bbe7a733721185cbe505c887783a517b05a31bc5bad5ecb66fa8bda"
"899c16d317f6ce110066c2c20296c768bd97a1bf81a7245124d87734f9eac13a"
"737275bf8630063d02981ed17cbc155b9b1b6c296379757a39d78ee0e5fcbc13"
"a77f10126e0c3be83415af26182289a3d5e74acd44718eb12d6efc95adf90890"
"1276b82f219a6a07e16ece6ada701c817747e849c39618c9ffcc15781e677e4d"
"912f9321f711964ac97bcf815532ba4dc7ee73a3f8579c750da66715e1dc4651"
"30e955563b8e1f1d281d2db863c15c0e79ec12789d0597cc65b6d237d927592c"
"7849e6550b2971b9bf6b2f2302cde90dc10039fedddb8923f5ca97083674d4dc"
"cbe1e330a6a43b213f8218cd1842c94807872c51f9423ee30512388748f2adde"
"e0ff230d21cca984a9ec97bf157983706135ceaadd665c4ce006539e978c448d"
"7054af6c81d004cc5b497f047c41f50f794af23d2593202443d3e82f7df82f81"
"a85545d7b05b2d70837ce8a2bc7ea942a45300daed122ff7b2e317b1c8e8e14f"
"fddec26cc111db58e892edde5b42722b9c8f387731d622e8d4e34c7a1f00326e"
"350d81d56ece83d5a5aed4314f942d909566e05f16d6e5ac92db705a28a08435"
"43771c8f178109a32d5b23b9988df6289da6854feabae89b53e1bd31d723adc3"
"189a8dcfdce8f4d2b6c152e3b919efd792aa78ac32eaad709d6740f98953d5ab"
"d6da8fbca36dbab46a0915ebae851169100bd0ffaf47f298afb03ccf0b86c3d3"
"c36ef1ad37e626c09e4a491782ae0f959f33d181dec9445d1a75556f52b39c02"
"de2def3378d4a1ad69eee699e22d9b0cb34d8e77484932bf9310ae9ebe1eb31c"
"6a1b5243b40a3a61d8c9709e4a2e5c3178ef0491e3b69df74d8d19d699e5243d"
"a14e6055076298ff25c0ff91347fcc85027afcfc5435a8fae8b16c2ddb1d33a9"
"b8ffb6a27455f6900268882a0caf680406af1023c1af1f18e6e399c14ec16db9"
"814f4fe7323d1130ce7d7090c8e3d109b5d7f8300a87424c1971a9ccfeb8fdcd"
"2857b81089fc0ef12ef0e2400f6084d33282183b199adb0446edd8f73cb1f8e8"
"3b73d487daca1ee9eca2f269ebcadf20bd05d9a72d08518bc398d3a7c2efaad7"
"2ae0df2a9a486c65c216384874cb569547afd482ce274d14806ce9f245160c37"
"c6b0ca09b4e8c055f91a826cc4eb2e90e8ca6df2b86edaf4469ee1f9a5b6f9ca"
"4e575ef14bc1d8cbd38e614c130c9a340651cf499c4c7a5a51d7acc6f38aa146"
"7c2c882c8f02e66fd1bde9fb829914726222c79dff6c0992e24174a1c14dd92a"
"0567d00d372aaa48ff7cb27e3ef7d52a7dc0fa56e0826f3a43e38bb26a58f0f7"
)

package() {	
	for p in *.deb; do
		ar x "${p}"
		if [[ -f data.tar.gz ]]; then
			# echo gz: "${srcdir}/${p}"
			tar xfx data.tar.gz
			rm data.tar.gz
		elif [[ -f data.tar.xz ]]; then
			# echo xz: "${srcdir}/${p}"
			tar xJf data.tar.xz
			rm data.tar.xz
		fi
	done

	mv "${srcdir}/opt/" "${pkgdir}/"
	mv "${pkgdir}/opt/rocm-7.2.0" "${pkgdir}/opt/rocm"
	# mkdir -p "${pkgdir}/opt/rocm-7.2/hsa"
	# ln -s "/opt/rocm-7.2/include/hsa" "$pkgdir/opt/rocm-7.2/hsa/include"
}
# Release notes https://rocm.docs.amd.com/en/latest/about/release-notes.html
amdgpu_repo='https://repo.radeon.com/amdgpu/6.4.1/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/6.4.1'
opencl_lib='opt/rocm-6.4.1/opencl/lib'
rocm_lib='opt/rocm-6.4.1/lib'
hip_lib='opt/rocm-6.4.1/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd-dev
pkgdesc="OpenCL SDK / HIP SDK / ROCM Compiler. This package needs at least 20GB of disk space."
pkgver=6.4.1
pkgrel=1
epoch=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('opencl-amd' 'suitesparse' 'blas' 'lapack')
provides=('composablekernel-dev' 'rocm-llvm' 'rocblas' 'rocblas-dev' 'rocsolver' 'rocsolver-dev' 'half' 'hipblas' 'hipblas-dev' 'hipblas-common-dev' 'hipblaslt' 'hipblaslt-dev' 'hiprand' 'hiprand-dev' 'rocprim' 'rocprim-dev' 'hipcub' 'hipcub-dev' 'rocfft' 'rocfft-dev' 'hipfft' 'hipfft-dev'
	'hipfort' 'hipfort-dev' 'hipify-clang' 'hipsolver' 'hipsolver-dev' 'rocsparse' 'rocsparse-dev' 'hipsparse' 'hipsparse-dev' 'hipsparselt' 'hipsparselt-dev' 'hiptensor' 'hiptensor-dev' 'openmp-extras-dev' 'rccl' 'rccl-dev' 'rocrand' 'rocrand-dev' 'rocalution' 'rocalution-dev'
	'rocm-hip-libraries' 'rocm-hip-runtime-dev' 'rocthrust' 'rocthrust-dev' 'rocprofiler-compute' 'rocprofiler-systems' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma-dev' 'rocprofiler-sdk' 'rocprofiler-sdk-roctx' 'rocm-developer-tools' 'migraphx' 'migraphx-dev' 'miopen' 'miopen-hip' 'miopen-hip-dev' 'mivisionx' 'mivisionx-dev' 'rocm-ml-libraries' 'rocm-ml-sdk' 'rpp' 'rpp-dev')
conflicts=('composablekernel-dev' 'rocm-llvm' 'rocblas' 'rocblas-dev' 'rocsolver' 'rocsolver-dev' 'hipblas' 'hipblas-dev' 'hipblas-common-dev' 'hipblaslt' 'hipblaslt-dev' 'hiprand' 'hiprand-dev' 'rocprim' 'rocprim-dev' 'hipcub' 'hipcub-dev' 'rocfft' 'rocfft-dev' 'hipfft' 'hipfft-dev'
	'hipfort' 'hipfort-dev' 'hipify-clang' 'hipsolver' 'hipsolver-dev' 'rocsparse' 'rocsparse-dev' 'hipsparse' 'hipsparse-dev' 'hipsparselt' 'hipsparselt-dev' 'hiptensor' 'hiptensor-dev' 'openmp-extras-dev' 'rccl' 'rccl-dev' 'rocrand' 'rocrand-dev' 'rocalution' 'rocalution-dev'
	'rocm-hip-libraries' 'rocm-hip-runtime-dev' 'rocthrust' 'rocthrust-dev' 'rocprofiler-compute' 'rocprofiler-systems' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma-dev' 'rocprofiler-sdk' 'rocprofiler-sdk-roctx' 'rocm-developer-tools' 'migraphx' 'migraphx-dev' 'miopen' 'miopen-hip' 'miopen-hip-dev' 'mivisionx' 'mivisionx-dev' 'rocm-ml-libraries' 'rocm-ml-sdk' 'rpp' 'rpp-dev')

source=(
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/c/composablekernel-dev/composablekernel-dev_1.1.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/h/half/half_1.12.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/h/hiprand/hiprand_2.12.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/h/hiprand-dev/hiprand-dev_2.12.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/h/hipcub-dev/hipcub-dev_3.4.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/h/hipblas/hipblas_2.4.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/h/hipblas-dev/hipblas-dev_2.4.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/h/hipblas-common-dev/hipblas-common-dev_1.0.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/h/hipblaslt/hipblaslt_0.12.1.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/h/hipblaslt-dev/hipblaslt-dev_0.12.1.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/h/hipfft/hipfft_1.0.18.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/h/hipfft-dev/hipfft-dev_1.0.18.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/h/hipfort-dev/hipfort-dev_0.6.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/h/hipsolver/hipsolver_2.4.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/h/hipsolver-dev/hipsolver-dev_2.4.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/h/hipify-clang/hipify-clang_19.0.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/h/hipsparse/hipsparse_3.2.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/h/hipsparse-dev/hipsparse-dev_3.2.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/h/hipsparselt/hipsparselt_0.2.3.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/h/hipsparselt-dev/hipsparselt-dev_0.2.3.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/h/hiptensor/hiptensor_1.5.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/h/hiptensor-dev/hiptensor-dev_1.5.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/o/openmp-extras-dev/openmp-extras-dev_18.63.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocm-llvm/rocm-llvm_19.0.0.25184.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocblas/rocblas_4.4.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocblas-dev/rocblas-dev_4.4.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocsolver/rocsolver_3.28.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocsolver-dev/rocsolver-dev_3.28.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocprim-dev/rocprim-dev_3.4.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocfft/rocfft_1.0.32.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocfft-dev/rocfft-dev_1.0.32.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocsparse/rocsparse_3.4.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocsparse-dev/rocsparse-dev_3.4.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rccl/rccl_2.22.3.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rccl-dev/rccl-dev_2.22.3.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocrand/rocrand_3.3.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocrand-dev/rocrand-dev_3.3.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocalution/rocalution_3.2.3.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocalution-dev/rocalution-dev_3.2.3.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocm-hip-runtime-dev/rocm-hip-runtime-dev_6.4.1.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocthrust-dev/rocthrust-dev_3.3.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocm-opencl-sdk/rocm-opencl-sdk_6.4.1.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocwmma-dev/rocwmma-dev_1.7.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocprofiler-sdk/rocprofiler-sdk_0.6.0-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocprofiler-sdk-roctx/rocprofiler-sdk-roctx_0.6.0-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocprofiler-compute/rocprofiler-compute_3.1.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocprofiler-systems/rocprofiler-systems_1.0.1.60401-83~24.04_amd64.deb"
# Machine learning and computer vision
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/m/migraphx/migraphx_2.12.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/m/migraphx-dev/migraphx-dev_2.12.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/m/miopen-hip/miopen-hip_3.4.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/m/miopen-hip-dev/miopen-hip-dev_3.4.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/m/mivisionx/mivisionx_3.2.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/m/mivisionx-dev/mivisionx-dev_3.2.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rpp/rpp_1.9.10.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rpp-dev/rpp-dev_1.9.10.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/t/transferbench-dev/transferbench-dev_1.57.0.60401-83~24.04_amd64.deb"
)

sha256sums=(
"bdad2f94bf744f7de8bae1c9969ada4e824022a1da75dcf437dabe653b473325"
"7bd6d1e1f311df1a33d04521a20a61559df11610a25c8d7c53805a2ef8f6977b"
"6abc4615724f908c009a1a9d3189d7ba55cc4848ff25bc1b38a050a4d2f9c0a8"
"e6589695b343d3c196123ea5e6f9c26f6318d8345e0b2c5001722ee0ab035f73"
"8a408ad8ed04575826c6b8bf3bc0b85bf3163f6593153804065d8bff58b576c4"
"feaf51ba1b97d59d525a7317f6940dce01de85b18ab1356e198aae6287c9f25a"
"4503107e2979b014870781067e2ad7976b9981e0a84fdde288a6247187e36725"
"cc68c954a933b63727b9503fd55d83ca334387c5edf5bb8ba5143d04a9e6deaa"
"995d71df925164d33bfd9437f0b9a23871557815031658eff6f2eb51861af7fb"
"de22a04ab3934ffbb74a58d94b4ca94dfd1da5b68b3d4b03f2569179dcc4189c"
"a33c8b2d4cf60508508dc4a5fcdd39e90501805726cd75e5d41a9c3efdd3d0c1"
"253ce37f03b35ee7eb3566adf447984264f5176846643df24937915558da669c"
"c70bfc7ca6a52e9cba24d2becf4416b95b2eeb1026cc498d34e3a6b30a55b935"
"efb25b3b8a89df0c3eb5dfff7169b8608904f702445e7e4ba8bda6ab71c11a9c"
"7b5317bbea1ac913ce9caf3fc3c08edc2f6b08f33c1c8c0497069cee2a649759"
"a67abfb0a3917af860b911ffabb53131a7e7b9060026c6ab01818f0b88488e3c"
"54c881c3744fb8106b659686f8e85c0f0c5eb420e67df68b92fcd291420c0f47"
"63a7bafc858acad0b839e6bf24c88aa821fc8be76d90dae2978385472d3222e8"
"4a6b7727caf7609630bf2613c89cfc251f7dd03805dff44a5c5afe19d6eabc6c"
"904c47989c359ba64f3a7382cb07d1470b47055672dd7f5a38c7a1b61bd6ec0d"
"35dbf1aecbcd12dc7274819032233a7c9923451e6fee3bebb5036f6c08f8e7d9"
"0d56032cbc5d8865ea74e61f81e1912600ec233102bec3b09a4fc9ac482561dd"
"6ba73f449c31ace0e370c0c8bb621f01ada235f880c92abfcf54ac9f6d99419d"
"d695a1aa7f150f44fd48828668cc51991f41eea28e3abfd847cfd757a3a18aff"
"57281984a9a4e1397c1a0881b684a30e8b360b81679e5b9855c22d5270fff4dc"
"2bd4f68d36c6dfee0009c17548186a8e5e09606404c6a95236cc2b29dd9f6ef3"
"a047b73c25bf6549f9f3db581e9d08413ff694a688ec0d67e5289a50b57d975f"
"a13fc89a1fac76c234d45c48c8ec740dbf684943b0fbf445a3e0aa3798a224fe"
"a250940f727b9af6e5a1db3360da33dd45c1287671d6bfa1ddc4ea68074cf171"
"96150c7acd7d278cd748055be80c8c3758170849604270d74aacaefca4ccf098"
"5f69daa0e567bd3c38b451bbc473618608b4c93b67d7cd5aa229de06ea9885f6"
"79dbad8ea29d084980f1116099c617b75fca9e6cf11667ddb0f33e5f5fb8c387"
"cf409cf69205a14fc8a4f8183941541c2e7bc2316424abad4e8d9b9dc74c50a6"
"90177aa2a258c171987ec2d7a874f092cc879623a0131cdf3416dcabec36e158"
"94c018af0102aa08e1489fca98f853c44f40f3040ac9a6f0e3d2eecd63bca385"
"129148fd2384de9bcb0cf80d708112772608d753c54b01f7915b3a96abf9df42"
"665b0f6bf2caaff189eb36ac9af3dc95b34b44a12acdc660cc3497cd890e876f"
"a352be287003669ebe1b5bd9bf1d18359b5f694fef9a63555a765cfbbe8b18fd"
"01e1ad7e71d6407e0de1d238625477d151b862b15e236eb8fbf1f7a16dc06424"
"8f13e27ababe26f5a4afd8da1e6f6ee7602e05f0764a640883c41f6950c7e931"
"a8804f2c5ca0eb59e409ec63bfbe0fba89837abb9909230f2e2a66807186c268"
"5cc1c45bf9f748d93a450b3e53b81d2181e29b0a5cd088c0d9933cf840943841"
"6aeb1691f01128e531ca3fe7debbe8ff9194f35479e9aee84a56a05e3cf62608"
"5212e822f652f4ecf662077aa469ee649d2d470b9d91d2aba2175b1821050e73"
"a965d93d4de982a7b86e0681bf6ffa0a1b5d8e4b47ab99f611fe664baee920d3"
"217a79c79f5e84a40b21ab190823523c3dcaed1b6d55b43890e7d03144c5fdd9"
"7bfab16967183dc7b89da1c15a0e146dbbd998da3ec58410209a08f0246efef5"
# Machine learning and computer vision
"1ffd7bfd5c9d84780b4b07db6b93a58f3eb627c17cb3dadbed495209c76c3afa"
"a86a930f1726fa0f62b770a5bac07be2832f03b525905fcfdfe9e239fd40d357"
"3927f844a5a827a435c374e585caceb03e7ac69c8e7159535995b82e22671bae"
"0e5112a44c9ffcfa19eba2158f22d29838c2e29aa9f2743362fb0ae59451ce7d"
"95efb9fd66bf22dab3ae8bdcf94a52ef54089f76c0cdfb968e411e5c3c904266"
"cda8ac3b78180f7dc2ff153f81f73f4e7135da2c5baab6e85198b05d3ddf43d9"
"a4f1149c2f86a008b72fcb3ab606f5ba9036ef97e34ab243ad901ffa260ef266"
"0fd2638250f895d44cfef853c08808ae9287dc45d030fe43fae1dbb844e0dcd5"
"69db77603bd4a716e72dcbe9c88f031c8b64d6172aea760d30ba5658c943efea"
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
	mv "${pkgdir}/opt/rocm-6.4.1" "${pkgdir}/opt/rocm"
	# mkdir -p "${pkgdir}/opt/rocm-6.4.1/hsa"
	# ln -s "/opt/rocm-6.4.1/include/hsa" "$pkgdir/opt/rocm-6.4.1/hsa/include"
}
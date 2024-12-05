# Release notes https://rocm.docs.amd.com/en/latest/about/release-notes.html
amdgpu_repo='https://repo.radeon.com/amdgpu/6.3/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/6.3'
opencl_lib='opt/rocm-6.3.0/opencl/lib'
rocm_lib='opt/rocm-6.3.0/lib'
hip_lib='opt/rocm-6.3.0/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd-dev
pkgdesc="OpenCL SDK / HIP SDK / ROCM Compiler. This package needs at least 20GB of disk space."
pkgver=6.3.0
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
"https://repo.radeon.com/rocm/apt/6.3/pool/main/c/composablekernel-dev/composablekernel-dev_1.1.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/h/half/half_1.12.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/h/hiprand/hiprand_2.11.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/h/hiprand-dev/hiprand-dev_2.11.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/h/hipcub-dev/hipcub-dev_3.3.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/h/hipblas/hipblas_2.3.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/h/hipblas-dev/hipblas-dev_2.3.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/h/hipblas-common-dev/hipblas-common-dev_1.0.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/h/hipblaslt/hipblaslt_0.10.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/h/hipblaslt-dev/hipblaslt-dev_0.10.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/h/hipfft/hipfft_1.0.17.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/h/hipfft-dev/hipfft-dev_1.0.17.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/h/hipfort-dev/hipfort-dev_0.5.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/h/hipsolver/hipsolver_2.3.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/h/hipsolver-dev/hipsolver-dev_2.3.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/h/hipify-clang/hipify-clang_18.0.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/h/hipsparse/hipsparse_3.1.2.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/h/hipsparse-dev/hipsparse-dev_3.1.2.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/h/hipsparselt/hipsparselt_0.2.2.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/h/hipsparselt-dev/hipsparselt-dev_0.2.2.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/h/hiptensor/hiptensor_1.4.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/h/hiptensor-dev/hiptensor-dev_1.4.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/o/openmp-extras-dev/openmp-extras-dev_18.63.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocm-llvm/rocm-llvm_18.0.0.24455.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocblas/rocblas_4.3.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocblas-dev/rocblas-dev_4.3.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocsolver/rocsolver_3.27.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocsolver-dev/rocsolver-dev_3.27.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocprim-dev/rocprim-dev_3.3.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocfft/rocfft_1.0.31.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocfft-dev/rocfft-dev_1.0.31.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocsparse/rocsparse_3.3.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocsparse-dev/rocsparse-dev_3.3.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rccl/rccl_2.21.5.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rccl-dev/rccl-dev_2.21.5.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocrand/rocrand_3.2.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocrand-dev/rocrand-dev_3.2.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocalution/rocalution_3.2.1.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocalution-dev/rocalution-dev_3.2.1.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocm-hip-runtime-dev/rocm-hip-runtime-dev_6.3.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocthrust-dev/rocthrust-dev_3.3.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocm-opencl-sdk/rocm-opencl-sdk_6.3.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocwmma-dev/rocwmma-dev_1.6.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocprofiler-sdk/rocprofiler-sdk_0.5.0-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocprofiler-sdk-roctx/rocprofiler-sdk-roctx_0.5.0-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocprofiler-compute/rocprofiler-compute_3.0.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocprofiler-systems/rocprofiler-systems_0.1.0.60300-39~24.04_amd64.deb"
# Machine learning and computer vision
"https://repo.radeon.com/rocm/apt/6.3/pool/main/m/migraphx/migraphx_2.11.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/m/migraphx-dev/migraphx-dev_2.11.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/m/miopen-hip/miopen-hip_3.3.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/m/miopen-hip-dev/miopen-hip-dev_3.3.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/m/mivisionx/mivisionx_3.1.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/m/mivisionx-dev/mivisionx-dev_3.1.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rpp/rpp_1.9.1.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rpp-dev/rpp-dev_1.9.1.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/t/transferbench-dev/transferbench-dev_1.51.0.60300-39~24.04_amd64.deb"
)

sha256sums=(
"eed1981c11e3f1afc4523a4ccb08eb2e686ae976d7ad48fdd38fcd05b0d9a880"
"6da4a2d419eeb341cc013d91da76e1b8032590793e3aef5ab0a64634cba82df2"
"17897d2deabba455297033c68a90897d33f92745ac9e72cf81f073c8b5df0ad7"
"e3302ca3a1cfc6033624cb713f4181d0bb508e7526494df12b80be3908a7c4e5"
"a3967ee2c9c882b723f4d7571b0fce966e7b3c07370e74ebfbaf232833286036"
"f7dbb1b87128bba58ff58ffc36db53b92169c009a6dcc99489074cd8ee6b77b9"
"f06488bfac573febc8c52a3630bfff0cc035ee4d56232c368e1c6ce5f4207f4b"
"27736af99a4a4cef0c90894ec78d1379fb713b615c965b4bc1945a4e248763b2"
"63786f058dd227e44877d81bbcf8d9fb8ad7cfce5f463433959193db09ee76f2"
"e53f74bdd222b019e4f19ed82f1c04518d5f87a00286886df77583cdd7b1a424"
"a0ac65e9fabdae10aeaf004508a20e38087f42a2486cd052faaf61dd7f50d4be"
"8d977839af46ba30718e48ec1846b1967c4ab5f1ff1b9ab8dd0d71db42fa84cf"
"4eba01698294bc1ddb416f890794a7fda905e10200c85ab2eff33bbf035e1712"
"318aec4e79bc98ab17dae977fe6024a089d4f93ffa968f3967d4e0f8fece22b0"
"bfb04707d68a7d97a9744254c1a01e054b08ce9fee826755a3121bbade46acbf"
"3cc30082e520e941d22f1f9f64e04076f465ae40a72cbc170029ae4b020a596d"
"91c1d2d8ed59204d0c08b9b1c3d9e2f7b49c099afdece505932390728f9c4503"
"066bbe10924249b9bf9df6cfeb265a928b961dde79f523d0b919de5f6765bbcf"
"a9778e4dda5bcbf44b17a6072c4df4e6816cc56f9f62fa41b3d3ea0c7e339732"
"77e25147cf410524d55d9a4614a2d52bdef10988f304f97178d44f74d616ce44"
"780a3b366a5be22ebc4488eb26cc1c569fa2b397b1de77726f31c25a4421f7bf"
"af3ffbad37950c8994cbb849fc1e2764761025e6c96886a485d68140ad88a36f"
"860e23a5ff7ad7aed63bdc30594459db5786d6552e16cf0edc36bcab60bb1a3c"
"71e1409a58797bdf31f5394ad77995978bda310fc9e98664cfede7dd8871a363"
"4859f43ce53e3adaed9a7c6c4bfc453fbf1264a65afb1778207e98f84d6bf41a"
"693dd5ecd59df5866fa9125415a5322e19c1ff2119ab2a97427645c54d02cb66"
"69424f1f4f0a38cceba5000da964abb8bf107736b4896853874090bc7ac55465"
"550304f715a952c75e51feccdf4201e73741ce910578320528e50162dc026666"
"4138f58de0734118c9193085d9c5c7b26fe85e864906df06b485608e48654c4b"
"97ffa892bc0ce6d1de22c75acbed40e63f022d7f9f663588ff47b5dc98ebb0e1"
"f8b00c0d1c67700da7574a87db5385a12afe90cfc7078c23f7cd8c90e5e21e40"
"96df25516ed8c0048860d900f36ac53766cf59f46fd0ab406f8213e4ffbb5fe4"
"9421e7d892a5ec79dd12fa5abfdd9ab84f1278ace6dc1ae745b4deaf36d99179"
"024063c7811b78d6f33b8b07d03222243a58f2acaf7a1bc0b329644bb2d1eca1"
"b65fdd30524ce57574e0cbafb1e78f6de175bf5808fd089df0ce46e5e9a76aa8"
"dc352b46ef722006a5e776762cfc4a2ae6570d8eb5aa9843df99ca9da9799651"
"a74fde49c0dacd51b183633c950b322b1757d543ca6f65e5a32406d1ef3bf093"
"4b08f185f02335957a58f124f60713292001de75e3ed0f7b6c17cdd71fc604f3"
"90c1289d3e3d9cf387403f80f673eeccc6eab96581d166ea5e4b58b825f38250"
"f348e35a3a15604267cf63fbaf79b67201f188d95da4796304b86125b58c8e5f"
"76ea26cf4fe6cdfaeaa4b1bd2a36db78e52b5f7f5ccd8b05a77613d6c8793031"
"0be18a6ae160d4da1b8a6629271af4ed5934e0bf3655e1aa6c82a044412ce380"
"c6b7f7bc18441ccbfa697eb1f384e7c4a02cbe9c6a74da98388aafd8dd2d463b"
"cda86606df19ad2fd04aadcf6dde2a13f70112c85ebc39fc382510f2c3e8c225"
"32cee7c118ec606ef45344bc2ee77313b53991195a4eddabd32da3211b3f792a"
"5575415ec5853eafcb244bafdba5c86b1ecd2897d2adeeaf0b63517f22adfc4c"
"fd226b2afbd1fbfaa91fa42761eadb84c8b3d36ddf11cc80fc1ebff489d86381"
# Machine learning and computer vision
"3097dad1eeb697c9494cef8fb23f5176157c0249dc36639b1730cbeb9cb09fc5"
"967c2685c38d11f9764221597a1788c8481760092c46753866f6f23ce9df762a"
"75706b14ef6fd2eebc4e7779fa074d0e1537007b4f60c8f93afac886d3976ce0"
"49d2bc1d957730c4e1bd60bc8493418f7a3b7147b26ed8d39e2fe10497a18e82"
"259b69cf2346e9a7140e12a38bd8db60bf78f0fb822d7fb112139cc02f017a14"
"2dfd0877e7859e4421ed11934ac8aebc4a1787f9831f798df31f6aae9a243a57"
"78edc8564a99acc52727c876d83e74f26a6a4c74496f4f26de537a6be7047a8c"
"2d831ac6d8ac79036a04f84cd8338207b25544a426247ab5d1648db77cf6345f"
"e010b4d0a4ab67b91e24a417c7156aabb41f1d285ff0fce251e98aec51714c4c"
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
	# mkdir -p "${pkgdir}/opt/rocm-6.3.0/hsa"
	# ln -s "/opt/rocm-6.3.0/include/hsa" "$pkgdir/opt/rocm-6.3.0/hsa/include"
}
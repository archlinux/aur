# Release notes https://rocm.docs.amd.com/en/latest/about/release-notes.html
amdgpu_repo='https://repo.radeon.com/amdgpu/7.0/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/7.0'
opencl_lib='opt/rocm-7.0.0/opencl/lib'
rocm_lib='opt/rocm-7.0.0/lib'
hip_lib='opt/rocm-7.0.0/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd-dev
pkgdesc="OpenCL SDK / HIP SDK / ROCM Compiler. This package needs at least 20GB of disk space."
pkgver=7.0.0
pkgrel=2
epoch=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('opencl-amd' 'suitesparse' 'blas' 'lapack')
provides=('composablekernel-dev' 'rocm-llvm' 'rocblas' 'rocblas-dev' 'rocsolver' 'rocsolver-dev' 'half' 'hipblas' 'hipblas-dev' 'hipblas-common' 'hipblas-common-dev' 'hipblaslt' 'hipblaslt-dev' 'hiprand' 'hiprand-dev' 'rocprim' 'rocprim-dev' 'hipcub' 'hipcub-dev' 'rocfft' 'rocfft-dev' 'hipfft' 'hipfft-dev'
	'hipfort' 'hipfort-dev' 'hipify-clang' 'hipsolver' 'hipsolver-dev' 'rocsparse' 'rocsparse-dev' 'hipsparse' 'hipsparse-dev' 'hipsparselt' 'hipsparselt-dev' 'hiptensor' 'hiptensor-dev' 'openmp-extras-dev' 'rccl' 'rccl-dev' 'rocrand' 'rocrand-dev' 'rocalution' 'rocalution-dev'
	'rocm-hip-libraries' 'rocm-hip-runtime-dev' 'rocthrust' 'rocthrust-dev' 'rocprofiler-compute' 'rocprofiler-debug' 'rocprofiler-systems' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma-dev' 'rocprofiler-sdk' 'rocprofiler-sdk-roctx' 'rocm-developer-tools' 'migraphx' 'migraphx-dev' 'miopen' 'miopen-hip' 'miopen-hip-dev' 'mivisionx' 'mivisionx-dev' 'rocm-ml-libraries' 'rocm-ml-sdk' 'rpp' 'rpp-dev')
conflicts=('composablekernel-dev' 'rocm-llvm' 'rocblas' 'rocblas-dev' 'rocsolver' 'rocsolver-dev' 'hipblas' 'hipblas-dev' 'hipblas-common' 'hipblas-common-dev' 'hipblaslt' 'hipblaslt-dev' 'hiprand' 'hiprand-dev' 'rocprim' 'rocprim-dev' 'hipcub' 'hipcub-dev' 'rocfft' 'rocfft-dev' 'hipfft' 'hipfft-dev'
	'hipfort' 'hipfort-dev' 'hipify-clang' 'hipsolver' 'hipsolver-dev' 'rocsparse' 'rocsparse-dev' 'hipsparse' 'hipsparse-dev' 'hipsparselt' 'hipsparselt-dev' 'hiptensor' 'hiptensor-dev' 'openmp-extras-dev' 'rccl' 'rccl-dev' 'rocrand' 'rocrand-dev' 'rocalution' 'rocalution-dev'
	'rocm-hip-libraries' 'rocm-hip-runtime-dev' 'rocthrust' 'rocthrust-dev' 'rocprofiler-compute' 'rocprofiler-debug' 'rocprofiler-systems' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma-dev' 'rocprofiler-sdk' 'rocprofiler-sdk-roctx' 'rocm-developer-tools' 'migraphx' 'migraphx-dev' 'miopen' 'miopen-hip' 'miopen-hip-dev' 'mivisionx' 'mivisionx-dev' 'rocm-ml-libraries' 'rocm-ml-sdk' 'rpp' 'rpp-dev')

source=(
"https://repo.radeon.com/rocm/apt/7.0/pool/main/c/composablekernel-dev/composablekernel-dev_1.1.0.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/h/half/half_1.12.0.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/h/hiprand/hiprand_3.0.0.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/h/hiprand-dev/hiprand-dev_3.0.0.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/h/hipcub-dev/hipcub-dev_4.0.0.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/h/hipblas/hipblas_3.0.0.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/h/hipblas-dev/hipblas-dev_3.0.0.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/h/hipblas-common-dev/hipblas-common-dev_1.2.0.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/h/hipblaslt/hipblaslt_1.0.0.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/h/hipblaslt-dev/hipblaslt-dev_1.0.0.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/h/hipfft/hipfft_1.0.20.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/h/hipfft-dev/hipfft-dev_1.0.20.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/h/hipfort-dev/hipfort-dev_0.7.0.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/h/hipsolver/hipsolver_3.0.0.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/h/hipsolver-dev/hipsolver-dev_3.0.0.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/h/hipify-clang/hipify-clang_20.0.0.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/h/hipsparse/hipsparse_4.0.1.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/h/hipsparse-dev/hipsparse-dev_4.0.1.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/h/hipsparselt/hipsparselt_0.2.4.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/h/hipsparselt-dev/hipsparselt-dev_0.2.4.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/h/hiptensor/hiptensor_2.0.0.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/h/hiptensor-dev/hiptensor-dev_2.0.0.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/o/openmp-extras-dev/openmp-extras-dev_20.70.0.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/r/rocm-llvm/rocm-llvm_20.0.0.25314.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/r/rocblas/rocblas_5.0.0.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/r/rocblas-dev/rocblas-dev_5.0.0.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/r/rocsolver/rocsolver_3.30.0.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/r/rocsolver-dev/rocsolver-dev_3.30.0.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/r/rocprim-dev/rocprim-dev_4.0.0.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/r/rocfft/rocfft_1.0.34.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/r/rocfft-dev/rocfft-dev_1.0.34.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/r/rocsparse/rocsparse_4.0.2.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/r/rocsparse-dev/rocsparse-dev_4.0.2.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/r/rccl/rccl_2.26.6.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/r/rccl-dev/rccl-dev_2.26.6.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/r/rocrand/rocrand_4.0.0.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/r/rocrand-dev/rocrand-dev_4.0.0.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/r/rocalution/rocalution_4.0.0.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/r/rocalution-dev/rocalution-dev_4.0.0.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/r/rocm-hip-runtime-dev/rocm-hip-runtime-dev_7.0.0.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/r/rocthrust-dev/rocthrust-dev_4.0.0.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/r/rocm-opencl-sdk/rocm-opencl-sdk_7.0.0.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/r/rocwmma-dev/rocwmma-dev_2.0.0.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/r/rocprofiler-sdk/rocprofiler-sdk_1.0.0-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/r/rocprofiler-sdk-roctx/rocprofiler-sdk-roctx_1.0.0-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/r/rocprofiler-sdk-rocpd/rocprofiler-sdk-rocpd_1.0.0-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/r/rocprofiler-compute/rocprofiler-compute_3.2.3.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/r/rocprofiler-systems/rocprofiler-systems_1.1.0.70000-38~24.04_amd64.deb"
# Machine learning and computer vision
"https://repo.radeon.com/rocm/apt/7.0/pool/main/m/migraphx/migraphx_2.13.0.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/m/migraphx-dev/migraphx-dev_2.13.0.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/m/miopen-hip/miopen-hip_3.5.0.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/m/miopen-hip-dev/miopen-hip-dev_3.5.0.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/m/mivisionx/mivisionx_3.3.0.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/m/mivisionx-dev/mivisionx-dev_3.3.0.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/r/rpp/rpp_2.0.0.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/r/rpp-dev/rpp-dev_2.0.0.70000-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0/pool/main/t/transferbench-dev/transferbench-dev_1.63.00.70000-38~24.04_amd64.deb"
)

sha256sums=(
"563b95a6de81b4d4cc852ee781ff87ff34ba73889a0f5ed2af2e31d6f2a9266d"
"0e695ddceeaee9bf969b8699997a4a2ee7b7cf7b93f9c902c1eaad95c4531b1c"
"e18e86f655285c0b6c612a4c8ee38a3e2b573716fe30bc1ebe7acfd0e366e035"
"c78ffd97649de7b1775ad71eed2e3eed5198f28061e0fcd90a193c17dab0b284"
"b29139ebf958dc4e5c342084ce5e39da43ec86363c909f87f08ab8b817731ac1"
"f5b3b24ffa5d8dd15e9b0c8f5a7a6138dcaa9ccaa95ad6e1b4fcd33e45fac5ef"
"99c995c34d20fe2b64d14819ec6af8e7b405cafe7b4a42c9efbfcb3abd2811e2"
"9a5bc0355b97b6561532f10b821ca566b545df3a820b66f8d0d6d561a8192698"
"3015cb1b047fbb1127a9b2fb4c08b781f548ee34e8add020c77df8f5c8d34780"
"711e2ad292eec07f29c8d425b54e4a90da5ede5f1c3db189b8f30564bf3ef151"
"5e43df630d6da34a2426bf737771826cdd16970fd6fcce3e2b43969ca6e9fc10"
"0c387626b01321de51dfa35f96aeb8c50dc8ec089202ae8dbd4fbd7c223b7d6d"
"eba1379386fcf674de4b424c6f20a2d1b448887b054cd19fd691988d527383f4"
"4fcb97a4cabaf8b09156d28e5bb2602b99ec3bea1f789b021999f1e25ccd3661"
"56bfcc81b681b054be6d89f23d17c771b21247590b8859e533d382e5845838c5"
"cbf1302416adefe703580f95b2199d6338375cc8bc0cc921550010151b97288d"
"a38cc223b4f8c3b686bb88d8375d45443e2116a58dd6ab8fcef29cb3e7738e9c"
"dab226b7e50f6f543992882887a0901f7e07b62bf72d56382f3e15b387b89296"
"89da5ccb265e2f31ebbbf3240faf2aaee5b7605c0bb2a06fdb4578ef804f6086"
"ab609b7e21ea3df122b6ebf1afc6334b80c947ec85373cf9c232c8b3d4c7dc33"
"ff6ba6f08c4482fe29b461883f5ab46e23b770067131c2b1fcb51fc8943b776e"
"64a99bb132723b336107a77a58b7e31e907c3b1b2415a2a6bea81eac81bf116c"
"9e63d161fffbd09be986f3faa0a9b411c7b509fa2681b97ee691cda091803062"
"ed89769577a09fb38263e3b00c01af84a13b941339cb60cacaed78722a98c9b7"
"252c96a5416c65d9cc406a807fc9a357e17203e60378d4f1ca5b5b7b833fc86e"
"1221618501c414d0093336fb12affa5b9e392a209bb238ee6fe575ccb674a76c"
"62ddb2c0e4fcd7222176b9ef35ee1793c7f166f79be2ceea812335e696d775f8"
"1b7b2c42311f0410bc74ad4c68eff8f98af6f719102c963b8cc02297e023a6e9"
"b7548aa115e083b5382d6e84df23584cf1f9897c4b1d795c0395eef01973e333"
"349cbafe88c8ef7a9495642bf0ae58daae89c370c87656efed3e412db3448b52"
"650e671c6ce89ea7a8853b6d3c9e23bc589bac0a4a56f14da03300205b2430af"
"2dd2692e9f55cdb6757e5c465c14699ae49d854a65d740855a2e63597a472103"
"8f21ed0fc14ee21370c57c6c9ee9136f26162d1f9ec9a2d29b230749bb03f310"
"ca7295a0ada24411888045fbed5f088f8d72345f9dd6580e54e69dc072c5aeab"
"4a2772ac993d342a86861fef13e1ae2c4aa20f7d65b3080fac4dc7361c53ae56"
"8ba86dc6ec99af01797319f30c651648011b31418437caf87aab659fb30b9dee"
"632902a6d4b8b3f3fcf87d67d277de44aa55f1eca90a8e5570d62ec87f7e66fb"
"3e279f675a12cd94d1f0c4233a51031174db4d426730ad6504b1838dfc1e2519"
"4698e9a4b9c5a106b1a13bd0f467b12e582535ad66be3472790a720266f8372a"
"bcba8747866e7029fd89bcfff7c85e523e48751f9cdbdf81d3e98cdeded15cbb"
"31debda333d37171124b6da277d4c19af8d107984c9e8c94ce05a26c65591ed2"
"344f5e9c60bce5ba5853aa6b71c1a9abccac89a0ec6b781b2045cc9f1e07e727"
"9362dcc03e996d87635cb4b0b48e4ed328f18eb80732142c5a5082d497e5390f"
"69906bc380d96d8229a762902c02ca689e28ec1739f6898553475953ff25f4bf"
"29152ec77a79c7076ff18f6a2d09710a2da247fbd62e9c913ecdc63beefbdbda"
"9cce1c1297fb58da8a8a246ec6a7b4de8ba1a9bff675ec61815d9fe744e5a9ba"
"daab579edee04047e86f48a55ccef8103664bac2a82ba459df43e8cd6a989fc0"
"a9ae1f48f69edf4d1e90e7d54a80f55a180f890a4823809daf1b421ff90b04f9"
# Machine learning and computer vision
"160ae0327963376f4c9e2d3243bdf49e91b1562031486f25e41df1ab0c77b9b4"
"a3d152d704f5a5e5d75ea7f3c387e36f2fc352fb0b82df64db100ce3b4f0dd90"
"acd8c1e241de897ff871b33e3f3e6c17dcdff65a9c486af88e0420a8e2c53e3a"
"0b26ccd7729cf3ba7940e423397db2a6b76874b9e2d476f19cd8927efc7c965a"
"baf4ea3562837c4e055d483d162d98487b776bf1c471090445cfd10a45ebfd88"
"67476347cab622e6953eb7fb8ff05b326fe223c4d838479a453c2aa76481de33"
"d43e30b527538a0d1f1f66f3347f7165c414900099e165f1ef2ae8de249edcad"
"8a51f9f63380b31177426e4eb706bc7c7635cd5e69666f15e109d2962d1f0a56"
"784725bc448f2d9ccc371c722f0fbda7a333c274143cb6df4d113b3d008a51d0"
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
	mv "${pkgdir}/opt/rocm-7.0.0" "${pkgdir}/opt/rocm"
	# mkdir -p "${pkgdir}/opt/rocm-7.0.0/hsa"
	# ln -s "/opt/rocm-7.0.0/include/hsa" "$pkgdir/opt/rocm-7.0.0/hsa/include"
}
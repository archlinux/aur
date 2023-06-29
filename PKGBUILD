# Release notes https://rocm.docs.amd.com/en/latest/CHANGELOG.html#rocm-5-6-0
amdgpu_repo='https://repo.radeon.com/amdgpu/5.6/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/5.6'
opencl_lib='opt/rocm-5.6.0/opencl/lib'
rocm_lib='opt/rocm-5.6.0/lib'
hip_lib='opt/rocm-5.6.0/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd-dev
pkgdesc="OpenCL SDK / HIP SDK / ROCM Compiler. This package needs at least 10GB of space."
pkgver=5.6.0
pkgrel=1
epoch=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('opencl-amd')
provides=('rocm-llvm' 'rocblas' 'rocblas-dev' 'rocsolver' 'rocsolver-dev' 'hipblas' 'hipblas-dev' 'rocprim' 'rocprim-dev' 'hipcub' 'hipcub-dev' 'rocfft' 'rocfft-dev' 'hipfft' 'hipfft-dev' 'hipfort' 'hipfort-dev' 
	'hipify-clang' 'hipsolver' 'hipsolver-dev' 'rocsparse' 'rocsparse-dev' 'hipsparse' 'hipsparse-dev' 'openmp-extras-dev' 'rccl' 'rccl-dev' 'rocrand' 'rocrand-dev' 'rocalution' 'rocalution-dev' 'rocm-hip-libraries' 
	'rocm-hip-runtime-dev' 'rocthrust' 'rocthrust-dev' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma-dev' 'rocm-developer-tools' 'miopen' 'miopen-hip' 'miopen-hip-dev' 'rocm-ml-libraries' 'rocm-ml-sdk')
conflicts=('rocm-llvm' 'rocblas' 'rocblas-dev' 'rocsolver' 'rocsolver-dev' 'hipblas' 'hipblas-dev' 'rocprim' 'rocprim-dev' 'hipcub' 'hipcub-dev' 'rocfft' 'rocfft-dev' 'hipfft' 'hipfft-dev' 'hipfort' 'hipfort-dev' 
	'hipify-clang' 'hipsolver' 'hipsolver-dev' 'rocsparse' 'rocsparse-dev' 'hipsparse' 'hipsparse-dev' 'openmp-extras-dev' 'rccl' 'rccl-dev' 'rocrand' 'rocrand-dev' 'rocalution' 'rocalution-dev' 'rocm-hip-libraries' 
	'rocm-hip-runtime-dev' 'rocthrust' 'rocthrust-dev' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma-dev' 'rocm-developer-tools' 'miopen' 'miopen-hip' 'miopen-hip-dev' 'rocm-ml-libraries' 'rocm-ml-sdk')

source=(
"https://repo.radeon.com/rocm/apt/5.6/pool/main/o/openmp-extras-dev/openmp-extras-dev_16.56.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rocm-llvm/rocm-llvm_16.0.0.23243.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rocblas/rocblas_3.0.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rocblas-dev/rocblas-dev_3.0.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rocsolver/rocsolver_3.22.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rocsolver-dev/rocsolver-dev_3.22.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/h/hipblas/hipblas_1.0.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/h/hipblas-dev/hipblas-dev_1.0.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/h/hipblaslt/hipblaslt_0.2.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/h/hipblaslt-dev/hipblaslt-dev_0.2.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rocprim-dev/rocprim-dev_2.13.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/h/hipcub-dev/hipcub-dev_2.13.1.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rocfft/rocfft_1.0.23.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rocfft-dev/rocfft-dev_1.0.23.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/h/hipfft/hipfft_1.0.12.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/h/hipfft-dev/hipfft-dev_1.0.12.50600-67~22.04_amd64.deb"
#"https://repo.radeon.com/rocm/apt/5.6/pool/main/h/hipfort/hipfort_0.4.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/h/hipfort-dev/hipfort-dev_0.4.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/h/hipsolver/hipsolver_1.8.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/h/hipsolver-dev/hipsolver-dev_1.8.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/h/hipify-clang/hipify-clang_16.0.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rocsparse/rocsparse_2.5.2.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rocsparse-dev/rocsparse-dev_2.5.2.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/h/hipsparse/hipsparse_2.3.6.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/h/hipsparse-dev/hipsparse-dev_2.3.6.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rccl/rccl_2.16.5.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rccl-dev/rccl-dev_2.16.5.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rocrand/rocrand_2.10.17.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rocrand-dev/rocrand-dev_2.10.17.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rocalution/rocalution_2.1.9.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rocalution-dev/rocalution-dev_2.1.9.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rocm-hip-libraries/rocm-hip-libraries_5.6.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rocm-hip-runtime-dev/rocm-hip-runtime-dev_5.6.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rocthrust-dev/rocthrust-dev_2.18.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rocm-hip-sdk/rocm-hip-sdk_5.6.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rocm-opencl-sdk/rocm-opencl-sdk_5.6.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rocwmma-dev/rocwmma-dev_1.1.0.50600-67~22.04_amd64.deb"
#"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rocm-developer-tools/rocm-developer-tools_5.4.3.50600-67~22.04_amd64.deb"
# ML
"https://repo.radeon.com/rocm/apt/5.6/pool/main/m/miopen-hip/miopen-hip_2.20.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/m/miopen-hip-dev/miopen-hip-dev_2.20.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rocm-ml-libraries/rocm-ml-libraries_5.6.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rocm-ml-sdk/rocm-ml-sdk_5.6.0.50600-67~22.04_amd64.deb"
)

sha256sums=(
"88f0fdb8798f78c2c7e06c63afaa95f6e570affc1bb195607cc1987327da1984"
"c33d3990d865ec278b4f2038bc262bb9a6c1b21b258d4030eaa4f0b83005fe7f"
"f421dbd2afa04d114acaed81a39c66f26633cc32e7bda472df0fc9293d7ada85"
"b984f20fdafdc33fc7eae070e75ea415fdde4f3c655f806fbe1c41a4b3cf5030"
"03b8c5e47848406e09dcad023f847bbb64b68c5bfb649b9e65370d232ac8093f"
"051982b2131fcbf7f738a75061bad2367f55f666c3301af12318dc0729466acb"
"970451eee9015501159b69bee7b255a6c9d5f0859f4f42008dae7cf9763f86a6"
"d9e483ef84a94c5e6e0a551a11a5ec54448ec4d075db382ccaf3eefc555f3868"
"70c7b3643e32e8d263b0a3ce5054a250ef7a32859a28794a017e4743d76083dd"
"ebef7146e2022993d02cdd499d49efdde0c9d37f3bd1475bdc202b14864c9e19"
"e2c1c92f1634e42d72d5b978e0549c1a6ce5c5f9996a2cf612c44afcbb743fd8"
"d41cadc74e8964bca43b5edc5337266fe71472c0c256605633fd0fc9c011c733"
"b9f9f4a7f429c4e931843e6881f337ae3a203072d252fc3ed5e324033ec34458"
"af6dc963994b23159395b13e2ef13020b903f184f5ca9802dfb8b8f647233351"
"acfd836fbf825abb7f9537718261e840c8620ae7ef3a409b352edc6538217549"
"91d19e1939c0269b2ac6c70f9dd9818d7991731920935100648cd6e52f92d3b8"
#"2c2bb011e24eaf7a4604a5496c024776e2db026bfc11e8f5c8748ad355655353"
"48b1e9e0c54a7b628204237cbb526febe7576694cd754d908e4a3c4474814984"
"9528f55aedd382419bdf47981c64a95e2b11d2a802d9273445ed9b61fc5437fc"
"0be80c1dfa000e29f967f563cc17f8d047b73808568af7841e02498df011e050"
"7ab7fa2a4dfac470b1620895c8542d2d43ac0bbc138d6ce4948ae51468a2e420"
"0cc9b51f4f5b53eae5a481bc2e2bec0b4d094c6c7b92042274cb7f40fa2d68a6"
"2ce565d572d24a6790b66d618338a7b17b3a2958039e2d8741e0e133c2c73d7c"
"47cd033b57b39b2f93be217afe78e4d07801382c9ae986bc6f30c50664f2abb7"
"c2f5dc3e39bdec1ace6d168079a6659990eb34f05ffd9188cb023dedb93facb3"
"01f2cf9dbcee74b532048501010afa7288c7ff88d528d5e74d0bb2f66786c062"
"7b9e786859a91e4b46763204a4fbadcf0cd4aacd240d5bd7dcf72db166ecc960"
"a87fd999e5aeea252cfc3b5bce1be76405d0a68b19d3c422d238b0d5ab55ee02"
"eab990b8cf0e526dbc09b25f5694234fabd499dcf488cb58e6ebfbdb75f7687f"
"2985cbd078589f632aad92d5e94611105bcb4ae173ceaca9c0a64093a6ffb605"
"d67f261104357b5adaf23cc7a75d9d9ca1610d9e4196db4c7cf66dd5135d95f8"
"c5ef2b7547baafefaca31e5a31ed6627544c51b9df74802cc79048d028eff1c5"
"247f762de67de3e20c4e96e541c89a278631ee927122a15bf28bd97650affd34"
"a6d7bc1fee6943d61242fd6a07e2550f4d3c2cb4f3ec16f389d3421078d8ba46"
"9a69c85ced3a6e9cce77aac25b0a9266b40f68b0e53d88e09edd27800a1c0fc4"
"3d48f06c3f680c1bfdf3cb86d35dac317902a1fbaeca6479bf1e9b6fb4767f08"
"f715b4481d75302f57975e33f8d47648bccafc6bb6b70a78037fb8354cce0a80"
# "4bba416791003fb689db8e9ebc68c15eac2951be98c4c5b9d09c40f202748d23"
# ML
"28bc0b240283905b9199652fecb4f5bcecf7c87075bb434325d6567fd3a32838"
"0fe631ab315a6097bc429f21e1e1a5499105f4dc9474aac8f2fb7a6172cfb052"
"371fa862aa66f2ee7c1b9ef4fcf3fb06a5ef4aace1cbc82e32f956fb5dc76263"
"522eccaff2acdbeab2a6e66e0ea14cb992736c343d9fa463fb1b163ab324c9df"
)

#Extract .xz files
exz() {
	#echo $1
	ar x $1 data.tar.xz
	tar xJf data.tar.xz
	rm data.tar.xz
}
#Extract .gz files
egz() {
	#echo $1
	ar x $1 data.tar.gz
	tar xfx data.tar.gz
	rm data.tar.gz
}

package() {
	egz "${srcdir}/openmp-extras-dev_16.56.0.50600-67~22.04_amd64.deb"
	egz "${srcdir}/rocm-llvm_16.0.0.23243.50600-67~22.04_amd64.deb"
	exz "${srcdir}/rocblas_3.0.0.50600-67~22.04_amd64.deb"
	exz "${srcdir}/rocblas-dev_3.0.0.50600-67~22.04_amd64.deb"
	exz "${srcdir}/hipblas_1.0.0.50600-67~22.04_amd64.deb"
	exz "${srcdir}/hipblas-dev_1.0.0.50600-67~22.04_amd64.deb"
	exz "${srcdir}/hipblaslt_0.2.0.50600-67~22.04_amd64.deb"
	exz "${srcdir}/hipblaslt-dev_0.2.0.50600-67~22.04_amd64.deb"
	exz "${srcdir}/rocprim-dev_2.13.0.50600-67~22.04_amd64.deb"
	exz "${srcdir}/hipcub-dev_2.13.1.50600-67~22.04_amd64.deb"
	exz "${srcdir}/rocfft_1.0.23.50600-67~22.04_amd64.deb"
	exz "${srcdir}/rocfft-dev_1.0.23.50600-67~22.04_amd64.deb"
	exz "${srcdir}/hipfft_1.0.12.50600-67~22.04_amd64.deb"
	exz "${srcdir}/hipfft-dev_1.0.12.50600-67~22.04_amd64.deb"
	#exz "${srcdir}/hipfort_0.4.0.50600-67~22.04_amd64.deb"
	exz "${srcdir}/hipfort-dev_0.4.0.50600-67~22.04_amd64.deb"
	exz "${srcdir}/hipsolver_1.8.0.50600-67~22.04_amd64.deb"
	exz "${srcdir}/hipsolver-dev_1.8.0.50600-67~22.04_amd64.deb"
	egz "${srcdir}/hipify-clang_16.0.0.50600-67~22.04_amd64.deb"
	exz "${srcdir}/rocsparse_2.5.2.50600-67~22.04_amd64.deb"
	exz "${srcdir}/rocsparse-dev_2.5.2.50600-67~22.04_amd64.deb"
	exz "${srcdir}/hipsparse_2.3.6.50600-67~22.04_amd64.deb"
	exz "${srcdir}/hipsparse-dev_2.3.6.50600-67~22.04_amd64.deb"
	exz "${srcdir}/miopen-hip_2.20.0.50600-67~22.04_amd64.deb"
	exz "${srcdir}/miopen-hip-dev_2.20.0.50600-67~22.04_amd64.deb"
	exz "${srcdir}/rccl_2.16.5.50600-67~22.04_amd64.deb"
	exz "${srcdir}/rccl-dev_2.16.5.50600-67~22.04_amd64.deb"
	exz "${srcdir}/rocrand_2.10.17.50600-67~22.04_amd64.deb"
	exz "${srcdir}/rocrand-dev_2.10.17.50600-67~22.04_amd64.deb"
	exz "${srcdir}/rocalution_2.1.9.50600-67~22.04_amd64.deb"
	exz "${srcdir}/rocalution-dev_2.1.9.50600-67~22.04_amd64.deb"	
	egz "${srcdir}/rocm-hip-libraries_5.6.0.50600-67~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime-dev_5.6.0.50600-67~22.04_amd64.deb"	
	exz "${srcdir}/rocsolver_3.22.0.50600-67~22.04_amd64.deb"
	exz "${srcdir}/rocsolver-dev_3.22.0.50600-67~22.04_amd64.deb"	
	exz "${srcdir}/rocthrust-dev_2.18.0.50600-67~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-sdk_5.6.0.50600-67~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-sdk_5.6.0.50600-67~22.04_amd64.deb"
	exz "${srcdir}/rocwmma-dev_1.1.0.50600-67~22.04_amd64.deb"
	# egz "${srcdir}/rocm-developer-tools_5.4.3.50600-67~22.04_amd64.deb"
	egz "${srcdir}/rocm-ml-libraries_5.6.0.50600-67~22.04_amd64.deb"	
	egz "${srcdir}/rocm-ml-sdk_5.6.0.50600-67~22.04_amd64.deb"
	
	mv "${srcdir}/opt/" "${pkgdir}/"
	# mkdir -p "${pkgdir}/opt/rocm-5.6.0/hsa"
	# ln -s "/opt/rocm-5.6.0/include/hsa" "$pkgdir/opt/rocm-5.6.0/hsa/include"
}
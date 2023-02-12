# Release notes https://docs.amd.com/bundle/ROCm-Release-Notes-v5.4.3/page/About_This_Document.html
amdgpu_repo='https://repo.radeon.com/amdgpu/5.4.3/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/5.4.3'
opencl_lib='opt/rocm-5.4.3/opencl/lib'
rocm_lib='opt/rocm-5.4.3/lib'
hip_lib='opt/rocm-5.4.3/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd-dev
pkgdesc="OpenCL SDK / HIP SDK / ROCM Compiler. This package needs at least 10GB of space."
pkgver=5.4.3
pkgrel=1
epoch=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('opencl-amd')
provides=('rocm-llvm' 'rocblas' 'rocblas-dev' 'rocsolver' 'rocsolver-dev' 'hipblas' 'hipblas-dev' 'rocprim' 'rocprim-dev' 'hipcub' 'hipcub-dev' 'rocfft' 'rocfft-dev' 'hipfft' 'hipfft-dev' 'hipfort' 'hipfort-dev' 
	'hipify-clang' 'hipsolver' 'hipsolver-dev' 'rocsparse' 'rocsparse-dev' 'hipsparse' 'hipsparse-dev' 'rccl' 'rccl-dev' 'rocrand' 'rocrand-dev' 'rocalution' 'rocalution-dev' 'rocm-hip-libraries' 
	'rocm-hip-runtime-dev' 'rocthrust' 'rocthrust-dev' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma-dev' 'rocm-developer-tools' 'miopen' 'miopen-hip' 'miopen-hip-dev' 'rocm-ml-libraries' 'rocm-ml-sdk')
conflicts=('rocm-llvm' 'rocblas' 'rocblas-dev' 'rocsolver' 'rocsolver-dev' 'hipblas' 'hipblas-dev' 'rocprim' 'rocprim-dev' 'hipcub' 'hipcub-dev' 'rocfft' 'rocfft-dev' 'hipfft' 'hipfft-dev' 'hipfort' 'hipfort-dev' 
	'hipify-clang' 'hipsolver' 'hipsolver-dev' 'rocsparse' 'rocsparse-dev' 'hipsparse' 'hipsparse-dev' 'rccl' 'rccl-dev' 'rocrand' 'rocrand-dev' 'rocalution' 'rocalution-dev' 'rocm-hip-libraries' 
	'rocm-hip-runtime-dev' 'rocthrust' 'rocthrust-dev' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma-dev' 'rocm-developer-tools' 'miopen' 'miopen-hip' 'miopen-hip-dev' 'rocm-ml-libraries' 'rocm-ml-sdk')

source=(
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/o/openmp-extras-dev/openmp-extras-dev_15.54.0.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/rocm-llvm/rocm-llvm_15.0.0.23045.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/rocblas/rocblas_2.46.0.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/rocblas-dev/rocblas-dev_2.46.0.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/rocsolver/rocsolver_3.20.0.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/rocsolver-dev/rocsolver-dev_3.20.0.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/h/hipblas/hipblas_0.53.0.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/h/hipblas-dev/hipblas-dev_0.53.0.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/rocprim-dev/rocprim-dev_2.10.9.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/h/hipcub-dev/hipcub-dev_2.10.12.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/rocfft/rocfft_1.0.21.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/rocfft-dev/rocfft-dev_1.0.21.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/h/hipfft/hipfft_1.0.10.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/h/hipfft-dev/hipfft-dev_1.0.10.50403-121~22.04_amd64.deb"
#"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/h/hipfort/hipfort_0.4.0.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/h/hipfort-dev/hipfort-dev_0.4.0.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/h/hipsolver/hipsolver_1.6.0.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/h/hipsolver-dev/hipsolver-dev_1.6.0.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/h/hipify-clang/hipify-clang_15.0.0.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/rocsparse/rocsparse_2.3.3.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/rocsparse-dev/rocsparse-dev_2.3.3.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/h/hipsparse/hipsparse_2.3.3.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/h/hipsparse-dev/hipsparse-dev_2.3.3.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/rccl/rccl_2.13.4.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/rccl-dev/rccl-dev_2.13.4.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/rocrand/rocrand_2.10.9.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/rocrand-dev/rocrand-dev_2.10.9.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/rocalution/rocalution_2.1.3.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/rocalution-dev/rocalution-dev_2.1.3.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/rocm-hip-libraries/rocm-hip-libraries_5.4.3.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/rocm-hip-runtime-dev/rocm-hip-runtime-dev_5.4.3.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/rocthrust-dev/rocthrust-dev_2.10.9.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/rocm-hip-sdk/rocm-hip-sdk_5.4.3.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/rocm-opencl-sdk/rocm-opencl-sdk_5.4.3.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/rocwmma-dev/rocwmma-dev_0.7.0.50403-121~22.04_amd64.deb"
#"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/rocm-developer-tools/rocm-developer-tools_5.4.3.50403-121~22.04_amd64.deb"
# ML
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/m/miopen-hip/miopen-hip_2.19.0.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/m/miopen-hip-dev/miopen-hip-dev_2.19.0.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/rocm-ml-libraries/rocm-ml-libraries_5.4.3.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/rocm-ml-sdk/rocm-ml-sdk_5.4.3.50403-121~22.04_amd64.deb"
)

sha256sums=(
"fa94897b36bf595f6e50ede358bee46ad2a37a4e28704422f339ef10304e53d3"
"56c2cc6600afd3d8128252c9d8be4f8454e7109772d15bd809bb643eb2895ee6"
"4a49a8c365c557048adff9a433c71c338dd9b1f8a7a47004494c290e3be3a359"
"8b95354c0c9840d64a02176467565c9643fc246e5b41a4170f3590f8ba51803a"
"1423a5a8cf98f87b9a654ad7f52e594fb39b2cde0b89088fb6530158864a86ad"
"10b70a1f4bc7807ebf15022f5a20b26a49f296f46c33d740a5c799ad901ed67f"
"541f7278182538cd8f32fa92a5e6504fced7bfaa79c6a0fc3620a53c212973bb"
"d941861f3681a5b381dddfe27dca493e83caa4482bb92a00198bdde3f867b99a"
"d74157108bdb86bd3df8087975123355bc45d519b651ec7264ad4001e410d79d"
"0df2402502ba47efc3627bfc2b7bd3d098a8404b1e8e60722e180eb6948cd58a"
"b5b694bd7d496b51e473c5c6b671a2f86de330b4a3bba1c28321e5762fd0178c"
"51167db226af525eb0a516e6fcef12a6f8e43efcb0815c0a2eb852d65f54d74b"
"987517acb7462944c03e669e3fe69c3c5e2c17a7f8d246d56a5dd8a7787a37aa"
"19d7abaca575d79413771484d7559d1b49895e4fe537cacec8bc506eb97b61d8"
#"2c2bb011e24eaf7a4604a5496c024776e2db026bfc11e8f5c8748ad355655353"
"86f33f8e574a5adf3e59d472720851cc78984925a5c359842c15be539558e08c"
"ab36e8ef263976b68f4670795895ab37fdde7f0ea55298710d01582b2b5b3f72"
"082bc4ccfd0258c835a5a0bbc373b127e871db1004f24ca3d201451c872a3c2f"
"23c166c4861c29e624a88b44fb8e7af215e7848bc8ab3a803c6b00eb0d988339"
"728bca1ad0a8e5e3bf94b6cb06900ce9abae245f3963a8dcabcc00f0180fc6a0"
"633e41e61ab6120954a1968a131de6879677fba408c85dccd689db6e10be823e"
"e8a23ad3548cdf8f153595d8672b5c82eb522d3bd0cd452044fc1062426cbc2c"
"6feb963aa60ab48d4b19bbf801be704cde8727043df06b16e8a9cfd50685a16f"
"dc89001aaff1d79b628a2b3cc26020cd2209692e811514a6d3a84ab81482cb9d"
"f6440f05d4e6493809f6e99385acb3b284a96e5330db29b8b42556180648009f"
"a9564e0e895760ef3bd740b3d9aa092fded53137e3ba4cadbc2c45506df83561"
"0bb77b2de525f05bd492528a7c072c1f977d4235ef638b6219bb4abd617b8e15"
"aa85ab85da5fbb6d9d23cd13f61ae4338408833d5ebc692e25fb3e78694f75f5"
"fd77786328d454efd5d364af72113741b697bff8c02bdd28a2bd98fc4bad58d8"
"d48ade62acc337ac85c3f3974a3d36b8342369608874857ce2c9b0e0f137bb7a"
"ffb36db4111e1a02737da0597d9cb2d062ff04a6a2912736512dc1a7b3ae6d3a"
"af6b35550bffd74a74bc5762402c2122468bb5c151ece1ccb962ecb0a8e6c7f4"
"81e3d8df404206437daef6b5833475e8708da87955b601c0d2ce5ebb4ae3af31"
"716aa47f1399a1c52cd12f9a2395c79d9e3d835f15a894e7f2e35c8faf9c38de"
"01ba7047b55043f4a54cf8c0b6c85cd4418d6b2b1ccacbf8520c02ff2ebf943c"
# "4bba416791003fb689db8e9ebc68c15eac2951be98c4c5b9d09c40f202748d23"
# ML
"9002bf2730a3e12bb4960b3c6923287480151996d0c4286d0d55565fa6b3e878"
"1ea652722542f5faa61505d21b7e3efebab52f2c84ccc93a27376e80fce4bc60"
"dfca9acc88c16a9228069a5d590453f2a3e66770141e4aa82d9738f235089ea5"
"24d44478647962acff825f50961872bb7bdbc46722a83c46448babcea4adadee"
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
	egz "${srcdir}/openmp-extras-dev_15.54.0.50403-121~22.04_amd64.deb"
	egz "${srcdir}/rocm-llvm_15.0.0.23045.50403-121~22.04_amd64.deb"
	exz "${srcdir}/rocblas_2.46.0.50403-121~22.04_amd64.deb"
	exz "${srcdir}/rocblas-dev_2.46.0.50403-121~22.04_amd64.deb"
	exz "${srcdir}/hipblas_0.53.0.50403-121~22.04_amd64.deb"
	exz "${srcdir}/hipblas-dev_0.53.0.50403-121~22.04_amd64.deb"
	exz "${srcdir}/rocprim-dev_2.10.9.50403-121~22.04_amd64.deb"
	exz "${srcdir}/hipcub-dev_2.10.12.50403-121~22.04_amd64.deb"
	exz "${srcdir}/rocfft_1.0.21.50403-121~22.04_amd64.deb"
	exz "${srcdir}/rocfft-dev_1.0.21.50403-121~22.04_amd64.deb"
	exz "${srcdir}/hipfft_1.0.10.50403-121~22.04_amd64.deb"
	exz "${srcdir}/hipfft-dev_1.0.10.50403-121~22.04_amd64.deb"
	#exz "${srcdir}/hipfort_0.4.0.50403-121~22.04_amd64.deb"
	exz "${srcdir}/hipfort-dev_0.4.0.50403-121~22.04_amd64.deb"
	exz "${srcdir}/hipsolver_1.6.0.50403-121~22.04_amd64.deb"
	exz "${srcdir}/hipsolver-dev_1.6.0.50403-121~22.04_amd64.deb"
	egz "${srcdir}/hipify-clang_15.0.0.50403-121~22.04_amd64.deb"
	exz "${srcdir}/rocsparse_2.3.3.50403-121~22.04_amd64.deb"
	exz "${srcdir}/rocsparse-dev_2.3.3.50403-121~22.04_amd64.deb"
	exz "${srcdir}/hipsparse_2.3.3.50403-121~22.04_amd64.deb"
	exz "${srcdir}/hipsparse-dev_2.3.3.50403-121~22.04_amd64.deb"
	exz "${srcdir}/miopen-hip_2.19.0.50403-121~22.04_amd64.deb"
	exz "${srcdir}/miopen-hip-dev_2.19.0.50403-121~22.04_amd64.deb"
	exz "${srcdir}/rccl_2.13.4.50403-121~22.04_amd64.deb"
	exz "${srcdir}/rccl-dev_2.13.4.50403-121~22.04_amd64.deb"
	exz "${srcdir}/rocrand_2.10.9.50403-121~22.04_amd64.deb"
	exz "${srcdir}/rocrand-dev_2.10.9.50403-121~22.04_amd64.deb"
	exz "${srcdir}/rocalution_2.1.3.50403-121~22.04_amd64.deb"
	exz "${srcdir}/rocalution-dev_2.1.3.50403-121~22.04_amd64.deb"	
	egz "${srcdir}/rocm-hip-libraries_5.4.3.50403-121~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime-dev_5.4.3.50403-121~22.04_amd64.deb"	
	exz "${srcdir}/rocsolver_3.20.0.50403-121~22.04_amd64.deb"
	exz "${srcdir}/rocsolver-dev_3.20.0.50403-121~22.04_amd64.deb"	
	exz "${srcdir}/rocthrust-dev_2.10.9.50403-121~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-sdk_5.4.3.50403-121~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-sdk_5.4.3.50403-121~22.04_amd64.deb"
	exz "${srcdir}/rocwmma-dev_0.7.0.50403-121~22.04_amd64.deb"
	# egz "${srcdir}/rocm-developer-tools_5.4.3.50403-121~22.04_amd64.deb"
	egz "${srcdir}/rocm-ml-libraries_5.4.3.50403-121~22.04_amd64.deb"	
	egz "${srcdir}/rocm-ml-sdk_5.4.3.50403-121~22.04_amd64.deb"
	
	mv "${srcdir}/opt/" "${pkgdir}/"
	# mkdir -p "${pkgdir}/opt/rocm-5.4.3/hsa"
	# ln -s "/opt/rocm-5.4.3/include/hsa" "$pkgdir/opt/rocm-5.4.3/hsa/include"
}
# Release notes https://docs.amd.com/bundle/ROCm-Release-Notes-v5.3.2/page/About_This_Document.html
amdgpu_install='22.40.0.50302'
amdgpu_version='22.40.0'
rocm_version='50302'
amdgpu_build_id='1502151.22.04'
rocm_build_id='96~22.04'
llvm_build_id='22414'
amdgpu_repo='https://repo.radeon.com/amdgpu/5.3.2/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/5.3.2'
opencl_lib='opt/rocm-5.3.2/opencl/lib'
rocm_lib='opt/rocm-5.3.2/lib'
hip_lib='opt/rocm-5.3.2/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd-dev
pkgdesc="OpenCL SDK / HIP SDK / ROCM Compiler. This package needs at least 10GB of space."
pkgver=${amdgpu_install}
pkgrel=2
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('opencl-amd')
provides=('rocm-llvm' 'rocblas' 'rocblas-dev' 'rocsolver' 'rocsolver-dev' 'hipblas' 'hipblas-dev' 'rocprim-dev' 'hipcub-dev' 'rocfft' 'rocfft-dev' 'hipfft' 'hipfft-dev' 'hipfort' 'hipfort-dev' 
	'hipify-clang' 'hipsolver' 'hipsolver-dev' 'rocsparse' 'rocsparse-dev' 'hipsparse' 'hipsparse-dev' 'rccl' 'rccl-dev' 'rocrand' 'rocrand-dev' 'rocalution' 'rocalution-dev' 'rocm-hip-libraries' 
	'rocm-hip-runtime-dev' 'rocthrust-dev' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma-dev' 'rocm-developer-tools' 'miopen-hip' 'miopen-hip-dev' 'rocm-ml-libraries' 'rocm-ml-sdk')

source=(
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/o/openmp-extras-dev/openmp-extras-dev_15.53.0.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/rocm-llvm/rocm-llvm_15.0.0.22414.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/rocblas/rocblas_2.45.0.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/rocblas-dev/rocblas-dev_2.45.0.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/rocsolver/rocsolver_3.19.0.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/rocsolver-dev/rocsolver-dev_3.19.0.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/h/hipblas/hipblas_0.52.0.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/h/hipblas-dev/hipblas-dev_0.52.0.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/rocprim-dev/rocprim-dev_2.10.9.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/h/hipcub-dev/hipcub-dev_2.10.12.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/rocfft/rocfft_1.0.18.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/rocfft-dev/rocfft-dev_1.0.18.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/h/hipfft/hipfft_1.0.9.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/h/hipfft-dev/hipfft-dev_1.0.9.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/h/hipfort/hipfort_0.4.0.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/h/hipfort-dev/hipfort-dev_0.4.0.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/h/hipify-clang/hipify-clang_15.0.0.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/rocsparse/rocsparse_2.3.3.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/rocsparse-dev/rocsparse-dev_2.3.3.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/h/hipsparse/hipsparse_2.3.2.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/h/hipsparse-dev/hipsparse-dev_2.3.2.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/rccl/rccl_2.12.12.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/rccl-dev/rccl-dev_2.12.12.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/rocrand/rocrand_2.10.9.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/rocrand-dev/rocrand-dev_2.10.9.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/rocalution/rocalution_2.1.2.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/rocalution-dev/rocalution-dev_2.1.2.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/rocm-hip-libraries/rocm-hip-libraries_5.3.2.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/rocm-hip-runtime-dev/rocm-hip-runtime-dev_5.3.2.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/rocthrust-dev/rocthrust-dev_2.10.9.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/rocm-hip-sdk/rocm-hip-sdk_5.3.2.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/rocm-opencl-sdk/rocm-opencl-sdk_5.3.2.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/rocwmma-dev/rocwmma-dev_0.7.0.50302-96~22.04_amd64.deb"
#"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/rocm-developer-tools/rocm-developer-tools_5.3.2.50302-96~22.04_amd64.deb"
# ML
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/m/miopen-hip/miopen-hip_2.18.0.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/m/miopen-hip-dev/miopen-hip-dev_2.18.0.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/rocm-ml-libraries/rocm-ml-libraries_5.3.2.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/rocm-ml-sdk/rocm-ml-sdk_5.3.2.50302-96~22.04_amd64.deb"
)

sha256sums=(
"1a5db78cbdb7b58c6913ac14771deb26dc62fa07c440958daa9d045663409469"
"778952022afb5e4c0925024f983c10f499e55eebd59c35b9818379374e596aad"
"44ed9ddcc994c5db9dc4fc723dc91d015865ed854d2d6a2ae34123d47e10e9b9"
"1034a4b764bda562ded7642f58873cd084ed7b2643f5f6ec23410cda41d9ca68"
"df307683422300e5176d74e2161c508b9cb4319a3d46f81a31a020b58dc0650b"
"4d4b62d8a11fd9002bfb9f33d3393a1bb219d43acccdeb2d5f9dbe3d9938fde0"
"01ee59f99324f8e19a70f4e8abb52759fbef4972fe0695f05b323148321a5e90"
"0fc158ccb6ea57569702f33bfda41790ad7d909e65c203470bf01cc206e2a8bd"
"8de188aeb7ccb9f31e432812f6e8bb15a982af159e8d9851ef5ddd3eb71b6c6d"
"dde5522c3a8433f9f9d089f7de7236a59f3f46e20b251d1e4844977fe194f8c7"
"41ede666e55a1f26b820bb750ab6fc79557cc4f8bd32c1fac038b115a0871394"
"32dd1b20bc3b5ac1eff99b99c92f6cfdc7061a8392474746496d31de8b7f20ca"
"7cda53953b8c1424c1220032f72565163de96832ccc9f394bc7c8bbac0918355"
"f2221d8fdba17682d5b4db5e69388a91b43409f1148ad1b1c240d049ccab8b50"
"bae7a04c4dea951c7942b265c547e121951bc4e2ef4333ac06a9cf7a0de879c2"
"5bb96daeddf80dfe8e1ea3d7c3449bb45020c75bab0865cee320e4f4a9b95e0f"
"5c80c76cc8adf4d91eb33918f174f7e4c484d02a2139f29aa132222e53ea7408"
"0627acbcc85e5fa41d9de70bb4b4d680aae5649344541d4b093e698ff1212c53"
"0da07f483b809b4b8407c4f5b042a0586eb90b57173f2939d78675834358ca62"
"3655d43860eb13d5a29e7b5026259f6b5eaf6d497907acb9a058a5e7d1bca6d9"
"4bb0092f68557802d107bb6d0b70892453aea2869a1ca5bedb522b7465ad9ba6"
"1ceff23441852a88b44d42c0fb7c99af9e102e3c02592dae7fb5dfa4bf981935"
"bb8006b08f66ab5075245c275d74bf306af6cd4d63a9b6be4bd6c8121ce24ca8"
"4197bf056b33652d4ef88d203954198939fc3744b97dca172135ce692fd291a0"
"38cab3bc982ff3626e26a9f4ebf5ffaeceafd8f563001747689a666f945dadb6"
"164fdfb31d8e34282ec5f788b2ffe63dbc241b1ac46c1bbe751f86c06501ce72"
"0642735f9c27b45ef54bea1df45659e7726e7cf9ed4cd23ea1243bff884c7ba0"
"dab84a1ec39fb26ab3d718c245e07d976824d7af55e7ecf51d82dd0d236e9337"
"a846bed74a2e1c54457ae0bb7e9323be52114caf2ecef7f025e730ea11462a4d"
"fb17572472413bd16354af52c82f2a7424fb7dc99b00b19efee721f8f33db727"
"82bb0d2bba8b2d4e8de270fd43e46dad1167c07755e7c2397eb7eee24a496d57"
"0c988f2663aa81518e9dc5f2816ec887ce5acd3fdc6919653312e62838b20750"
"316e8fd58356ddc12368d36420010f6b46c8f7e3975e6879645af3c80f049b0a"
# "4bba416791003fb689db8e9ebc68c15eac2951be98c4c5b9d09c40f202748d23"
# ML
"d3780ca185c914ca19234fc0f2ce02fa882cf8ea867e131bd409e286f6ef32b0"
"bcc8d0c89c9c17a74cb24cdbaa3d0b1f304f8aeb273217b2e5f79a1f52777e4c"
"d090285182fec0017897965e4dc6fde27908dd30ed823445364d7eae33903dd9"
"d8be9377203fe3c8671a74e34407094a33d0bda65fce5aa68d159bf92eb80ee7"
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
	egz "${srcdir}/openmp-extras-dev_15.53.0.50302-96~22.04_amd64.deb"
	egz "${srcdir}/rocm-llvm_15.0.0.22414.50302-96~22.04_amd64.deb"
	exz "${srcdir}/rocblas_2.45.0.50302-96~22.04_amd64.deb"
	exz "${srcdir}/rocblas-dev_2.45.0.50302-96~22.04_amd64.deb"
	exz "${srcdir}/hipblas_0.52.0.50302-96~22.04_amd64.deb"
	exz "${srcdir}/hipblas-dev_0.52.0.50302-96~22.04_amd64.deb"
	exz "${srcdir}/rocprim-dev_2.10.9.50302-96~22.04_amd64.deb"
	exz "${srcdir}/hipcub-dev_2.10.12.50302-96~22.04_amd64.deb"
	exz "${srcdir}/rocfft_1.0.18.50302-96~22.04_amd64.deb"
	exz "${srcdir}/rocfft-dev_1.0.18.50302-96~22.04_amd64.deb"
	exz "${srcdir}/hipfft_1.0.9.50302-96~22.04_amd64.deb"
	exz "${srcdir}/hipfft-dev_1.0.9.50302-96~22.04_amd64.deb"
	exz "${srcdir}/hipfort_0.4.0.50302-96~22.04_amd64.deb"
	exz "${srcdir}/hipfort-dev_0.4.0.50302-96~22.04_amd64.deb"
	egz "${srcdir}/hipify-clang_15.0.0.50302-96~22.04_amd64.deb"
	exz "${srcdir}/rocsparse_2.3.3.50302-96~22.04_amd64.deb"
	exz "${srcdir}/rocsparse-dev_2.3.3.50302-96~22.04_amd64.deb"
	exz "${srcdir}/hipsparse_2.3.2.50302-96~22.04_amd64.deb"
	exz "${srcdir}/hipsparse-dev_2.3.2.50302-96~22.04_amd64.deb"
	exz "${srcdir}/miopen-hip_2.18.0.50302-96~22.04_amd64.deb"
	exz "${srcdir}/miopen-hip-dev_2.18.0.50302-96~22.04_amd64.deb"
	exz "${srcdir}/rccl_2.12.12.50302-96~22.04_amd64.deb"
	exz "${srcdir}/rccl-dev_2.12.12.50302-96~22.04_amd64.deb"
	exz "${srcdir}/rocrand_2.10.9.50302-96~22.04_amd64.deb"
	exz "${srcdir}/rocrand-dev_2.10.9.50302-96~22.04_amd64.deb"
	exz "${srcdir}/rocalution_2.1.2.50302-96~22.04_amd64.deb"
	exz "${srcdir}/rocalution-dev_2.1.2.50302-96~22.04_amd64.deb"	
	egz "${srcdir}/rocm-hip-libraries_5.3.2.50302-96~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime-dev_5.3.2.50302-96~22.04_amd64.deb"	
	exz "${srcdir}/rocsolver_3.19.0.50302-96~22.04_amd64.deb"
	exz "${srcdir}/rocsolver-dev_3.19.0.50302-96~22.04_amd64.deb"	
	exz "${srcdir}/rocthrust-dev_2.10.9.50302-96~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-sdk_5.3.2.50302-96~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-sdk_5.3.2.50302-96~22.04_amd64.deb"
	exz "${srcdir}/rocwmma-dev_0.7.0.50302-96~22.04_amd64.deb"
	# egz "${srcdir}//rocm-developer-tools_5.3.2.50302-96~22.04_amd64.deb"
	egz "${srcdir}/rocm-ml-libraries_5.3.2.50302-96~22.04_amd64.deb"	
	egz "${srcdir}/rocm-ml-sdk_5.3.2.50302-96~22.04_amd64.deb"
	
	mv "${srcdir}/opt/" "${pkgdir}/"
	# mkdir -p "${pkgdir}/opt/rocm-5.3.2/hsa"
	# ln -s "/opt/rocm-5.3.2/include/hsa" "$pkgdir/opt/rocm-5.3.2/hsa/include"
}
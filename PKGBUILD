# Release notes https://rocm.docs.amd.com/en/latest/about/CHANGELOG.html#rocm-6-1-2
amdgpu_repo='https://repo.radeon.com/amdgpu/6.1.2/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/6.1.2'
opencl_lib='opt/rocm-6.1.2/opencl/lib'
rocm_lib='opt/rocm-6.1.2/lib'
hip_lib='opt/rocm-6.1.2/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd-dev
pkgdesc="OpenCL SDK / HIP SDK / ROCM Compiler. This package needs at least 20GB of disk space."
pkgver=6.1.2
pkgrel=1
epoch=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('opencl-amd' 'suitesparse' 'blas' 'lapack')
provides=('composablekernel-dev' 'rocm-llvm' 'rocblas' 'rocblas-dev' 'rocsolver' 'rocsolver-dev' 'half' 'hipblas' 'hipblas-dev' 'hipblaslt' 'hipblaslt-dev' 'hiprand' 'hiprand-dev' 'rocprim' 'rocprim-dev' 'hipcub' 'hipcub-dev' 'rocfft' 'rocfft-dev' 'hipfft' 'hipfft-dev'
	'hipfort' 'hipfort-dev' 'hipify-clang' 'hipsolver' 'hipsolver-dev' 'rocsparse' 'rocsparse-dev' 'hipsparse' 'hipsparse-dev' 'hipsparselt' 'hipsparselt-dev' 'hiptensor' 'hiptensor-dev' 'openmp-extras-dev' 'rccl' 'rccl-dev' 'rocrand' 'rocrand-dev' 'rocalution' 'rocalution-dev' 'rocm-hip-libraries' 'rocm-hip-runtime-dev' 'rocthrust' 'rocthrust-dev' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma-dev' 'rocm-developer-tools' 'miopen' 'miopen-hip' 'miopen-hip-dev' 'rocm-ml-libraries' 'rocm-ml-sdk')
conflicts=('composablekernel-dev' 'rocm-llvm' 'rocblas' 'rocblas-dev' 'rocsolver' 'rocsolver-dev' 'hipblas' 'hipblas-dev' 'hipblaslt' 'hipblaslt-dev' 'hiprand' 'hiprand-dev' 'rocprim' 'rocprim-dev' 'hipcub' 'hipcub-dev' 'rocfft' 'rocfft-dev' 'hipfft' 'hipfft-dev'
	'hipfort' 'hipfort-dev' 'hipify-clang' 'hipsolver' 'hipsolver-dev' 'rocsparse' 'rocsparse-dev' 'hipsparse' 'hipsparse-dev' 'hipsparselt' 'hipsparselt-dev' 'hiptensor' 'hiptensor-dev' 'openmp-extras-dev' 'rccl' 'rccl-dev' 'rocrand' 'rocrand-dev' 'rocalution' 'rocalution-dev' 'rocm-hip-libraries' 'rocm-hip-runtime-dev' 'rocthrust' 'rocthrust-dev' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma-dev' 'rocm-developer-tools' 'miopen' 'miopen-hip' 'miopen-hip-dev' 'rocm-ml-libraries' 'rocm-ml-sdk')

source=(
#'libmetis5'
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/c/composablekernel-dev/composablekernel-dev_1.1.0.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/h/half/half_1.12.0.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/h/hiprand/hiprand_2.10.16.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/h/hiprand-dev/hiprand-dev_2.10.16.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/h/hipcub-dev/hipcub-dev_3.1.0.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/h/hipblas/hipblas_2.1.0.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/h/hipblas-dev/hipblas-dev_2.1.0.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/h/hipblaslt/hipblaslt_0.7.0.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/h/hipblaslt-dev/hipblaslt-dev_0.7.0.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/h/hipfft/hipfft_1.0.14.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/h/hipfft-dev/hipfft-dev_1.0.14.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/h/hipfort-dev/hipfort-dev_0.4.0.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/h/hipsolver/hipsolver_2.1.1.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/h/hipsolver-dev/hipsolver-dev_2.1.1.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/h/hipify-clang/hipify-clang_17.0.0.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/h/hipsparse/hipsparse_3.0.1.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/h/hipsparse-dev/hipsparse-dev_3.0.1.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/h/hipsparselt/hipsparselt_0.2.0.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/h/hipsparselt-dev/hipsparselt-dev_0.2.0.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/h/hiptensor/hiptensor_1.2.0.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/h/hiptensor-dev/hiptensor-dev_1.2.0.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/o/openmp-extras-dev/openmp-extras-dev_17.60.0.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocm-llvm/rocm-llvm_17.0.0.24193.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocblas/rocblas_4.1.2.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocblas-dev/rocblas-dev_4.1.2.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocsolver/rocsolver_3.25.0.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocsolver-dev/rocsolver-dev_3.25.0.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocprim-dev/rocprim-dev_3.1.0.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocfft/rocfft_1.0.27.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocfft-dev/rocfft-dev_1.0.27.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocsparse/rocsparse_3.1.2.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocsparse-dev/rocsparse-dev_3.1.2.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rccl/rccl_2.18.6.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rccl-dev/rccl-dev_2.18.6.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocrand/rocrand_3.0.1.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocrand-dev/rocrand-dev_3.0.1.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocalution/rocalution_3.1.1.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocalution-dev/rocalution-dev_3.1.1.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocm-hip-libraries/rocm-hip-libraries_6.1.2.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocm-hip-runtime-dev/rocm-hip-runtime-dev_6.1.2.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocthrust-dev/rocthrust-dev_3.0.1.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocm-hip-sdk/rocm-hip-sdk_6.1.2.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocm-opencl-sdk/rocm-opencl-sdk_6.1.2.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocwmma-dev/rocwmma-dev_1.4.0.60102-119~22.04_amd64.deb"
# ML
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/m/miopen-hip/miopen-hip_3.1.0.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/m/miopen-hip-dev/miopen-hip-dev_3.1.0.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocm-ml-libraries/rocm-ml-libraries_6.1.2.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocm-ml-sdk/rocm-ml-sdk_6.1.2.60102-119~22.04_amd64.deb"
)

sha256sums=(
"aae2fb72243a916a6a202b445393994a81829d27506ff2f501946770fa92ca9f"
"ba16c8db0e27c0d2885192a4fb36c1cbb9af06b5d1149131ae66763fecf5281d"
"795c29c501a0ea5eb8e773e87bdcd4779000d110ae95170fc98ec41137c8aa85"
"b3cb02ffdbfc7c300e2bf12e1c1bac49c70e87443f850a527563058c6a36ef77"
"b446e3c2676c0bb91d94dc51da40626ae1efd4df3ba94b7a3e97451b3cc65672"
"212ec7714bd4cb227cfa357ae4ae634b689c66b0acf720caed64d67517d8bda9"
"6b44bce4472ed508ee70500a8612fdee9bdf655b03c41df838308656a084d400"
"1b48768dd4cbe8bd972bdb07e66e003ce3f6231ebfc9edefe6b3212d052937f6"
"ee2fdb296624fad477766124848fad6f3796675829adef5cb13f8301c321b3f4"
"b8cb84bf2317566c6b7df4d60d1388ea5db62f8f3cfac1d45c37f547a41e68b4"
"4b15ca01828e19de7abb576e6ee853a20835880fc57db063215ac16818a1ac5e"
"6686c93816c1db81d7668e44a04268c6c9f2b25bfc98a8be1327ed1ada340939"
"2497932e55247dc52ccf2805643e14f5723444398aa506fbb12573631e0fe5eb"
"128e75e44de108d6fd7ad7c15fb69ef9db2b39050e82cbed18513cc81927c2e7"
"02e2c3517ccf5faf2fac5df514aa05eca724416b61eda2bbee085b22a07166b4"
"578861e7deef0aa922d766e696664b67a44f57994ae4dde06c857b2ca1f6622a"
"6a717318ce8877cc552499454e999a57c63d43b131cfced8dfc309d1925d302e"
"e90c2aaa514d6b0f051796354944e8f4ca722af921eeb0d55eabef765bf52be6"
"b2ac410f9d3ab95b433c18de2e089d3d81619332e4ff92b6d228ad8bd4c566be"
"d1685fb67651cc1d62e096e51636f2e031a7f8a8866521493ff3b619af82d8b1"
"bec1cd8d2280f06479eafc34ecc140ea2dcda0598bb7b9e1836515e787c9405c"
"f84a42ad4743576c5a6e9371a188a10b2d92c45663c6cbd0d50d2f41b4b0604f"
"5561ff2d40a42d27d289a331954f32b4f0f63589f8aa2d62b938b0d3c037a1f4"
"4a406530e2f11902d0fb1eff582d77daf3f560b46a162f372c5920623cc36ede"
"970abaa4da941593280fd107b77a51cc736ba7384ed1839d959385eaf6a649f1"
"5af2f184f7b36bdb4e2092716c8c68d1293cc94b0a919a20a5b99401368da4da"
"a934bbe65d2dda03c5415b213a599589c54268303dfc303b545c626b15ea92a9"
"9a0b6b66dcd30ccb41a83a8313ef359ed8a368dd64a69e02fff8cb6d445fdaa7"
"c08232411ab93ade0d2ec521e9e2fb7256bc8e21bceb5f580529182e84b15b8f"
"226946ffe7da8708061a452130b3b49520032262559eb034387cd23751401a55"
"e266195b9f589c36845c0046a438dc6c557fe6516f21809734a4c6adc597c5cd"
"422c02055c6b6753ab0553e1247949b918784f6583b3de0c252f67ea32adcd09"
"38aef8e9b2e1dca0a51cb821b72158271e32c5b4a98b6c0f7439ea8dc6bf5300"
"a4584a0be1bb6b29c8c7d8b90d0f4d9e1eb8c203cd2395fe727971e401c0ffce"
"6eb92afc2efbe98e4ab385172c8c80b9b731449bbfeebc4d4bdc3333ea788d7a"
"a681c483dc4bb25d55667e8c300ee56f040c7b6973d3533950df99f5f4fd87d2"
"3df08131371b1d753d025a78eff5153c945f1f7fed048dd934d454481df27633"
"64ba0b877e51150553df928705832a7019ec2c7194f24eeb5060e5fa999f9cec"
"d2ee453cbd7ac6bf78fd7993fbc2d058e754ab5df0c0acf36a66baf8566d6a80"
"9b1a414bcd3686082a95f08f74dc4943dc415cfda09e3c4c88ed808c44e998e8"
"7be53ab56d36685182c0f3f27129662881b1827ad6048f637543a496ac8d4e7c"
"a5b450c24fea281087df7e1a43c2c736a041c880dbd93ebb84281dc967a0f172"
"47fc3f453a4c1afc614001f27d2576fa0ee1a065a7b49271d580bd64cd4c29ba"
"ddc146916cb8341cffeb65b281f477b408a7e1af152e6ac92948af47d1f2c141"
# ML
"4b2ac1f35a60004fa360311cc9ab8815114e108dc1dcc74792003f4404c9f11c"
"4d9ca7d04ba29ad6595e1371f2a69c100a04697daa4ead91ad2f847a5c34310d"
"c1e8f9159f68cd0641e70f1bc96c18fd6b725ce5674d75a8f6398d1a20cc80b6"
"7dce869a869a2b3ae30cf2742a93922f060d26b3cb251e5798f0144313d39bbb"
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
	exz "${srcdir}/composablekernel-dev_1.1.0.60102-119~22.04_amd64.deb"
	exz "${srcdir}/half_1.12.0.60102-119~22.04_amd64.deb"
	exz "${srcdir}/hiprand_2.10.16.60102-119~22.04_amd64.deb"
	exz "${srcdir}/hiprand-dev_2.10.16.60102-119~22.04_amd64.deb"
	exz "${srcdir}/hipblas_2.1.0.60102-119~22.04_amd64.deb"
	exz "${srcdir}/hipblas-dev_2.1.0.60102-119~22.04_amd64.deb"
	exz "${srcdir}/hipblaslt_0.7.0.60102-119~22.04_amd64.deb"
	exz "${srcdir}/hipblaslt-dev_0.7.0.60102-119~22.04_amd64.deb"
	exz "${srcdir}/hipcub-dev_3.1.0.60102-119~22.04_amd64.deb"
	exz "${srcdir}/hipfft_1.0.14.60102-119~22.04_amd64.deb"
	exz "${srcdir}/hipfft-dev_1.0.14.60102-119~22.04_amd64.deb"	
	exz "${srcdir}/hipfort-dev_0.4.0.60102-119~22.04_amd64.deb"
	exz "${srcdir}/hipsolver_2.1.1.60102-119~22.04_amd64.deb"
	exz "${srcdir}/hipsolver-dev_2.1.1.60102-119~22.04_amd64.deb"
	egz "${srcdir}/hipify-clang_17.0.0.60102-119~22.04_amd64.deb"
	exz "${srcdir}/hipsparse_3.0.1.60102-119~22.04_amd64.deb"
	exz "${srcdir}/hipsparse-dev_3.0.1.60102-119~22.04_amd64.deb"
	exz "${srcdir}/hipsparselt_0.2.0.60102-119~22.04_amd64.deb"
	exz "${srcdir}/hipsparselt-dev_0.2.0.60102-119~22.04_amd64.deb"
	exz "${srcdir}/hiptensor_1.2.0.60102-119~22.04_amd64.deb"
	exz "${srcdir}/hiptensor-dev_1.2.0.60102-119~22.04_amd64.deb"	
	exz "${srcdir}/miopen-hip_3.1.0.60102-119~22.04_amd64.deb"
	exz "${srcdir}/miopen-hip-dev_3.1.0.60102-119~22.04_amd64.deb"
	egz "${srcdir}/openmp-extras-dev_17.60.0.60102-119~22.04_amd64.deb"
	egz "${srcdir}/rocm-llvm_17.0.0.24193.60102-119~22.04_amd64.deb"	
	exz "${srcdir}/rocblas_4.1.2.60102-119~22.04_amd64.deb"
	exz "${srcdir}/rocblas-dev_4.1.2.60102-119~22.04_amd64.deb"
	exz "${srcdir}/rocprim-dev_3.1.0.60102-119~22.04_amd64.deb"
	exz "${srcdir}/rocfft_1.0.27.60102-119~22.04_amd64.deb"
	exz "${srcdir}/rocfft-dev_1.0.27.60102-119~22.04_amd64.deb"
	exz "${srcdir}/rocsparse_3.1.2.60102-119~22.04_amd64.deb"
	exz "${srcdir}/rocsparse-dev_3.1.2.60102-119~22.04_amd64.deb"
	exz "${srcdir}/rccl_2.18.6.60102-119~22.04_amd64.deb"
	exz "${srcdir}/rccl-dev_2.18.6.60102-119~22.04_amd64.deb"
	exz "${srcdir}/rocrand_3.0.1.60102-119~22.04_amd64.deb"
	exz "${srcdir}/rocrand-dev_3.0.1.60102-119~22.04_amd64.deb"
	exz "${srcdir}/rocalution_3.1.1.60102-119~22.04_amd64.deb"
	exz "${srcdir}/rocalution-dev_3.1.1.60102-119~22.04_amd64.deb"	
	egz "${srcdir}/rocm-hip-libraries_6.1.2.60102-119~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime-dev_6.1.2.60102-119~22.04_amd64.deb"
	exz "${srcdir}/rocsolver_3.25.0.60102-119~22.04_amd64.deb"
	exz "${srcdir}/rocsolver-dev_3.25.0.60102-119~22.04_amd64.deb"	
	exz "${srcdir}/rocthrust-dev_3.0.1.60102-119~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-sdk_6.1.2.60102-119~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-sdk_6.1.2.60102-119~22.04_amd64.deb"
	exz "${srcdir}/rocwmma-dev_1.4.0.60102-119~22.04_amd64.deb"	
	egz "${srcdir}/rocm-ml-libraries_6.1.2.60102-119~22.04_amd64.deb"	
	egz "${srcdir}/rocm-ml-sdk_6.1.2.60102-119~22.04_amd64.deb"
	
	mv "${srcdir}/opt/" "${pkgdir}/"
	# mkdir -p "${pkgdir}/opt/rocm-6.1.2/hsa"
	# ln -s "/opt/rocm-6.1.2/include/hsa" "$pkgdir/opt/rocm-6.1.2/hsa/include"
}
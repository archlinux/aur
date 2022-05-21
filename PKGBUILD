# Release notes https://docs.amd.com/bundle/ROCm-Release-Notes-v5.1/page/About_This_Document.html
amdgpu_install='22.10.3.50103'
amdgpu_version='22.10.3'
rocm_version='50103'
amdgpu_build_id='1420322'
rocm_build_id='66'
amdgpu_repo='https://repo.radeon.com/amdgpu/22.10.3/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/5.1.3'
opencl_lib='opt/rocm-5.1.3/opencl/lib'
rocm_lib='opt/rocm-5.1.3/lib'
hip_lib='opt/rocm-5.1.3/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd-dev
pkgdesc="OpenCL SDK / HIP SDK / ROCM Compiler. This package needs at least 10GB of space."
pkgver=${amdgpu_install}
pkgrel=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('opencl-amd')
provides=('rocm-llvm' 'hip-dev' 'hip-doc' 'hip-samples' 'rocblas' 'rocsolver' 'hipblas' 'hipblas-dev' 'rocprim-dev' 'hipcub-dev' 'rocfft' 'hipfft' 'hipfft-dev' 'hipify-clang'
	'rocsparse' 'hipsparse' 'hipsparse-dev' 'rocm-clang-ocl' 'miopen-hip' 'miopen-hip-dev' 'rccl' 'rccl-dev' 'rocrand' 'rocalution' 'rocalution-dev' 'rocblas-dev' 'rocfft-dev'
	'rocm-hip-libraries' 'rocm-hip-runtime-dev' 'rocrand-dev' 'rocsolver-dev' 'rocsparse-dev' 'rocthrust-dev' 'rocm-hip-sdk' 'miopentensile' 'miopentensile-dev' 'rocm-ml-libraries')

source=(
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/r/rocm-llvm/rocm-llvm_14.0.0.22114.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/r/rocblas/rocblas_2.43.0.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/r/rocblas-dev/rocblas-dev_2.43.0.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/r/rocsolver/rocsolver_3.17.0.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/r/rocsolver-dev/rocsolver-dev_3.17.0.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/h/hipblas/hipblas_0.50.0.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/h/hipblas-dev/hipblas-dev_0.50.0.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/r/rocprim-dev/rocprim-dev_2.10.9.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/h/hipcub-dev/hipcub-dev_2.10.12.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/r/rocfft/rocfft_1.0.16.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/r/rocfft-dev/rocfft-dev_1.0.16.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/h/hipfft/hipfft_1.0.7.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/h/hipfft-dev/hipfft-dev_1.0.7.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/h/hipify-clang/hipify-clang_14.0.0.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/r/rocsparse/rocsparse_2.1.0.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/r/rocsparse-dev/rocsparse-dev_2.1.0.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/h/hipsparse/hipsparse_2.1.0.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/h/hipsparse-dev/hipsparse-dev_2.1.0.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/m/miopen-hip/miopen-hip_2.16.0.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/m/miopen-hip-dev/miopen-hip-dev_2.16.0.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/r/rccl/rccl_2.11.4.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/r/rccl-dev/rccl-dev_2.11.4.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/r/rocrand/rocrand_2.10.9.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/r/rocrand-dev/rocrand-dev_2.10.9.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/r/rocalution/rocalution_2.0.2.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/r/rocalution-dev/rocalution-dev_2.0.2.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/r/rocm-hip-libraries/rocm-hip-libraries_5.1.3.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/r/rocm-hip-runtime-dev/rocm-hip-runtime-dev_5.1.3.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/r/rocthrust-dev/rocthrust-dev_2.10.9.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/r/rocm-hip-sdk/rocm-hip-sdk_5.1.3.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/r/rocm-opencl-sdk/rocm-opencl-sdk_5.1.3.50103-66_amd64.deb"
# MLLIB
# "https://repo.radeon.com/rocm/apt/5.1.3/pool/main/m/miopentensile/miopentensile_1.0.0.50103-66_amd64.deb"
# "https://repo.radeon.com/rocm/apt/5.1.3/pool/main/m/miopentensile-dev/miopentensile-dev_1.0.0.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/r/rocm-ml-libraries/rocm-ml-libraries_5.1.3.50103-66_amd64.deb"
)

sha256sums=(
"a16639a933d0e3e796331651ca05a57d79f655216866b748dff92f65e32f7752"
"bf3c2c662a88a4c603c376d454878c9e55bf9cfcad3dbbb1a5497ffac9f8678a"
"328b770e329ba85a8f187c073193ab9f2df278a3140fcc0811bc9c2474269992"
"cf99471d0029a0f170ffa744cef353240a4e9b55a47286cd75350bb40ff7fb78"
"9a92ea11a5bedce6077d9eba65b94da23cfcf8d02302ddce1c17f8dc50cc5ca7"
"de0bee2c03703aefec462903462068f4c654af75372c5af1c33a74a747d91180"
"09299c803c4ff3823a8eccf1a399cf3618a59a9ed24aa9a6a915fa3455c81abe"
"643683f01683e669e5d4a6ab48c7e570c28018704eb5146f82c7070e0435e9f3"
"8e646c8eeff51536b12c44292bdb01348cfde00f8769976a6ac12075a61f3bdd"
"4c5afe63629fe36676d267aa7ac462839526b97497d287200fc32785cb4708f5"
"a8faa4a0680e2d4ad66a2dcf542fb434bee2fa62851ee4d639d6881a6eae1eac"
"8b6b393f661595f271dd1640ac0e9f81a0274323245d6222100d48638fa33d26"
"4ef1cf885ab32771d0e0768a4c4b95637ff00c59b58b1185f5aa1638d74475f6"
"3e36e45d6816bcc4f1c7ef0efc184a15c41644c7d4b0348c935f01e6351b996c"
"72f28bf13a659b838890df4052bec17940eed5fbb426786098f4c49c280a3976"
"cfa3133812ec9b0826f273a09fe91bc606dd3c76197ace8da4ac8a594edd6966"
"4bc9257920618ec2c5895726feaaf5b62545bd2721074fb4b36647d1d1fa93b4"
"eae6a06d891e1c03ed14062e002f7a6f8d5726e3d0d6d4486f514b04c70d2793"
"614e44c6fdcd4b594af62eee68a154018d22671a58675cd2b9297219d04956b9"
"18830f2dcac9848888d89f6e3dc5328acea865be04085fa4695c382101bed300"
"8a678fe0b72fc9ff4cb81a24fe61c049513e8ee358bd682c60bb57de79c01640"
"49e73a67cfe26bfb1a2c49e895852451418a7aeba03e4f8146fd1e49fcd86c3a"
"08a540b8d6d47da8732a3d07e854bf5ad7d404e764342bcf850f5dc943e8ac55"
"4cb07076c63f04233c5bbb6041b45583bb0e94de674f0f41241963e3246e1cc5"
"e8fb34f0e553593a12125d900a91e31c3ea2d771d82a883f307a5c422f4dcdcd"
"4d7e045ddc7b7c853581533055500979b6cd78857f1d3029b07c4e79c7228238"
"41583a1b56a5444d2fc9744583035c03e5c9434f264767b377d67fd4400acee1"
"71f1f4fe3e00143ce890c916878ee515ef95cd9ef42455ad2ad00a511ad33e9a"
"abe6d8de8b49dcc017f19bb326caaa0ee88099ff78fc2fd75b9456479ad04a5c"
"eb04f9926946e4042fac74e47040df93a870b850f8ab6765620aae2363b95407"
"b6d93a8ff39009553c352e127edd6087bbeb562b001b0ba0b6e36306e586d825"
# MLLIB
# "3ed0ef781041d4a25480dd76bab02b7ac05f5d437e823da463d5817dcea366ea"
# "93bc701c6bf31357e0bfaf51f855a319839d494719d335bc826fc91273bffb93"
"d15584a5d1432f6520e2c85be17d7fb615e90bcb350fc54ff003fb3818d25624"
)

#Extract .xz files
exz() {
	ar x $1
	tar xJf data.tar.xz
	rm data.tar.xz
}
#Extract .gz files
egz() {
	ar x $1
	tar xfx data.tar.gz
	rm data.tar.gz
}

package() {
	exz "${srcdir}/rocm-llvm_14.0.0.22114.50103-66_amd64.deb"
	egz "${srcdir}/rocblas_2.43.0.50103-66_amd64.deb"
	egz "${srcdir}/rocsolver_3.17.0.50103-66_amd64.deb"
	egz "${srcdir}/hipblas_0.50.0.50103-66_amd64.deb"
	egz "${srcdir}/hipblas-dev_0.50.0.50103-66_amd64.deb"
	egz "${srcdir}/rocprim-dev_2.10.9.50103-66_amd64.deb"
	egz "${srcdir}/hipcub-dev_2.10.12.50103-66_amd64.deb"
	egz "${srcdir}/rocfft_1.0.16.50103-66_amd64.deb"
	egz "${srcdir}/hipfft_1.0.7.50103-66_amd64.deb"
	egz "${srcdir}/hipfft-dev_1.0.7.50103-66_amd64.deb"
	egz "${srcdir}/hipify-clang_14.0.0.50103-66_amd64.deb"
	egz "${srcdir}/rocsparse_2.1.0.50103-66_amd64.deb"
	egz "${srcdir}/hipsparse_2.1.0.50103-66_amd64.deb"
	egz "${srcdir}/hipsparse-dev_2.1.0.50103-66_amd64.deb"
	egz "${srcdir}/miopen-hip_2.16.0.50103-66_amd64.deb"
	egz "${srcdir}/miopen-hip-dev_2.16.0.50103-66_amd64.deb"
	egz "${srcdir}/rccl_2.11.4.50103-66_amd64.deb"
	egz "${srcdir}/rccl-dev_2.11.4.50103-66_amd64.deb"
	egz "${srcdir}/rocrand_2.10.9.50103-66_amd64.deb"
	egz "${srcdir}/rocalution_2.0.2.50103-66_amd64.deb"
	egz "${srcdir}/rocalution-dev_2.0.2.50103-66_amd64.deb"
	egz "${srcdir}/rocblas-dev_2.43.0.50103-66_amd64.deb"
	egz "${srcdir}/rocfft-dev_1.0.16.50103-66_amd64.deb"
	egz "${srcdir}/rocm-hip-libraries_5.1.3.50103-66_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime-dev_5.1.3.50103-66_amd64.deb"
	egz "${srcdir}/rocrand-dev_2.10.9.50103-66_amd64.deb"
	egz "${srcdir}/rocsolver-dev_3.17.0.50103-66_amd64.deb"
	egz "${srcdir}/rocsparse-dev_2.1.0.50103-66_amd64.deb"
	egz "${srcdir}/rocthrust-dev_2.10.9.50103-66_amd64.deb"
	egz "${srcdir}/rocm-hip-sdk_5.1.3.50103-66_amd64.deb"
	# egz "${srcdir}/miopentensile_1.0.0.50103-66_amd64.deb"
	# egz "${srcdir}/miopentensile-dev_1.0.0.50103-66_amd64.deb"	
	egz "${srcdir}/rocm-opencl-sdk_5.1.3.50103-66_amd64.deb"
	egz "${srcdir}/rocm-ml-libraries_5.1.3.50103-66_amd64.deb"	
	
	mv "${srcdir}/opt/" "${pkgdir}/"
	mkdir -p "${pkgdir}/opt/rocm-5.1.3/hsa"
	ln -s "/opt/rocm-5.1.3/include/hsa" "$pkgdir/opt/rocm-5.1.3/hsa/include"
}
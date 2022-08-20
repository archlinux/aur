# Release notes https://docs.amd.com/bundle/ROCm-Release-Notes-v5.2.3/page/ROCm_v5.2.3_Release_Notes.html
amdgpu_install='22.20.3.50203'
amdgpu_version='22.20.3'
rocm_version='50203'
amdgpu_build_id='1462318~22.04'
rocm_build_id='109'
amdgpu_repo='https://repo.radeon.com/amdgpu/22.20.3/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/5.2.3'
opencl_lib='opt/rocm-5.2.3/opencl/lib'
rocm_lib='opt/rocm-5.2.3/lib'
hip_lib='opt/rocm-5.2.3/hip/lib/'
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
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/r/rocm-llvm/rocm-llvm_14.0.0.22324.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/r/rocblas/rocblas_2.44.0.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/r/rocblas-dev/rocblas-dev_2.44.0.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/r/rocsolver/rocsolver_3.18.0.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/r/rocsolver-dev/rocsolver-dev_3.18.0.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/h/hipblas/hipblas_0.51.0.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/h/hipblas-dev/hipblas-dev_0.51.0.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/r/rocprim-dev/rocprim-dev_2.10.9.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/h/hipcub-dev/hipcub-dev_2.10.12.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/r/rocfft/rocfft_1.0.17.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/r/rocfft-dev/rocfft-dev_1.0.17.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/h/hipfft/hipfft_1.0.8.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/h/hipfft-dev/hipfft-dev_1.0.8.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/h/hipify-clang/hipify-clang_14.0.0.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/r/rocsparse/rocsparse_2.2.0.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/r/rocsparse-dev/rocsparse-dev_2.2.0.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/h/hipsparse/hipsparse_2.1.0.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/h/hipsparse-dev/hipsparse-dev_2.1.0.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/m/miopen-hip/miopen-hip_2.17.0.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/m/miopen-hip-dev/miopen-hip-dev_2.17.0.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/r/rccl/rccl_2.12.12.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/r/rccl-dev/rccl-dev_2.12.12.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/r/rocrand/rocrand_2.10.9.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/r/rocrand-dev/rocrand-dev_2.10.9.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/r/rocalution/rocalution_2.0.2.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/r/rocalution-dev/rocalution-dev_2.0.2.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/r/rocm-hip-libraries/rocm-hip-libraries_5.2.3.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/r/rocm-hip-runtime-dev/rocm-hip-runtime-dev_5.2.3.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/r/rocthrust-dev/rocthrust-dev_2.10.9.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/r/rocm-hip-sdk/rocm-hip-sdk_5.2.3.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/r/rocm-opencl-sdk/rocm-opencl-sdk_5.2.3.50203-109_amd64.deb"
# MLLIB
# "https://repo.radeon.com/rocm/apt/5.2.3/pool/main/m/miopentensile/miopentensile_1.0.0.50203-109_amd64.deb"
# "https://repo.radeon.com/rocm/apt/5.2.3/pool/main/m/miopentensile-dev/miopentensile-dev_1.0.0.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/r/rocm-ml-libraries/rocm-ml-libraries_5.2.3.50203-109_amd64.deb"
)

sha256sums=(
"8b2be05efe57aafcbd1888bd0095f9d8a0a3f1614b5ea2a9e344cd9da61deee5"
"9f21ed24eefb261f2cb9ffb2673e7a1df34a690e725f0f93aad32e912df211ed"
"3b1faac301d3866bf365250e093e039ef84c8ad8a39c7f5da4c00630e8639f39"
"27bb437aba0e10eb0a02c73b6250e32dae2ef5ab3ade1085c5698cd47405bf41"
"3c6f11b72c1b552bc71af4f19af9e5cba35800aeffdbe5423276ecf905146d21"
"44d023eb4b2e7856da1afbfeaebee81a44bfc9461981dd3907f818a2f7e6efa2"
"66373fcb8d2704cead04ef0b72db1b02d83eae8c7037159ada7c76cc84173343"
"826e2b441f40c050ea54308028b2f052dc3a26f83fd40cd15353ab76e1185c5a"
"72d83ea08cccb31fb802d4e9ac5c859ff3f57e3bddede2b1514e914c16ddf03c"
"750b9ce658ff8e0b6e9e7f5ee88d8c7bcc957b6827139e29a7d49fb31353db93"
"b5e01f5a6e721da5f938874743f2629bbe9cc68baf7300b5e6756d88727938f6"
"b0977360ba20ceefa5b137579d1b8ee2e92e46add1ee28c753badf57eb0a2f0b"
"ffe66fb27f689a148a6baf78b77d7cef70e85b78e0b675540c5cff081802c319"
"33ea569f6fd3310c1ea01c5b6d7827090eae3f36c294d8e9c248650cd264e4d9"
"896c047b139d0a1f35c0c4e743e7df0b068d7e5b9d6064b3554c939c19615ffc"
"18515a1bfdab307b9d3d80c82dd21430a2a167339691b4bea48f3b81aa65b8ed"
"edf198919c4c84abcf88fbc28d10214fa0372ca47ffc7f998b07a76128833a79"
"78730eaad95532edcd75389292992719cc4268155d6182da2c48afa1e886d2ca"
"47d001c975a1585c58532bcda57030da9a2f0381069afba2be320e207e9b37e2"
"fa935d5add46eb18fb515ae6c8f04b9f6d376b1d9a258b6205f92806924ad2a1"
"4f319f9cb0c3fd3e8d317fa98e5065478eed6ff324383f2d30ba1a6a5f8f1b5b"
"22c305a55882a21f168437155775d2684d177b808913f07f80f1c71bdff406f9"
"15dad823ec0f1c6f2a420ec2ad7ccf4c9e86300511320ada684c104afe24a75a"
"08af2656709dfdd9173ef26a2043b709802e6702712455f1d4ece94a7328e066"
"7565ae59f4b7651f2731d57af4b9a0e8253d29d5f075ac288f26e851ee91664a"
"43b5001d1f6744321ce72efbf3b8c400e013f60419ea7b48d1f8beaf1fb5e5a1"
"2871e9275570bf6ae68298c9315d3ebebab589c35d9e4500fca73465a54730e1"
"c496b670e6e8690d9ccd490c8b92aa2806e9f4665c06daf74edf804060237f29"
"721c74a302e6df268c2a8e10d60e43faf5fc8ee51a6a9e6ecb002343cb89c446"
"580d152a8bab21e8706a4bee0a8f356d08f97466f1dc89d6c8982b1b431904f1"
"3a4732dc1b07e1268c5d33558d148934d301f8575898c577d2e63064dbcdbbe7"
# MLLIB
# "3ed0ef781041d4a25480dd76bab02b7ac05f5d437e823da463d5817dcea366ea"
# "93bc701c6bf31357e0bfaf51f855a319839d494719d335bc826fc91273bffb93"
"823a1b1259247eb0f4fc8ebc0d073da67c59bc734a55debc56378b3f51c7b315"
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
	exz "${srcdir}/rocm-llvm_14.0.0.22324.50203-109_amd64.deb"
	egz "${srcdir}/rocblas_2.44.0.50203-109_amd64.deb"
	egz "${srcdir}/rocblas-dev_2.44.0.50203-109_amd64.deb"		
	egz "${srcdir}/hipblas_0.51.0.50203-109_amd64.deb"
	egz "${srcdir}/hipblas-dev_0.51.0.50203-109_amd64.deb"
	egz "${srcdir}/rocprim-dev_2.10.9.50203-109_amd64.deb"
	egz "${srcdir}/hipcub-dev_2.10.12.50203-109_amd64.deb"
	egz "${srcdir}/rocfft_1.0.17.50203-109_amd64.deb"
	egz "${srcdir}/rocfft-dev_1.0.17.50203-109_amd64.deb"
	egz "${srcdir}/hipfft_1.0.8.50203-109_amd64.deb"
	egz "${srcdir}/hipfft-dev_1.0.8.50203-109_amd64.deb"
	egz "${srcdir}/hipify-clang_14.0.0.50203-109_amd64.deb"
	egz "${srcdir}/rocsparse_2.2.0.50203-109_amd64.deb"
	egz "${srcdir}/rocsparse-dev_2.2.0.50203-109_amd64.deb"
	egz "${srcdir}/hipsparse_2.1.0.50203-109_amd64.deb"
	egz "${srcdir}/hipsparse-dev_2.1.0.50203-109_amd64.deb"
	egz "${srcdir}/miopen-hip_2.17.0.50203-109_amd64.deb"
	egz "${srcdir}/miopen-hip-dev_2.17.0.50203-109_amd64.deb"
	egz "${srcdir}/rccl_2.12.12.50203-109_amd64.deb"
	egz "${srcdir}/rccl-dev_2.12.12.50203-109_amd64.deb"
	egz "${srcdir}/rocrand_2.10.9.50203-109_amd64.deb"
	egz "${srcdir}/rocrand-dev_2.10.9.50203-109_amd64.deb"
	egz "${srcdir}/rocalution_2.0.2.50203-109_amd64.deb"
	egz "${srcdir}/rocalution-dev_2.0.2.50203-109_amd64.deb"	
	egz "${srcdir}/rocm-hip-libraries_5.2.3.50203-109_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime-dev_5.2.3.50203-109_amd64.deb"	
	egz "${srcdir}/rocsolver_3.18.0.50203-109_amd64.deb"
	egz "${srcdir}/rocsolver-dev_3.18.0.50203-109_amd64.deb"	
	egz "${srcdir}/rocthrust-dev_2.10.9.50203-109_amd64.deb"
	egz "${srcdir}/rocm-hip-sdk_5.2.3.50203-109_amd64.deb"
	# egz "${srcdir}/miopentensile_1.0.0.50203-109_amd64.deb"
	# egz "${srcdir}/miopentensile-dev_1.0.0.50203-109_amd64.deb"	
	egz "${srcdir}/rocm-opencl-sdk_5.2.3.50203-109_amd64.deb"
	egz "${srcdir}/rocm-ml-libraries_5.2.3.50203-109_amd64.deb"	
	
	mv "${srcdir}/opt/" "${pkgdir}/"
	mkdir -p "${pkgdir}/opt/rocm-5.2.3/hsa"
	ln -s "/opt/rocm-5.2.3//include/hsa" "$pkgdir/opt/rocm-5.2.3/hsa/include"
}
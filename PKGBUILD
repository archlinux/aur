# Release notes https://rocm.docs.amd.com/en/latest/about/CHANGELOG.html#rocm-6-1-3
amdgpu_repo='https://repo.radeon.com/amdgpu/6.1.3/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/6.1.3'
opencl_lib='opt/rocm-6.1.3/opencl/lib'
rocm_lib='opt/rocm-6.1.3/lib'
hip_lib='opt/rocm-6.1.3/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd-dev
pkgdesc="OpenCL SDK / HIP SDK / ROCM Compiler. This package needs at least 20GB of disk space."
pkgver=6.1.3
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
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/c/composablekernel-dev/composablekernel-dev_1.1.0.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/h/half/half_1.12.0.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/h/hiprand/hiprand_2.10.16.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/h/hiprand-dev/hiprand-dev_2.10.16.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/h/hipcub-dev/hipcub-dev_3.1.0.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/h/hipblas/hipblas_2.1.0.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/h/hipblas-dev/hipblas-dev_2.1.0.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/h/hipblaslt/hipblaslt_0.7.0.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/h/hipblaslt-dev/hipblaslt-dev_0.7.0.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/h/hipfft/hipfft_1.0.14.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/h/hipfft-dev/hipfft-dev_1.0.14.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/h/hipfort-dev/hipfort-dev_0.4.0.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/h/hipsolver/hipsolver_2.1.1.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/h/hipsolver-dev/hipsolver-dev_2.1.1.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/h/hipify-clang/hipify-clang_17.0.0.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/h/hipsparse/hipsparse_3.0.1.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/h/hipsparse-dev/hipsparse-dev_3.0.1.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/h/hipsparselt/hipsparselt_0.2.0.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/h/hipsparselt-dev/hipsparselt-dev_0.2.0.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/h/hiptensor/hiptensor_1.2.0.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/h/hiptensor-dev/hiptensor-dev_1.2.0.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/o/openmp-extras-dev/openmp-extras-dev_17.60.0.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocm-llvm/rocm-llvm_17.0.0.24193.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocblas/rocblas_4.1.2.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocblas-dev/rocblas-dev_4.1.2.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocsolver/rocsolver_3.25.0.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocsolver-dev/rocsolver-dev_3.25.0.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocprim-dev/rocprim-dev_3.1.0.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocfft/rocfft_1.0.27.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocfft-dev/rocfft-dev_1.0.27.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocsparse/rocsparse_3.1.2.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocsparse-dev/rocsparse-dev_3.1.2.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rccl/rccl_2.18.6.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rccl-dev/rccl-dev_2.18.6.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocrand/rocrand_3.0.1.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocrand-dev/rocrand-dev_3.0.1.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocalution/rocalution_3.1.1.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocalution-dev/rocalution-dev_3.1.1.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocm-hip-libraries/rocm-hip-libraries_6.1.3.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocm-hip-runtime-dev/rocm-hip-runtime-dev_6.1.3.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocthrust-dev/rocthrust-dev_3.0.1.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocm-hip-sdk/rocm-hip-sdk_6.1.3.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocm-opencl-sdk/rocm-opencl-sdk_6.1.3.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocwmma-dev/rocwmma-dev_1.4.0.60103-122~22.04_amd64.deb"
# ML
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/m/miopen-hip/miopen-hip_3.1.0.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/m/miopen-hip-dev/miopen-hip-dev_3.1.0.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocm-ml-libraries/rocm-ml-libraries_6.1.3.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocm-ml-sdk/rocm-ml-sdk_6.1.3.60103-122~22.04_amd64.deb"
)

sha256sums=(
"bfc1ebc96aa3fe6e7edc16b7c0e71767d571bbd5a9d5670f0c3f8a08635d774d"
"3364d45f251370dfe6a1805ba7933bfafa504bab70115be0e011a34691bbddc7"
"676184cc8a0bf0ae572580ccf7fe9b9bacacdf5d768bc9a7456c139b2a555363"
"304503f0a2c53d37a8ae4dd2041820c291deb16fdd59ddf73a3a8e2004d194c6"
"099d8f5d335b18e00141712443a82536d9dc26bc202120d201b84d616d43c719"
"51cb2cd17803348d3d0f2738deb16b8433121fb21b983af909b4d048c42037e6"
"3d0b9fe6798f1558008efc879d7fc6c60dbb1bcb7f64d174ad8522e0c4ec8db2"
"c07bd575502e7d09d0df58e232bd995956053fd410819f1919a04462f0295782"
"510b0a7d7cc5bae9acb3385d60d05e4b24a76a22af336bb6beaea35f256ba218"
"3dbd1002ac5c3010343fb8656a2b5295cb372dad217916edd6b0857bf5cccb1a"
"9d1ec61c72ac17c2b3196f84be2ff922c3a49a92194d61b7c3378b0c1c93f07e"
"ad984fbb48b9f751602dbb8db0b1e6bbce6b1b8f381b1f5c39bd0c6ef83356b7"
"5e29a38125176cc07b08db2676f2037a5965da743b840b42bcead1c6e3740f64"
"8ba00e3e80d3ea7c4cfc54768e047b05d53a198bef9f4e9ae264d946b63717cf"
"687d992ae88d97432810a3346a44d2e0f0cb5e19678b083eafe63aee90694b74"
"43766e8ea80b46897c2f4b80ed702b06e486e8d93dbf0cf588cd87f12c5e3ebe"
"0febe77c13f952a073821a4d8bb50eb552648dbd4afa71a2604900017f3143df"
"c64348ea502fc807df85391ea7c66d1bded62380af5dc81c844e3bca3569a707"
"b544c581dac5ec1ad7096db8c2c327072ea8b630c920322304aa3fb55181157d"
"099c3be551913b9735facdd77dfb534df879c0b446451fcd9c490097ca4077b9"
"eac388aaf9a9d69eb278fed90648379777ea25f5cb4d5000d64fac03e5905809"
"ef818bdb6e46c62f636f4d7c18013de45ab955c32e6a7a6c4c0f3fc76ffdf8c8"
"69012a8c47810ea50c3885700f3e1e03f6524bcacc11ca8b9666f7a3fa62d614"
"f90425d3fbe3f6c27b01af7e2cc8112f3145220cbe52560de871198140812057"
"b58fa90b2ba33bb5e146f2fd6a64c0e03c6d85909ae9a4ca1f6b41edc7922ce7"
"4c53ad1bca2f89d2fd24a48a442e9e386cc9ffbd1a48af09c2ffbb2afc1b1bcd"
"00a45cb9e3a54c69fecb7c88946b831e562e169d4c09d5a4cd17823f321ac31a"
"f9ee5fb46569f299351513e57964b07aad1c1ee50fe4ac8742c0b27dd2badbce"
"4630f044c24e22411070f3f09f926451d1027db8d0de824c2ae4742fb593bb3f"
"dd687ee3ef66d7dba97a13aac5a756136dcc07b51c4353d6120fce054056d3fe"
"1d181ae631e43e45f859d2fb57151f260a9c7f5382972e619d6010019e6f8ed5"
"dcc5f73694096228eaf295b413dd1a0a99aa1c61decfdf9fd5982097f5acd05c"
"2169ec7a52d72f8f47eb465b5b95e9945300792c168ea9df27c84d698bc9c7e9"
"207d681b1d99948529ade96e59f1f266956607a6bf971629c350af86e215c5a1"
"7f0f21ced67317b495db2b06732fa62f12d16b5a77b0aa90c8f56d55873dd5a0"
"c1d6b356bd34bc5726070e23fe00706aa292f5c1d68465eca0061b3c850231ed"
"736bff351e4b9e7d506a7c83b6e0708ee603dd10880606506a15cd2ecb3522ec"
"0943c0160f04ea8a1537447868d6119be8199d0c877e365202c7a80ed4e09820"
"9f31f53ec04b8da7996c2985d9fc67cfd51cd90705a2885616f9ad5474d1fb47"
"173ea129a814e41cc8b966938c5200201f55d57bd36e466245c321574035b2b0"
"0eeddd7717e630fc2ab7da5566207cb78344dabaea298ae4b08c5a854578fde6"
"2efcde2cf63930a9b399cc21f645e4422520ac2b9f4d3107f822c98bd4c45b59"
"9adfe7fa07fc85a55aba15c0b3172af98ce943cde05ed9d88eab87e7d8632c43"
"3458c0da9e139acf3e64558e92fae252fbab489791720d9792b4dae47c5a6bb5"
# ML
"1062c21d6eccc1894437d6ce6148262e2de2ea939e057ece458dd1d214adae3f"
"5158e9a50bdd284de1b6afcf9cc8017d0a88e85c03811414e3bb8babbbe8d92d"
"337c2658f5abb5c143c9e5b3e3203589f0a03b771a86f872fdde41ea07026302"
"5fa19b1990167bfd1c700b3342ea88750159a757a89a0e430ae6623f182c3a6e"
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
	exz "${srcdir}/composablekernel-dev_1.1.0.60103-122~22.04_amd64.deb"
	exz "${srcdir}/half_1.12.0.60103-122~22.04_amd64.deb"
	exz "${srcdir}/hiprand_2.10.16.60103-122~22.04_amd64.deb"
	exz "${srcdir}/hiprand-dev_2.10.16.60103-122~22.04_amd64.deb"
	exz "${srcdir}/hipblas_2.1.0.60103-122~22.04_amd64.deb"
	exz "${srcdir}/hipblas-dev_2.1.0.60103-122~22.04_amd64.deb"
	exz "${srcdir}/hipblaslt_0.7.0.60103-122~22.04_amd64.deb"
	exz "${srcdir}/hipblaslt-dev_0.7.0.60103-122~22.04_amd64.deb"
	exz "${srcdir}/hipcub-dev_3.1.0.60103-122~22.04_amd64.deb"
	exz "${srcdir}/hipfft_1.0.14.60103-122~22.04_amd64.deb"
	exz "${srcdir}/hipfft-dev_1.0.14.60103-122~22.04_amd64.deb"	
	exz "${srcdir}/hipfort-dev_0.4.0.60103-122~22.04_amd64.deb"
	exz "${srcdir}/hipsolver_2.1.1.60103-122~22.04_amd64.deb"
	exz "${srcdir}/hipsolver-dev_2.1.1.60103-122~22.04_amd64.deb"
	egz "${srcdir}/hipify-clang_17.0.0.60103-122~22.04_amd64.deb"
	exz "${srcdir}/hipsparse_3.0.1.60103-122~22.04_amd64.deb"
	exz "${srcdir}/hipsparse-dev_3.0.1.60103-122~22.04_amd64.deb"
	exz "${srcdir}/hipsparselt_0.2.0.60103-122~22.04_amd64.deb"
	exz "${srcdir}/hipsparselt-dev_0.2.0.60103-122~22.04_amd64.deb"
	exz "${srcdir}/hiptensor_1.2.0.60103-122~22.04_amd64.deb"
	exz "${srcdir}/hiptensor-dev_1.2.0.60103-122~22.04_amd64.deb"	
	exz "${srcdir}/miopen-hip_3.1.0.60103-122~22.04_amd64.deb"
	exz "${srcdir}/miopen-hip-dev_3.1.0.60103-122~22.04_amd64.deb"
	egz "${srcdir}/openmp-extras-dev_17.60.0.60103-122~22.04_amd64.deb"
	egz "${srcdir}/rocm-llvm_17.0.0.24193.60103-122~22.04_amd64.deb"	
	exz "${srcdir}/rocblas_4.1.2.60103-122~22.04_amd64.deb"
	exz "${srcdir}/rocblas-dev_4.1.2.60103-122~22.04_amd64.deb"
	exz "${srcdir}/rocprim-dev_3.1.0.60103-122~22.04_amd64.deb"
	exz "${srcdir}/rocfft_1.0.27.60103-122~22.04_amd64.deb"
	exz "${srcdir}/rocfft-dev_1.0.27.60103-122~22.04_amd64.deb"
	exz "${srcdir}/rocsparse_3.1.2.60103-122~22.04_amd64.deb"
	exz "${srcdir}/rocsparse-dev_3.1.2.60103-122~22.04_amd64.deb"
	exz "${srcdir}/rccl_2.18.6.60103-122~22.04_amd64.deb"
	exz "${srcdir}/rccl-dev_2.18.6.60103-122~22.04_amd64.deb"
	exz "${srcdir}/rocrand_3.0.1.60103-122~22.04_amd64.deb"
	exz "${srcdir}/rocrand-dev_3.0.1.60103-122~22.04_amd64.deb"
	exz "${srcdir}/rocalution_3.1.1.60103-122~22.04_amd64.deb"
	exz "${srcdir}/rocalution-dev_3.1.1.60103-122~22.04_amd64.deb"	
	egz "${srcdir}/rocm-hip-libraries_6.1.3.60103-122~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime-dev_6.1.3.60103-122~22.04_amd64.deb"
	exz "${srcdir}/rocsolver_3.25.0.60103-122~22.04_amd64.deb"
	exz "${srcdir}/rocsolver-dev_3.25.0.60103-122~22.04_amd64.deb"	
	exz "${srcdir}/rocthrust-dev_3.0.1.60103-122~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-sdk_6.1.3.60103-122~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-sdk_6.1.3.60103-122~22.04_amd64.deb"
	exz "${srcdir}/rocwmma-dev_1.4.0.60103-122~22.04_amd64.deb"	
	egz "${srcdir}/rocm-ml-libraries_6.1.3.60103-122~22.04_amd64.deb"	
	egz "${srcdir}/rocm-ml-sdk_6.1.3.60103-122~22.04_amd64.deb"
	
	mv "${srcdir}/opt/" "${pkgdir}/"
	# mkdir -p "${pkgdir}/opt/rocm-6.1.3/hsa"
	# ln -s "/opt/rocm-6.1.3/include/hsa" "$pkgdir/opt/rocm-6.1.3/hsa/include"
}
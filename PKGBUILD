# Release notes https://rocm.docs.amd.com/en/latest/about/CHANGELOG.html#rocm-6-1-0
amdgpu_repo='https://repo.radeon.com/amdgpu/6.1/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/6.0'
opencl_lib='opt/rocm-6.1.0/opencl/lib'
rocm_lib='opt/rocm-6.1.0/lib'
hip_lib='opt/rocm-6.1.0/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd-dev
pkgdesc="OpenCL SDK / HIP SDK / ROCM Compiler. This package needs at least 10GB of space."
pkgver=6.1.0
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
"https://repo.radeon.com/rocm/apt/6.1/pool/main/c/composablekernel-dev/composablekernel-dev_1.1.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/h/half/half_1.12.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/h/hiprand/hiprand_2.10.16.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/h/hiprand-dev/hiprand-dev_2.10.16.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/h/hipcub-dev/hipcub-dev_3.1.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/h/hipblas/hipblas_2.1.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/h/hipblas-dev/hipblas-dev_2.1.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/h/hipblaslt/hipblaslt_0.7.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/h/hipblaslt-dev/hipblaslt-dev_0.7.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/h/hipfft/hipfft_1.0.14.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/h/hipfft-dev/hipfft-dev_1.0.14.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/h/hipfort-dev/hipfort-dev_0.4.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/h/hipsolver/hipsolver_2.1.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/h/hipsolver-dev/hipsolver-dev_2.1.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/h/hipify-clang/hipify-clang_17.0.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/h/hipsparse/hipsparse_3.0.1.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/h/hipsparse-dev/hipsparse-dev_3.0.1.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/h/hipsparselt/hipsparselt_0.1.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/h/hipsparselt-dev/hipsparselt-dev_0.1.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/h/hiptensor/hiptensor_1.2.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/h/hiptensor-dev/hiptensor-dev_1.2.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/o/openmp-extras-dev/openmp-extras-dev_17.60.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocm-llvm/rocm-llvm_17.0.0.24103.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocblas/rocblas_4.1.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocblas-dev/rocblas-dev_4.1.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocsolver/rocsolver_3.25.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocsolver-dev/rocsolver-dev_3.25.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocprim-dev/rocprim-dev_3.1.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocfft/rocfft_1.0.27.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocfft-dev/rocfft-dev_1.0.27.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocsparse/rocsparse_3.1.2.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocsparse-dev/rocsparse-dev_3.1.2.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rccl/rccl_2.18.6.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rccl-dev/rccl-dev_2.18.6.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocrand/rocrand_3.0.1.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocrand-dev/rocrand-dev_3.0.1.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocalution/rocalution_3.1.1.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocalution-dev/rocalution-dev_3.1.1.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocm-hip-libraries/rocm-hip-libraries_6.1.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocm-hip-runtime-dev/rocm-hip-runtime-dev_6.1.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocthrust-dev/rocthrust-dev_3.0.1.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocm-hip-sdk/rocm-hip-sdk_6.1.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocm-opencl-sdk/rocm-opencl-sdk_6.1.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocwmma-dev/rocwmma-dev_1.4.0.60100-82~22.04_amd64.deb"
# ML
"https://repo.radeon.com/rocm/apt/6.1/pool/main/m/miopen-hip/miopen-hip_3.1.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/m/miopen-hip-dev/miopen-hip-dev_3.1.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocm-ml-libraries/rocm-ml-libraries_6.1.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocm-ml-sdk/rocm-ml-sdk_6.1.0.60100-82~22.04_amd64.deb"
)

sha256sums=(
"d9af25245e9a43fdb16d7df0059802471e78268385adb9790a7d2b995f154516"
"b1bd1a4bd660ee99a572a216556289ce2d0a4dc1aebc3c7c0419ee1cb21f4791"
"71bedae5c7c699aa34491faaeb41a6e725b6d823b0d56e89a6d6eb60017115ef"
"bc16e678ab129437427c200f2c1b582a3c0dac51b36a1ed5c3e270709e059c1f"
"6f6caee6c4e8238c15611089742befd2f35169aba36c64616e370550acb88d28"
"b9f6b03da9df352131548669a67363d793002d240b5cae6d9626178c5013258d"
"80cecc90625c030204ccdd500c8e6c9545fe105087fb7a9313c74d85e6483be5"
"a52b2ad508e5c74dc37c4ad9e42f7db9aa68007b724265456250ebea0f2070b2"
"9b1540ad9c2b39f903778d3852ad822d4206e6d6c562a73afb26bca865242408"
"9b8f47237efdf836632f16efcbd64a822de3ebf98421aeed642e05eed8bb82a3"
"2b6c2f77d940e76cafbf4fb908a577beb04bcc596a5a8d7a63cb9443de794505"
"e89e875aa56d8faf4fcbcb6efd067be298a226c082a91c4fb2d2dd25f953aabd"
"575322a3cb54ccf70120fedf5ac5375b8150b2944e419cfe5e1aae3d444b61fe"
"711af6ad6a37e56b4fce4198bb73e41203a6c3a388e97ee483534f6480d572db"
"d97a9f6200fba52cbc78dc511cb8151b6000df91d404ee07d698abc2e73e0dfb"
"0492166bfc744a1d25ecdce11562035cb9314046a4fe83536c01a9b175b47cf1"
"a78c3eee66b9ae8d7316a73e6201f08f874741d6562057ba09a777d99855eb99"
"5cf7ed2684e226809313d47da178f823beb4663b7a55d36ae931c8c4e83e01d6"
"b93e7a3927fd45954f2c300ebdda7a2a15628a22b22bfae040e81bd1b6f25219"
"d64ba24c8fd0d16d2239c832196debdeee71c2a74cd0a668d1e199f54d97e926"
"ad1037b2badc63b3f827c1bf52f2cc3be80780c696bbd6485615e70422af4d30"
"4fd7a6f776675888aff02080cc32074d74c37f50b77da8d867b69bb1b085200b"
"4c245a83e48517d627f34f52c0e7020434dcf4ef4ef073c736afc60e69f8b6f2"
"59b1bd3295bf4bd5579907282c5d9ffffad1ba90c95979fd4be11ace4cea26aa"
"fc8bef370666fad72c01fc131749ccb835b8bfcb1639ed43dda26b9e64702b3b"
"ab2792b32e3b300d91bf5ea68aee3652fa826a26c7258d3c2b9cb1f5700088e8"
"4380cfb8ae511524658f9248138a3095627cb43ff5c0ad53f06f4fa39b12c777"
"521ef1a7bce6921cbb43dd2db5249f2613b85c12f58b7b148256884c74d893ae"
"a5fc4a8d68d0d123830ecbe591b4a2d9d74f75e232b330fe7ea58537a2548bdf"
"1ce704cbe13bea8fccaacdede4b6b2d1558c7bdf54e46a10bcbcad875bada0f1"
"d5c8b52d228a9ee429bbe9229136f01e17371c19e74a155b3038e3528ddd3517"
"26d325ce5024366e37fc1f00520579203ae3e41b76da444e4bf7051c91b95bd7"
"db347f7eaaa7110ff882b2391ce4329a643250f33c3b6a995756559da4cac9a0"
"6ae0e387779ba8c57df7de82b7c173377925585e34bcd8048a9391de01809d28"
"ccb0d40e2d06692741ed05862cc63c2bcbe2c29b19a29f00b45bbce22aa6052f"
"4d06060d2bf95b682aa294517dc2a4c638388de53c10cf5a14b3166a15e2d7a2"
"9b264fec473a183e8faa9120ce84a91ca8d5f484af416337e1e204ab6e70a865"
"f1554506a869f3a89f90d1de14c6ba108859756c468faf6161f3c19cc952fba8"
"57c4212475dd5a8fe2bdab92eeff71332a0d408615dc2a4254482eb46d13e212"
"bc439f502390f2cb5035ce3e4471d2bcbfbd3e85cbb130c27ce39cfb5c570c9b"
"626a39d387f9c5fe9b06224cfee152242afdbb9cb925dcb2d0cf18cad26cebf0"
"fa56c41bb44ffb7ecdb9aa9469a2569ab480b2f790f6c21c09bbf9be43fadffd"
"166a86e8400bbed140806c0479fe0161401e74aa37642165fd4876c3a9cf2671"
"0607b500784ff752d05b1fc9c88f0da2cf0eff7b512ffa3b4240e35652929190"
# ML
"d7b8ef5315db997be810241aa2bad6b22f585bc44c2ace3b09964d1f5ce7d662"
"1de40ffe90db712d9d22b3ff57b0139dd64961b948f94f820c0221ecaae326e9"
"122a126982edab5c47e8bf8bdb8b68ac235fd31446f5406b4323bc8c046f32b4"
"d7aaceb3028507980fda480ea707471a78243d1f93fe93be65f2d7e10ef6f97f"
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
	exz "${srcdir}/composablekernel-dev_1.1.0.60100-82~22.04_amd64.deb"
	exz "${srcdir}/half_1.12.0.60100-82~22.04_amd64.deb"
	exz "${srcdir}/hiprand_2.10.16.60100-82~22.04_amd64.deb"
	exz "${srcdir}/hiprand-dev_2.10.16.60100-82~22.04_amd64.deb"
	exz "${srcdir}/hipblas_2.1.0.60100-82~22.04_amd64.deb"
	exz "${srcdir}/hipblas-dev_2.1.0.60100-82~22.04_amd64.deb"
	exz "${srcdir}/hipblaslt_0.7.0.60100-82~22.04_amd64.deb"
	exz "${srcdir}/hipblaslt-dev_0.7.0.60100-82~22.04_amd64.deb"
	exz "${srcdir}/hipcub-dev_3.1.0.60100-82~22.04_amd64.deb"
	exz "${srcdir}/hipfft_1.0.14.60100-82~22.04_amd64.deb"
	exz "${srcdir}/hipfft-dev_1.0.14.60100-82~22.04_amd64.deb"	
	exz "${srcdir}/hipfort-dev_0.4.0.60100-82~22.04_amd64.deb"
	exz "${srcdir}/hipsolver_2.1.0.60100-82~22.04_amd64.deb"
	exz "${srcdir}/hipsolver-dev_2.1.0.60100-82~22.04_amd64.deb"
	egz "${srcdir}/hipify-clang_17.0.0.60100-82~22.04_amd64.deb"
	exz "${srcdir}/hipsparse_3.0.1.60100-82~22.04_amd64.deb"
	exz "${srcdir}/hipsparse-dev_3.0.1.60100-82~22.04_amd64.deb"
	exz "${srcdir}/hipsparselt_0.1.0.60100-82~22.04_amd64.deb"
	exz "${srcdir}/hipsparselt-dev_0.1.0.60100-82~22.04_amd64.deb"
	exz "${srcdir}/hiptensor_1.2.0.60100-82~22.04_amd64.deb"
	exz "${srcdir}/hiptensor-dev_1.2.0.60100-82~22.04_amd64.deb"	
	exz "${srcdir}/miopen-hip_3.1.0.60100-82~22.04_amd64.deb"
	exz "${srcdir}/miopen-hip-dev_3.1.0.60100-82~22.04_amd64.deb"
	egz "${srcdir}/openmp-extras-dev_17.60.0.60100-82~22.04_amd64.deb"
	egz "${srcdir}/rocm-llvm_17.0.0.24103.60100-82~22.04_amd64.deb"	
	exz "${srcdir}/rocblas_4.1.0.60100-82~22.04_amd64.deb"
	exz "${srcdir}/rocblas-dev_4.1.0.60100-82~22.04_amd64.deb"
	exz "${srcdir}/rocprim-dev_3.1.0.60100-82~22.04_amd64.deb"
	exz "${srcdir}/rocfft_1.0.27.60100-82~22.04_amd64.deb"
	exz "${srcdir}/rocfft-dev_1.0.27.60100-82~22.04_amd64.deb"
	exz "${srcdir}/rocsparse_3.1.2.60100-82~22.04_amd64.deb"
	exz "${srcdir}/rocsparse-dev_3.1.2.60100-82~22.04_amd64.deb"
	exz "${srcdir}/rccl_2.18.6.60100-82~22.04_amd64.deb"
	exz "${srcdir}/rccl-dev_2.18.6.60100-82~22.04_amd64.deb"
	exz "${srcdir}/rocrand_3.0.1.60100-82~22.04_amd64.deb"
	exz "${srcdir}/rocrand-dev_3.0.1.60100-82~22.04_amd64.deb"
	exz "${srcdir}/rocalution_3.1.1.60100-82~22.04_amd64.deb"
	exz "${srcdir}/rocalution-dev_3.1.1.60100-82~22.04_amd64.deb"	
	egz "${srcdir}/rocm-hip-libraries_6.1.0.60100-82~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime-dev_6.1.0.60100-82~22.04_amd64.deb"
	exz "${srcdir}/rocsolver_3.25.0.60100-82~22.04_amd64.deb"
	exz "${srcdir}/rocsolver-dev_3.25.0.60100-82~22.04_amd64.deb"	
	exz "${srcdir}/rocthrust-dev_3.0.1.60100-82~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-sdk_6.1.0.60100-82~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-sdk_6.1.0.60100-82~22.04_amd64.deb"
	exz "${srcdir}/rocwmma-dev_1.4.0.60100-82~22.04_amd64.deb"	
	egz "${srcdir}/rocm-ml-libraries_6.1.0.60100-82~22.04_amd64.deb"	
	egz "${srcdir}/rocm-ml-sdk_6.1.0.60100-82~22.04_amd64.deb"
	
	mv "${srcdir}/opt/" "${pkgdir}/"
	# mkdir -p "${pkgdir}/opt/rocm-6.1.0/hsa"
	# ln -s "/opt/rocm-6.1.0/include/hsa" "$pkgdir/opt/rocm-6.1.0/hsa/include"
}
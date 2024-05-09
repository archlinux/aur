# Release notes https://rocm.docs.amd.com/en/latest/about/CHANGELOG.html#rocm-6-1-1
amdgpu_repo='https://repo.radeon.com/amdgpu/6.1.1/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/6.1.1'
opencl_lib='opt/rocm-6.1.1/opencl/lib'
rocm_lib='opt/rocm-6.1.1/lib'
hip_lib='opt/rocm-6.1.1/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd-dev
pkgdesc="OpenCL SDK / HIP SDK / ROCM Compiler. This package needs at least 20GB of disk space."
pkgver=6.1.1
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
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/c/composablekernel-dev/composablekernel-dev_1.1.0.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/h/half/half_1.12.0.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/h/hiprand/hiprand_2.10.16.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/h/hiprand-dev/hiprand-dev_2.10.16.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/h/hipcub-dev/hipcub-dev_3.1.0.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/h/hipblas/hipblas_2.1.0.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/h/hipblas-dev/hipblas-dev_2.1.0.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/h/hipblaslt/hipblaslt_0.7.0.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/h/hipblaslt-dev/hipblaslt-dev_0.7.0.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/h/hipfft/hipfft_1.0.14.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/h/hipfft-dev/hipfft-dev_1.0.14.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/h/hipfort-dev/hipfort-dev_0.4.0.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/h/hipsolver/hipsolver_2.1.1.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/h/hipsolver-dev/hipsolver-dev_2.1.1.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/h/hipify-clang/hipify-clang_17.0.0.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/h/hipsparse/hipsparse_3.0.1.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/h/hipsparse-dev/hipsparse-dev_3.0.1.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/h/hipsparselt/hipsparselt_0.1.0.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/h/hipsparselt-dev/hipsparselt-dev_0.1.0.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/h/hiptensor/hiptensor_1.2.0.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/h/hiptensor-dev/hiptensor-dev_1.2.0.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/o/openmp-extras-dev/openmp-extras-dev_17.60.0.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocm-llvm/rocm-llvm_17.0.0.24154.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocblas/rocblas_4.1.0.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocblas-dev/rocblas-dev_4.1.0.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocsolver/rocsolver_3.25.0.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocsolver-dev/rocsolver-dev_3.25.0.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocprim-dev/rocprim-dev_3.1.0.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocfft/rocfft_1.0.27.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocfft-dev/rocfft-dev_1.0.27.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocsparse/rocsparse_3.1.2.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocsparse-dev/rocsparse-dev_3.1.2.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rccl/rccl_2.18.6.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rccl-dev/rccl-dev_2.18.6.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocrand/rocrand_3.0.1.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocrand-dev/rocrand-dev_3.0.1.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocalution/rocalution_3.1.1.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocalution-dev/rocalution-dev_3.1.1.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocm-hip-libraries/rocm-hip-libraries_6.1.1.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocm-hip-runtime-dev/rocm-hip-runtime-dev_6.1.1.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocthrust-dev/rocthrust-dev_3.0.1.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocm-hip-sdk/rocm-hip-sdk_6.1.1.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocm-opencl-sdk/rocm-opencl-sdk_6.1.1.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocwmma-dev/rocwmma-dev_1.4.0.60101-90~22.04_amd64.deb"
# ML
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/m/miopen-hip/miopen-hip_3.1.0.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/m/miopen-hip-dev/miopen-hip-dev_3.1.0.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocm-ml-libraries/rocm-ml-libraries_6.1.1.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocm-ml-sdk/rocm-ml-sdk_6.1.1.60101-90~22.04_amd64.deb"
)

sha256sums=(
"933104b1af55fde1adebfdb456838aa7f5d2f4c4b787431f254f4e6dd8510133"
"5d69b6f910e8c794254e69577aee21eceafd9dce2cc81ab476a66dbaa0e37636"
"817a242d92c38ccc0b3d5e5fe5a60e596807eeb39bffaa4e64ec94c0c056da39"
"397cad00fd50272c5559657774dd442b2277afc89909961641456ddc7dc5f507"
"1137fa669b28d5dfd841152d980523862557d8a70072cca422206f70a75a48cf"
"e21e83e8822eb837ae7a452c6071be5d8d4d002f46c79ec708faf3de8ae5b7d5"
"f2fa2454e134e98b896d0e3a34f1a299be896074f29f8bac10817bc89a1aa3c9"
"d853973bb37abfcbf2505fd71aad832c8cc08a49e47446d0b92b7217cdb632d0"
"7a3c8f57928796690a256125e252a8ccf9390aa5dc0df466b8e97dc3187b9799"
"1bbb0441f16d0f3c7f8d7ed316ff4c10e70e5e001ec4af236f4cad32bd57cd78"
"cfff98601d816c361705e683ac2cd18957a04d9d1a467763e048e5b50baac659"
"98edc9699c89b66ecf6623c72b270e46692a272fa5601fbd173c82e9c2f7d4f7"
"856f6cd4a8467e2168a983f8081f7c00c2f6533ec7c24e886d168f72cef29759"
"880b2758d6a050446a5f385e0c5a955b0caa5476a9f4a28f0b607e45e40365ec"
"e99f32c3ef323c4ca2192d783471616ea27fc02af1ad02989623eeac55a17702"
"de92c730c0f38b764f0682e03b7b3c5a6b8c138f7c04a18b9213013234adaea2"
"fa6ac07f2842bacdc9adc7224e2475eea47b70d95dd4b0e10ea4a5072336673d"
"b5b439092f96ede0bc508ffb9681a1d3120a2212f495d44b39314c29f83adb3f"
"ed26f38518a03e4016fa65909b677d7fb97f645d70da92f34c469fba74d4d6ed"
"eeb67d3e5b5fb77d745b66032d2efd9330fadb7241f15a2910e189f267d4c4fa"
"00e375cfaa21e5695c67e48a34b5035a87cb1521c9b480263b5306be766545fb"
"2bd1476e3e9ee488b300d9237c1fc7dbf992e8bf8c71ef21b72650ad63f21e93"
"c6c4b5588f9a563d4036b2aeafeabf06c912097c531ea5b69fbb7eb01e67aabc"
"5c4b7b20ba8e660213b5d9fa03f784ccd6c546aa829d2bfe56e32eb0ed8b3be6"
"9eb93fc0729e2cd88a1e9471d7eb665e068082e7bf5d3cd11333c2c4e4ba6346"
"634be89c92a74ffe7c0099f6139061c9877e7be165c06717c816a8175b281070"
"1aab480fdf295d1de96d5261069d5e46cf30402431140e581d69c430ab904cb6"
"9f1ae82eb5115362698e3f8b3c00c53641016d94c7e60d3419b5ba95284fc333"
"cb13a1c629c75e7bba1a73ce9e5b04ae21a24fa51e2a6ee1e5ee0c6c512696dd"
"ed66096c21d65e42d387e275c6bd2f079eec08e2b6673a2f019c4989906d4a47"
"650228b84abe6ad4daaa6e076020bb86f97b4d69392c81dc7c9f56cb6cd8175f"
"93e09205fcad86bd30c755a958203aee963a58d43c69808279db52eda91f9e13"
"0399846ec85ae7a71feadd8445cb153841c1e0862dd1bbc88909c4da2e3879ae"
"52387badf5930a8b71de69d70f09cfb096840db73a9c0b0920f9bc04889b7a12"
"7ebd58e8cab12afa6897efe7a63e8faf61bffcf594bedadd82751052604f8794"
"91973c9639a36499dea4a527531fa9501e255c75c530e7387fb69542c83e7190"
"ae1624c9a1959ce69f1422b28a7735b739465f96c5ed5dc187f46f7a86c2e929"
"6eb4f6e17327c6e0046aa3f069b104138607e2d2cdc4f4e9901a1e324bf4d3fb"
"0076676049a8cbb1236deaac47592610a1430b8619044349e9f092b50bb34ca3"
"c1ddfc05240c0fbbc94c4cff9270d262bffcee941da5d6a1b2d5730e760646fb"
"7e6db6b86d20e2dbb83d74bbabf0146597430d060898b02ae90d4203c181dbcd"
"caef5800302d0c066283accec537037d53ef8d9d811da94c538d1a8a0bcf5396"
"01df970e92d05be60d69c153a8d2a611560bf9d65e7e96f76d4be932b3f6ffc5"
"e4f14ed21a987eae5c32322ee03badf224bbe92e41f2c085324064087f924ede"
# ML
"adee1a8f322b031b815d5aa057c0197fa6e79d6b147483e8fc2c3c2efce7933e"
"988e7af12d08b5aa5a881b6bad2f9e589c75e0a2cb758eec7a36c5f7ba588e0e"
"b0f587f8d3c8ceb97eb612ceab1771c2ba91ee2aa38d323e3074561ae27e3967"
"4a71f403147d5055065fd2320803f868277e86ae0e0376a42ce4e8952f44159f"
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
	exz "${srcdir}/composablekernel-dev_1.1.0.60101-90~22.04_amd64.deb"
	exz "${srcdir}/half_1.12.0.60101-90~22.04_amd64.deb"
	exz "${srcdir}/hiprand_2.10.16.60101-90~22.04_amd64.deb"
	exz "${srcdir}/hiprand-dev_2.10.16.60101-90~22.04_amd64.deb"
	exz "${srcdir}/hipblas_2.1.0.60101-90~22.04_amd64.deb"
	exz "${srcdir}/hipblas-dev_2.1.0.60101-90~22.04_amd64.deb"
	exz "${srcdir}/hipblaslt_0.7.0.60101-90~22.04_amd64.deb"
	exz "${srcdir}/hipblaslt-dev_0.7.0.60101-90~22.04_amd64.deb"
	exz "${srcdir}/hipcub-dev_3.1.0.60101-90~22.04_amd64.deb"
	exz "${srcdir}/hipfft_1.0.14.60101-90~22.04_amd64.deb"
	exz "${srcdir}/hipfft-dev_1.0.14.60101-90~22.04_amd64.deb"	
	exz "${srcdir}/hipfort-dev_0.4.0.60101-90~22.04_amd64.deb"
	exz "${srcdir}/hipsolver_2.1.1.60101-90~22.04_amd64.deb"
	exz "${srcdir}/hipsolver-dev_2.1.1.60101-90~22.04_amd64.deb"
	egz "${srcdir}/hipify-clang_17.0.0.60101-90~22.04_amd64.deb"
	exz "${srcdir}/hipsparse_3.0.1.60101-90~22.04_amd64.deb"
	exz "${srcdir}/hipsparse-dev_3.0.1.60101-90~22.04_amd64.deb"
	exz "${srcdir}/hipsparselt_0.1.0.60101-90~22.04_amd64.deb"
	exz "${srcdir}/hipsparselt-dev_0.1.0.60101-90~22.04_amd64.deb"
	exz "${srcdir}/hiptensor_1.2.0.60101-90~22.04_amd64.deb"
	exz "${srcdir}/hiptensor-dev_1.2.0.60101-90~22.04_amd64.deb"	
	exz "${srcdir}/miopen-hip_3.1.0.60101-90~22.04_amd64.deb"
	exz "${srcdir}/miopen-hip-dev_3.1.0.60101-90~22.04_amd64.deb"
	egz "${srcdir}/openmp-extras-dev_17.60.0.60101-90~22.04_amd64.deb"
	egz "${srcdir}/rocm-llvm_17.0.0.24154.60101-90~22.04_amd64.deb"	
	exz "${srcdir}/rocblas_4.1.0.60101-90~22.04_amd64.deb"
	exz "${srcdir}/rocblas-dev_4.1.0.60101-90~22.04_amd64.deb"
	exz "${srcdir}/rocprim-dev_3.1.0.60101-90~22.04_amd64.deb"
	exz "${srcdir}/rocfft_1.0.27.60101-90~22.04_amd64.deb"
	exz "${srcdir}/rocfft-dev_1.0.27.60101-90~22.04_amd64.deb"
	exz "${srcdir}/rocsparse_3.1.2.60101-90~22.04_amd64.deb"
	exz "${srcdir}/rocsparse-dev_3.1.2.60101-90~22.04_amd64.deb"
	exz "${srcdir}/rccl_2.18.6.60101-90~22.04_amd64.deb"
	exz "${srcdir}/rccl-dev_2.18.6.60101-90~22.04_amd64.deb"
	exz "${srcdir}/rocrand_3.0.1.60101-90~22.04_amd64.deb"
	exz "${srcdir}/rocrand-dev_3.0.1.60101-90~22.04_amd64.deb"
	exz "${srcdir}/rocalution_3.1.1.60101-90~22.04_amd64.deb"
	exz "${srcdir}/rocalution-dev_3.1.1.60101-90~22.04_amd64.deb"	
	egz "${srcdir}/rocm-hip-libraries_6.1.1.60101-90~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime-dev_6.1.1.60101-90~22.04_amd64.deb"
	exz "${srcdir}/rocsolver_3.25.0.60101-90~22.04_amd64.deb"
	exz "${srcdir}/rocsolver-dev_3.25.0.60101-90~22.04_amd64.deb"	
	exz "${srcdir}/rocthrust-dev_3.0.1.60101-90~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-sdk_6.1.1.60101-90~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-sdk_6.1.1.60101-90~22.04_amd64.deb"
	exz "${srcdir}/rocwmma-dev_1.4.0.60101-90~22.04_amd64.deb"	
	egz "${srcdir}/rocm-ml-libraries_6.1.1.60101-90~22.04_amd64.deb"	
	egz "${srcdir}/rocm-ml-sdk_6.1.1.60101-90~22.04_amd64.deb"
	
	mv "${srcdir}/opt/" "${pkgdir}/"
	# mkdir -p "${pkgdir}/opt/rocm-6.1.1/hsa"
	# ln -s "/opt/rocm-6.1.1/include/hsa" "$pkgdir/opt/rocm-6.1.1/hsa/include"
}
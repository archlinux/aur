# Release notes https://rocm.docs.amd.com/en/latest/about/release-notes.html
amdgpu_repo='https://repo.radeon.com/amdgpu/6.2.4/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/6.2.4'
opencl_lib='opt/rocm-6.2.4/opencl/lib'
rocm_lib='opt/rocm-6.2.4/lib'
hip_lib='opt/rocm-6.2.4/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd-dev
pkgdesc="OpenCL SDK / HIP SDK / ROCM Compiler. This package needs at least 20GB of disk space."
pkgver=6.2.4
pkgrel=1
epoch=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('opencl-amd' 'suitesparse' 'blas' 'lapack')
provides=('composablekernel-dev' 'rocm-llvm' 'rocblas' 'rocblas-dev' 'rocsolver' 'rocsolver-dev' 'half' 'hipblas' 'hipblas-dev' 'hipblaslt' 'hipblaslt-dev' 'hiprand' 'hiprand-dev' 'rocprim' 'rocprim-dev' 'hipcub' 'hipcub-dev' 'rocfft' 'rocfft-dev' 'hipfft' 'hipfft-dev'
	'hipfort' 'hipfort-dev' 'hipify-clang' 'hipsolver' 'hipsolver-dev' 'rocsparse' 'rocsparse-dev' 'hipsparse' 'hipsparse-dev' 'hipsparselt' 'hipsparselt-dev' 'hiptensor' 'hiptensor-dev' 'openmp-extras-dev' 'omniperf' 'omnitrace' 'rccl' 'rccl-dev' 'rocrand' 'rocrand-dev' 'rocalution' 'rocalution-dev'
	'rocm-hip-libraries' 'rocm-hip-runtime-dev' 'rocthrust' 'rocthrust-dev' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma-dev' 'rocprofiler-sdk' 'rocprofiler-sdk-roctx' 'rocm-developer-tools' 'migraphx' 'migraphx-dev' 'miopen' 'miopen-hip' 'miopen-hip-dev' 'mivisionx' 'mivisionx-dev' 'rocm-ml-libraries' 'rocm-ml-sdk' 'rpp' 'rpp-dev')
conflicts=('composablekernel-dev' 'rocm-llvm' 'rocblas' 'rocblas-dev' 'rocsolver' 'rocsolver-dev' 'hipblas' 'hipblas-dev' 'hipblaslt' 'hipblaslt-dev' 'hiprand' 'hiprand-dev' 'rocprim' 'rocprim-dev' 'hipcub' 'hipcub-dev' 'rocfft' 'rocfft-dev' 'hipfft' 'hipfft-dev'
	'hipfort' 'hipfort-dev' 'hipify-clang' 'hipsolver' 'hipsolver-dev' 'rocsparse' 'rocsparse-dev' 'hipsparse' 'hipsparse-dev' 'hipsparselt' 'hipsparselt-dev' 'hiptensor' 'hiptensor-dev' 'openmp-extras-dev' 'omniperf' 'omnitrace' 'rccl' 'rccl-dev' 'rocrand' 'rocrand-dev' 'rocalution' 'rocalution-dev'
	'rocm-hip-libraries' 'rocm-hip-runtime-dev' 'rocthrust' 'rocthrust-dev' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma-dev' 'rocprofiler-sdk' 'rocprofiler-sdk-roctx' 'rocm-developer-tools' 'migraphx' 'migraphx-dev' 'miopen' 'miopen-hip' 'miopen-hip-dev' 'mivisionx' 'mivisionx-dev' 'rocm-ml-libraries' 'rocm-ml-sdk' 'rpp' 'rpp-dev')

source=(
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/c/composablekernel-dev/composablekernel-dev_1.1.0.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/h/half/half_1.12.0.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/h/hiprand/hiprand_2.11.1.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/h/hiprand-dev/hiprand-dev_2.11.1.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/h/hipcub-dev/hipcub-dev_3.2.1.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/h/hipblas/hipblas_2.2.0.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/h/hipblas-dev/hipblas-dev_2.2.0.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/h/hipblaslt/hipblaslt_0.8.0.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/h/hipblaslt-dev/hipblaslt-dev_0.8.0.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/h/hipfft/hipfft_1.0.16.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/h/hipfft-dev/hipfft-dev_1.0.16.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/h/hipfort-dev/hipfort-dev_0.4.0.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/h/hipsolver/hipsolver_2.2.0.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/h/hipsolver-dev/hipsolver-dev_2.2.0.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/h/hipify-clang/hipify-clang_18.0.0.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/h/hipsparse/hipsparse_3.1.1.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/h/hipsparse-dev/hipsparse-dev_3.1.1.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/h/hipsparselt/hipsparselt_0.2.1.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/h/hipsparselt-dev/hipsparselt-dev_0.2.1.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/h/hiptensor/hiptensor_1.3.0.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/h/hiptensor-dev/hiptensor-dev_1.3.0.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/o/openmp-extras-dev/openmp-extras-dev_18.62.0.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/o/omniperf/omniperf_2.0.1.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/o/omnitrace/omnitrace_1.11.2.60204-139~22.04_amd64.deb" # TODO FIX
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocm-llvm/rocm-llvm_18.0.0.24392.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocblas/rocblas_4.2.4.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocblas-dev/rocblas-dev_4.2.4.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocsolver/rocsolver_3.26.2.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocsolver-dev/rocsolver-dev_3.26.2.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocprim-dev/rocprim-dev_3.2.2.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocfft/rocfft_1.0.30.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocfft-dev/rocfft-dev_1.0.30.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocsparse/rocsparse_3.2.1.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocsparse-dev/rocsparse-dev_3.2.1.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rccl/rccl_2.20.5.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rccl-dev/rccl-dev_2.20.5.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocrand/rocrand_3.1.1.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocrand-dev/rocrand-dev_3.1.1.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocalution/rocalution_3.2.1.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocalution-dev/rocalution-dev_3.2.1.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocm-hip-libraries/rocm-hip-libraries_6.2.4.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocm-hip-runtime-dev/rocm-hip-runtime-dev_6.2.4.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocthrust-dev/rocthrust-dev_3.1.1.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocm-hip-sdk/rocm-hip-sdk_6.2.4.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocm-opencl-sdk/rocm-opencl-sdk_6.2.4.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocwmma-dev/rocwmma-dev_1.5.0.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocprofiler-sdk/rocprofiler-sdk_0.4.0-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocprofiler-sdk-roctx/rocprofiler-sdk-roctx_0.4.0-139~24.04_amd64.deb"
# Machine learning and computer vision
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/m/migraphx/migraphx_2.10.0.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/m/migraphx-dev/migraphx-dev_2.10.0.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/m/miopen-hip/miopen-hip_3.2.0.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/m/miopen-hip-dev/miopen-hip-dev_3.2.0.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/m/mivisionx/mivisionx_3.0.0.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/m/mivisionx-dev/mivisionx-dev_3.0.0.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocm-ml-libraries/rocm-ml-libraries_6.2.4.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocm-ml-sdk/rocm-ml-sdk_6.2.4.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rpp/rpp_1.8.0.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rpp-dev/rpp-dev_1.8.0.60204-139~24.04_amd64.deb"
)

sha256sums=(
"196ec68435bcd750c3fe6ab852606a2da336e6b37b286a93791c537df2d2e314"
"dce99f2936cf0ad4d2fc2266f3c2e4c99941c9dca75d7bfe59c6111b7e2a72ef"
"a52b63f9ad230a5751ee152c06b5edfd93103d1fe215a143b29a81b729028193"
"db2462e0dfc34b628392a4cd651f4e11b286b38e34459493efebb2d837f322c7"
"cbc808fee8067ee3d1596ad4aa127a7df3951f52ff3a78981b90ccd29dbda215"
"7ee9a7cf90b206afef575758550376e2a5ea5016a2c006264310323048ca5bf2"
"802ddbb5f33b36af30b7f032c94cf77d64b121deef0a7746c475abd63cb7da29"
"b096d4f0fa6c1cfcd9ff44891f876e33ac51bf84d4821d40bc55858e25f013e6"
"05f49875be7753d43c7bff62ce0b9dd978a55a09604f942bea1e94ec0497d01a"
"f24b0c9536fdbbf4f8742659c387ef303302c069270b57081e946d4c83372e2b"
"e6d531f4e0b69940b7420938a8bd0b9b3ed7c812d9d2fff5fe61f21f9c139e08"
"e121dd6de6f35e6248420cb6963ddf0e71a7042c87727137aed0c5b61aeac4fd"
"6117dc4b92561f7e95f90bd248532307c09a5e7187d58786fb1c7118b60db8cb"
"090960216d60c4e9dca998f6de794c0ff1d3a1353cdab4c8af10fe2d0c0e69af"
"bee67c6141de5b7f964eaf952c175a368eceb20deb9d2a937e0cfb0b81a7dd73"
"09cca81b1ff9a71999e8f9e91f010d15c062266304da33ea0560a6dedda31a9d"
"3d387927bab475e20f6a06895089f9920abd3b254eee804b2088290333978fbf"
"018d5ba48dea3368d9ff346eabc658c64e1296ed789cb9bbdfb3fe34844d1ab5"
"cc6fef4212384170fa4b8adae49b0a158a2a734d47fa3d9b734d725e17bf725e"
"d51effcddabe732a347cd942549acf4eb5833be31c40ce8ee4aea7c3cabef9fb"
"a4b68f92938eaf12c88efddf928fd2345af1d0687a0e4a549d1169f508d8a613"
"5e3a2d839b3ddf4827a1c68b6aaa20936e9d86b3cb1b821f2122658d4915b4fe"
"3d9810d603316c154fb27e86e8b93fb68869bf95fbe29c11b75d9678e5e47d9f"
"a83a22f60eaf1c99ae5cae2296b1e6e534d892ed4f02a014f3fadb955ce8466a"
"d275890c3f231e372332f5a1bd3f3d2e6d4812cb37839385d00af000080afff0"
"233d0fcbcca1080f1763b83d8450434513f6aa49d96ce121320f42f6ab6345fd"
"e661575f259d959184cd275428325ac1af46e55e445171b971fbfc093b80efe4"
"7297c7b8df3618027c4dc46ffc9dde7dee5c95b1c81dc80783b8dbd79495f308"
"313a0b24899b5b703838ec873914ce6e4a64eb03de7c31cec2be8988e1de890f"
"d76f294c390b50ae4384fe04e7839c26d060ef203c9d45c551d4d10fa2a822db"
"3888f2a58d2ed25ca1385c7568e84219648756d0a81df192ddb177c0ee396baa"
"ff33bc1719cc6ad0af76071d90771541754601b7ce94c5ce444920443114e490"
"5f266bee97d03e9a7512b4d70564469c04ef64dfba40f9474a081dadac9ae935"
"e3d2ade7864ac120112a0dcc76bbc234b9bbc9486c3562badeb136305ec1af15"
"6d5319f9c68a4c88231be5b4645d1716f528606425d60dd8412b8f1ddb4dce39"
"b29f9776bc1c0bccd20a415938c811931c29c9445ebe932ddaffa29ad2b91bdb"
"7fe48cd6f1acff783af84a92b13fcfdd35aadb16e204d6c86773dbfaa6181eca"
"a85550e1c21c1d67b965bed313b87ba1b2654d2ef9fe98bd63bf08ad9a3fb103"
"8b21b7a30ad70ff73c9fa110325a68b105c9aabf82e0a10840f128f3cf8fe867"
"1f6a2592a0ca17476c425b886e943e7730f410eed6ff8a710a04fee5fcf16900"
"a1b225ed2dce106790f4aa92d61e0fe119ccb426f1aabd07741e8c3937299380"
"c648a65b70a24778bebcfbaffbaa0f8528b9dbebcbf775b968169b006ddbc6fb"
"319e65c958d6c591f9df3215f324d89a61ef2fa15e58a22f8f8a04650de52965"
"fabbfda05b9597f82762c46de33b802cca9abcb6ba8e22ab25b0f69bdfae9f27"
"7147f485c29ba2b9acbb26ddb407fbedeb476ff25ffccc0a4bd9d2f5d20096ef"
"cf2a71f8f33c23fa8dfeda19c9ea08e750df0da3886c27878d400f96e0ec3a22"
"a0e729c8c413ec54bee6eb995e153036f38e75aeb8d65644473ae47fc4c0fee1"
"70df147204d51e6e3da2284bf9846c6cbeb2a4925a370828093e7c843a51aa01"
# Machine learning and computer vision
"3c823c4b8b251688fc0aacb61bb6d05a0edf19e0621d8cb5f083fe113251b3cc"
"c59d67635d135dd98aab78bdac1b2d4c5ae8692abdafa609ad9dae5fa540add1"
"ba6243c96f98dbe03e78ecd978e9fce1d92b04f889163ac4f917d5c603a2b54f"
"170f523ba88cf2827f90e827375d73ffbfbcb0d32679b091f7c895274b7532fa"
"37670bdc359c556b4e9addd417e707a5ea0f5c9b2219cff5963f8ad392cb4b65"
"871dba88fb95bdfe57c54fe560c4f5bdebba63eec933de221044c74d29ede621"
"0bb4ccae4c792b8e9092a05a1bcd35a0934305b4f99ac6eceb3e7198460d3e04"
"4dec530b18a7c437515707691b247dad72cf64c9c4b4476e96f0fe61f71122d7"
"28cbd9b3838eb0080914246ae3713733bf9f207306b17b2b510f7bf95f6098bd"
"88516d444671360fbc7f40bd41dea573247904275dd1b4e08406dd21896f6aa1"
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
	exz "${srcdir}/composablekernel-dev_1.1.0.60204-139~24.04_amd64.deb"
	exz "${srcdir}/half_1.12.0.60204-139~24.04_amd64.deb"
	exz "${srcdir}/hiprand_2.11.1.60204-139~24.04_amd64.deb"
	exz "${srcdir}/hiprand-dev_2.11.1.60204-139~24.04_amd64.deb"
	exz "${srcdir}/hipblas_2.2.0.60204-139~24.04_amd64.deb"
	exz "${srcdir}/hipblas-dev_2.2.0.60204-139~24.04_amd64.deb"
	exz "${srcdir}/hipblaslt_0.8.0.60204-139~24.04_amd64.deb"
	exz "${srcdir}/hipblaslt-dev_0.8.0.60204-139~24.04_amd64.deb"
	exz "${srcdir}/hipcub-dev_3.2.1.60204-139~24.04_amd64.deb"
	exz "${srcdir}/hipfft_1.0.16.60204-139~24.04_amd64.deb"
	exz "${srcdir}/hipfft-dev_1.0.16.60204-139~24.04_amd64.deb"	
	exz "${srcdir}/hipfort-dev_0.4.0.60204-139~24.04_amd64.deb"
	exz "${srcdir}/hipsolver_2.2.0.60204-139~24.04_amd64.deb"
	exz "${srcdir}/hipsolver-dev_2.2.0.60204-139~24.04_amd64.deb"
	egz "${srcdir}/hipify-clang_18.0.0.60204-139~24.04_amd64.deb"
	exz "${srcdir}/hipsparse_3.1.1.60204-139~24.04_amd64.deb"
	exz "${srcdir}/hipsparse-dev_3.1.1.60204-139~24.04_amd64.deb"
	exz "${srcdir}/hipsparselt_0.2.1.60204-139~24.04_amd64.deb"
	exz "${srcdir}/hipsparselt-dev_0.2.1.60204-139~24.04_amd64.deb"
	exz "${srcdir}/hiptensor_1.3.0.60204-139~24.04_amd64.deb"
	exz "${srcdir}/hiptensor-dev_1.3.0.60204-139~24.04_amd64.deb"		
	egz "${srcdir}/openmp-extras-dev_18.62.0.60204-139~24.04_amd64.deb"
	egz "${srcdir}/omniperf_2.0.1.60204-139~24.04_amd64.deb"
	egz "${srcdir}/omnitrace_1.11.2.60204-139~22.04_amd64.deb"
	egz "${srcdir}/rocm-llvm_18.0.0.24392.60204-139~24.04_amd64.deb"	
	exz "${srcdir}/rocblas_4.2.4.60204-139~24.04_amd64.deb"
	exz "${srcdir}/rocblas-dev_4.2.4.60204-139~24.04_amd64.deb"
	exz "${srcdir}/rocprim-dev_3.2.2.60204-139~24.04_amd64.deb"
	exz "${srcdir}/rocfft_1.0.30.60204-139~24.04_amd64.deb"
	exz "${srcdir}/rocfft-dev_1.0.30.60204-139~24.04_amd64.deb"
	exz "${srcdir}/rocsparse_3.2.1.60204-139~24.04_amd64.deb"
	exz "${srcdir}/rocsparse-dev_3.2.1.60204-139~24.04_amd64.deb"
	exz "${srcdir}/rccl_2.20.5.60204-139~24.04_amd64.deb"
	exz "${srcdir}/rccl-dev_2.20.5.60204-139~24.04_amd64.deb"
	exz "${srcdir}/rocrand_3.1.1.60204-139~24.04_amd64.deb"
	exz "${srcdir}/rocrand-dev_3.1.1.60204-139~24.04_amd64.deb"
	exz "${srcdir}/rocalution_3.2.1.60204-139~24.04_amd64.deb"
	exz "${srcdir}/rocalution-dev_3.2.1.60204-139~24.04_amd64.deb"	
	egz "${srcdir}/rocm-hip-libraries_6.2.4.60204-139~24.04_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime-dev_6.2.4.60204-139~24.04_amd64.deb"
	exz "${srcdir}/rocsolver_3.26.2.60204-139~24.04_amd64.deb"
	exz "${srcdir}/rocsolver-dev_3.26.2.60204-139~24.04_amd64.deb"	
	exz "${srcdir}/rocthrust-dev_3.1.1.60204-139~24.04_amd64.deb"
	egz "${srcdir}/rocm-hip-sdk_6.2.4.60204-139~24.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-sdk_6.2.4.60204-139~24.04_amd64.deb"
	exz "${srcdir}/rocwmma-dev_1.5.0.60204-139~24.04_amd64.deb"
	egz "${srcdir}/rocprofiler-sdk_0.4.0-139~24.04_amd64.deb"
	egz "${srcdir}/rocprofiler-sdk-roctx_0.4.0-139~24.04_amd64.deb"
	# Machine learning and computer vision
	exz "${srcdir}/migraphx_2.10.0.60204-139~24.04_amd64.deb"
	exz "${srcdir}/migraphx-dev_2.10.0.60204-139~24.04_amd64.deb"
	exz "${srcdir}/miopen-hip_3.2.0.60204-139~24.04_amd64.deb"
	exz "${srcdir}/miopen-hip-dev_3.2.0.60204-139~24.04_amd64.deb"
	egz "${srcdir}/mivisionx_3.0.0.60204-139~24.04_amd64.deb"
	egz "${srcdir}/mivisionx-dev_3.0.0.60204-139~24.04_amd64.deb"
	egz "${srcdir}/rocm-ml-libraries_6.2.4.60204-139~24.04_amd64.deb"	
	egz "${srcdir}/rocm-ml-sdk_6.2.4.60204-139~24.04_amd64.deb"
	egz "${srcdir}/rpp_1.8.0.60204-139~24.04_amd64.deb"
	egz "${srcdir}/rpp-dev_1.8.0.60204-139~24.04_amd64.deb"

	mv "${srcdir}/opt/" "${pkgdir}/"
	# mkdir -p "${pkgdir}/opt/rocm-6.2.4/hsa"
	# ln -s "/opt/rocm-6.2.4/include/hsa" "$pkgdir/opt/rocm-6.2.4/hsa/include"
}
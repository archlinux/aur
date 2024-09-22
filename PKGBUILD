# Release notes https://rocm.docs.amd.com/en/latest/about/release-notes.html
amdgpu_repo='https://repo.radeon.com/amdgpu/6.2.1/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/6.2.1'
opencl_lib='opt/rocm-6.2.1/opencl/lib'
rocm_lib='opt/rocm-6.2.1/lib'
hip_lib='opt/rocm-6.2.1/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd-dev
pkgdesc="OpenCL SDK / HIP SDK / ROCM Compiler. This package needs at least 20GB of disk space."
pkgver=6.2.1
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
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/c/composablekernel-dev/composablekernel-dev_1.1.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/h/half/half_1.12.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/h/hiprand/hiprand_2.11.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/h/hiprand-dev/hiprand-dev_2.11.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/h/hipcub-dev/hipcub-dev_3.2.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/h/hipblas/hipblas_2.2.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/h/hipblas-dev/hipblas-dev_2.2.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/h/hipblaslt/hipblaslt_0.8.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/h/hipblaslt-dev/hipblaslt-dev_0.8.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/h/hipfft/hipfft_1.0.15.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/h/hipfft-dev/hipfft-dev_1.0.15.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/h/hipfort-dev/hipfort-dev_0.4.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/h/hipsolver/hipsolver_2.2.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/h/hipsolver-dev/hipsolver-dev_2.2.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/h/hipify-clang/hipify-clang_18.0.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/h/hipsparse/hipsparse_3.1.1.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/h/hipsparse-dev/hipsparse-dev_3.1.1.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/h/hipsparselt/hipsparselt_0.2.1.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/h/hipsparselt-dev/hipsparselt-dev_0.2.1.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/h/hiptensor/hiptensor_1.3.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/h/hiptensor-dev/hiptensor-dev_1.3.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/o/openmp-extras-dev/openmp-extras-dev_18.62.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/o/omniperf/omniperf_2.0.1.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/o/omnitrace/omnitrace_1.11.2.60201-112~22.04_amd64.deb" # TODO FIX
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocm-llvm/rocm-llvm_18.0.0.24355.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocblas/rocblas_4.2.1.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocblas-dev/rocblas-dev_4.2.1.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocsolver/rocsolver_3.26.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocsolver-dev/rocsolver-dev_3.26.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocprim-dev/rocprim-dev_3.2.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocfft/rocfft_1.0.29.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocfft-dev/rocfft-dev_1.0.29.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocsparse/rocsparse_3.2.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocsparse-dev/rocsparse-dev_3.2.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rccl/rccl_2.20.5.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rccl-dev/rccl-dev_2.20.5.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocrand/rocrand_3.1.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocrand-dev/rocrand-dev_3.1.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocalution/rocalution_3.2.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocalution-dev/rocalution-dev_3.2.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocm-hip-libraries/rocm-hip-libraries_6.2.1.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocm-hip-runtime-dev/rocm-hip-runtime-dev_6.2.1.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocthrust-dev/rocthrust-dev_3.1.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocm-hip-sdk/rocm-hip-sdk_6.2.1.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocm-opencl-sdk/rocm-opencl-sdk_6.2.1.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocwmma-dev/rocwmma-dev_1.5.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocprofiler-sdk/rocprofiler-sdk_0.4.0-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocprofiler-sdk-roctx/rocprofiler-sdk-roctx_0.4.0-112~24.04_amd64.deb"
# Machine learning and computer vision
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/m/migraphx/migraphx_2.10.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/m/migraphx-dev/migraphx-dev_2.10.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/m/miopen-hip/miopen-hip_3.2.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/m/miopen-hip-dev/miopen-hip-dev_3.2.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/m/mivisionx/mivisionx_3.0.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/m/mivisionx-dev/mivisionx-dev_3.0.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocm-ml-libraries/rocm-ml-libraries_6.2.1.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocm-ml-sdk/rocm-ml-sdk_6.2.1.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rpp/rpp_1.8.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rpp-dev/rpp-dev_1.8.0.60201-112~24.04_amd64.deb"
)

sha256sums=(
"fbfbdfd060f6159aa3d11fb7bb2774738263f471296d73d7ee66734727423641"
"253d5c2f77c160f53de2ee3e8dd4effc4092e69e8ff21ba204060861526aea5c"
"307a2c3e0da8b4267a7f663bcb4817a34ceec68416d1529ff544ba80fdf77d2c"
"33f3a8996713c363df0c998eaaac880990ffc5c99c203bd1224ec239814760bb"
"f463fd6e920a566d68cb9f8958101655b1e35078ba5e216ce7071b0f45fac504"
"10375b49a4dc9c927ffd14fc17dd30a037f82998ce1e1f8ce072ad5f6161ac6b"
"b71bf8dbfb4cfa2f89736b6f932d8174222c705152f2d02eceff20c0105a462f"
"474d44c8dda7318fe26237ac9700e55eed4075d4337de0499a81853077a84fd8"
"3518fbbb5fc248a59a6f3977fa8e87328b7ebe9b42499a1b47e6e398ac1957c6"
"d991de16d6b06450658abc1bf4020377aef286461c04a7c4f3063ac7b53fec73"
"7d235c7258564aecada6d807572043d23ceb04879dc5ceb48a8d696142810218"
"5143d71aec4a421b4083cbc6c7e12074f9ea891bcebb3bc14e41e945c1e17055"
"0eed2e366c7e26034168227d891d499307c606b647a1c64f10abe91f1a363d66"
"6b97e444f13dc62e368c690dc33ae819fab3a796b1edd86132b02f07f2b1d174"
"944da10283195a3902c110b594c235d14cb5de09674c156ff0953ff3aec6c4a7"
"e39abbfe59fefe903b7f713c1a79557cad1e64a6368647b49f5eab89d8d5ec50"
"a38d2a8027fd90e2dc2114f8fb307a0a78fcc06e82ad4af5a3f55e198a74c7dc"
"40b793126b8572b9fcc7b1b680e5492639c4f76216643c5fdc23f69e3c6d754f"
"d190c51f6aa37c1d08b2473293eb35a0e0abb23091965b1265c697a54c542f6c"
"0c5f3d3e3c577cee7728e1b83567f88c70645d9444327dcdc3100042933d1844"
"7938489a43a41b7bd1be8027f63f33ede750e29e51345c9066b3bdac1fc19e38"
"22626cb5612e6e28534672d3592a2b4ea69c0594ded12b556d0fc67ac7bdeb9b"
"09f3bd252065536304814d5ec57a7e7c1f9f404ef68e0b4929ed406ceeb98c94"
"ccc92c432fd416a2e022dc704aad05220855b6472e8b3efe60f644972662c736"
"a96c65d41338b6acd5d3a6af12cd1b1356c18ff2cf903d3783d386567ac43652"
"b5e9b2d7c0ff24dd6b2d6e9b0a3d2f030659995ac6e43b4b9f7a2e9ee2a4a3c9"
"f783d8d9cbcc89ebcf8d6e04d844e863907bda48ba2d7a888231e777e2156a72"
"4eaad8a1c1622526ee73b9ef70a05408bac7fd2d27e64130e7fa06c9d1953d2a"
"7d08ecb153251159e7fe9d0f1f9acfdedd4da8f73c1ff811e960feb406133177"
"48e37ab0787de9fc8341e014856dc7fc34004867049a4ec671fd4a7e8f7e2f9d"
"eb1d6049b681d604dc896bd5559c3ec78a684004be8f0486dc306fdff8664cf8"
"71bfdf63dbbc58ce807fb8554e71d65a987115d8dbfc9929560255a664af5cd6"
"f8badb00f16fe0fcbf62965757a3070545395b1f577bf56a882dc66cdba1cc5a"
"ce50935fa52460cfbf6b314c4aeb6723bf4d3522665b32dd9beb9727023b2f3a"
"de76241e30618fe4430bfb26c2299bd74bb0c19d29bc48efe26e74ea4189bc54"
"3b3d8a3b7ce74414f51e0e1446693c59efd9b70532da65ed67668fa52d9a5465"
"acdeb74f43e0971f61c9305adce4a545e94651d24096691961811d5462ace317"
"a7d85bc13c2169f153fab81e91a39b08f1ef492f26094048215de79456f7dac3"
"f55c1905cf721b9c23907e5047799259bf61ef1adbc75e4662e38d2ff7705ba5"
"91d1bd4e6bd51b0685df5e7809013acc3a0a88b2ef3d5a42ac2c905269788b16"
"a99671d02f918b521c03c27d90699261fbb34b24b82953fbde9dd844b34b07d6"
"27531567ad68631b8690e4734d5cd23de3672461e6d49b199b02e66696f1eaa2"
"9461e464330d670902de978752415a3180e08d4d0e8e058581a40c753aa1dacc"
"807c1c4ff521910a18d5e630a7ac4ad93850980cfd1b92c72be7558710303269"
"deb041dd28717b3e055428848675c58a6d860a74702230b16b9f06f7cee271c9"
"4a19c83b5a061129051138c1c33d666001a7c137b96e10a09beff9cf76b99222"
"7f377e490682883c9e8434ef002d348017335efceac887723acced01562f2453"
"90df6b18a54f7a51707e5f8f120ba76a399f9cf34314b6cb1188fb4b312a5984"
# Machine learning and computer vision
"b6b5af17cbe5bbf4048e2b4d0dda2ccebbe462af5ce5ff2ffc6976000a1840ca"
"7d0694b492495f475c066fcaa94981b23d4fbbbfbd2a00bfa7c199babbe8df48"
"110d584f01b13c4a9bff8e8e6ef36d7a5d493cac8d8be3db72ff815093c57b78"
"fbe769f6dc0adac2aad3a051676160da84bb1653b35404fe7ceb2115ffd27681"
"012174e4a167f50b82a0ec091eeaea21d1469926994773fdac037378d13c4da3"
"8b78f702a352db55c76cb6fd064d82088ed10f5e174323fdc407247d876dff81"
"41681a8d8f6b1e18e97f1af42418485960142ed8c940ab371ed152d698ffb368"
"e81e7a82f2077043955253ca5696f907dab593e2c0b49a5218679578ca6fa9a2"
"28e79b60cf1d78d1fa7e1d548da86d2211b9e1c4ba4ba1881ab8ebe422b69467"
"7d88145f96fa38f7419b880a8d791d2f15a2cb3ec3bf6b41e8882759a01b6be5"
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
	exz "${srcdir}/composablekernel-dev_1.1.0.60201-112~24.04_amd64.deb"
	exz "${srcdir}/half_1.12.0.60201-112~24.04_amd64.deb"
	exz "${srcdir}/hiprand_2.11.0.60201-112~24.04_amd64.deb"
	exz "${srcdir}/hiprand-dev_2.11.0.60201-112~24.04_amd64.deb"
	exz "${srcdir}/hipblas_2.2.0.60201-112~24.04_amd64.deb"
	exz "${srcdir}/hipblas-dev_2.2.0.60201-112~24.04_amd64.deb"
	exz "${srcdir}/hipblaslt_0.8.0.60201-112~24.04_amd64.deb"
	exz "${srcdir}/hipblaslt-dev_0.8.0.60201-112~24.04_amd64.deb"
	exz "${srcdir}/hipcub-dev_3.2.0.60201-112~24.04_amd64.deb"
	exz "${srcdir}/hipfft_1.0.15.60201-112~24.04_amd64.deb"
	exz "${srcdir}/hipfft-dev_1.0.15.60201-112~24.04_amd64.deb"	
	exz "${srcdir}/hipfort-dev_0.4.0.60201-112~24.04_amd64.deb"
	exz "${srcdir}/hipsolver_2.2.0.60201-112~24.04_amd64.deb"
	exz "${srcdir}/hipsolver-dev_2.2.0.60201-112~24.04_amd64.deb"
	egz "${srcdir}/hipify-clang_18.0.0.60201-112~24.04_amd64.deb"
	exz "${srcdir}/hipsparse_3.1.1.60201-112~24.04_amd64.deb"
	exz "${srcdir}/hipsparse-dev_3.1.1.60201-112~24.04_amd64.deb"
	exz "${srcdir}/hipsparselt_0.2.1.60201-112~24.04_amd64.deb"
	exz "${srcdir}/hipsparselt-dev_0.2.1.60201-112~24.04_amd64.deb"
	exz "${srcdir}/hiptensor_1.3.0.60201-112~24.04_amd64.deb"
	exz "${srcdir}/hiptensor-dev_1.3.0.60201-112~24.04_amd64.deb"		
	egz "${srcdir}/openmp-extras-dev_18.62.0.60201-112~24.04_amd64.deb"
	egz "${srcdir}/omniperf_2.0.1.60201-112~24.04_amd64.deb"
	egz "${srcdir}/omnitrace_1.11.2.60201-112~22.04_amd64.deb"
	egz "${srcdir}/rocm-llvm_18.0.0.24355.60201-112~24.04_amd64.deb"	
	exz "${srcdir}/rocblas_4.2.1.60201-112~24.04_amd64.deb"
	exz "${srcdir}/rocblas-dev_4.2.1.60201-112~24.04_amd64.deb"
	exz "${srcdir}/rocprim-dev_3.2.0.60201-112~24.04_amd64.deb"
	exz "${srcdir}/rocfft_1.0.29.60201-112~24.04_amd64.deb"
	exz "${srcdir}/rocfft-dev_1.0.29.60201-112~24.04_amd64.deb"
	exz "${srcdir}/rocsparse_3.2.0.60201-112~24.04_amd64.deb"
	exz "${srcdir}/rocsparse-dev_3.2.0.60201-112~24.04_amd64.deb"
	exz "${srcdir}/rccl_2.20.5.60201-112~24.04_amd64.deb"
	exz "${srcdir}/rccl-dev_2.20.5.60201-112~24.04_amd64.deb"
	exz "${srcdir}/rocrand_3.1.0.60201-112~24.04_amd64.deb"
	exz "${srcdir}/rocrand-dev_3.1.0.60201-112~24.04_amd64.deb"
	exz "${srcdir}/rocalution_3.2.0.60201-112~24.04_amd64.deb"
	exz "${srcdir}/rocalution-dev_3.2.0.60201-112~24.04_amd64.deb"	
	egz "${srcdir}/rocm-hip-libraries_6.2.1.60201-112~24.04_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime-dev_6.2.1.60201-112~24.04_amd64.deb"
	exz "${srcdir}/rocsolver_3.26.0.60201-112~24.04_amd64.deb"
	exz "${srcdir}/rocsolver-dev_3.26.0.60201-112~24.04_amd64.deb"	
	exz "${srcdir}/rocthrust-dev_3.1.0.60201-112~24.04_amd64.deb"
	egz "${srcdir}/rocm-hip-sdk_6.2.1.60201-112~24.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-sdk_6.2.1.60201-112~24.04_amd64.deb"
	exz "${srcdir}/rocwmma-dev_1.5.0.60201-112~24.04_amd64.deb"
	egz "${srcdir}/rocprofiler-sdk_0.4.0-112~24.04_amd64.deb"
	egz "${srcdir}/rocprofiler-sdk-roctx_0.4.0-112~24.04_amd64.deb"
	# Machine learning and computer vision
	exz "${srcdir}/migraphx_2.10.0.60201-112~24.04_amd64.deb"
	exz "${srcdir}/migraphx-dev_2.10.0.60201-112~24.04_amd64.deb"
	exz "${srcdir}/miopen-hip_3.2.0.60201-112~24.04_amd64.deb"
	exz "${srcdir}/miopen-hip-dev_3.2.0.60201-112~24.04_amd64.deb"
	egz "${srcdir}/mivisionx_3.0.0.60201-112~24.04_amd64.deb"
	egz "${srcdir}/mivisionx-dev_3.0.0.60201-112~24.04_amd64.deb"
	egz "${srcdir}/rocm-ml-libraries_6.2.1.60201-112~24.04_amd64.deb"	
	egz "${srcdir}/rocm-ml-sdk_6.2.1.60201-112~24.04_amd64.deb"
	egz "${srcdir}/rpp_1.8.0.60201-112~24.04_amd64.deb"
	egz "${srcdir}/rpp-dev_1.8.0.60201-112~24.04_amd64.deb"

	mv "${srcdir}/opt/" "${pkgdir}/"
	# mkdir -p "${pkgdir}/opt/rocm-6.2.1/hsa"
	# ln -s "/opt/rocm-6.2.1/include/hsa" "$pkgdir/opt/rocm-6.2.1/hsa/include"
}
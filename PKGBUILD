# Release notes https://rocm.docs.amd.com/en/latest/CHANGELOG.html#rocm-5-6-1
amdgpu_repo='https://repo.radeon.com/amdgpu/5.6.1/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/5.6.1'
opencl_lib='opt/rocm-5.6.1/opencl/lib'
rocm_lib='opt/rocm-5.6.1/lib'
hip_lib='opt/rocm-5.6.1/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd-dev
pkgdesc="OpenCL SDK / HIP SDK / ROCM Compiler. This package needs at least 10GB of space."
pkgver=5.6.1
pkgrel=2
epoch=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('opencl-amd')
provides=('rocm-llvm' 'rocblas' 'rocblas-dev' 'rocsolver' 'rocsolver-dev' 'hipblas' 'hipblas-dev' 'hipblaslt' 'hipblaslt-dev' 'rocprim' 'rocprim-dev' 'hipcub' 'hipcub-dev' 'rocfft' 'rocfft-dev' 'hipfft' 'hipfft-dev'
	'hipfort' 'hipfort-dev' 'hipify-clang' 'hipsolver' 'hipsolver-dev' 'rocsparse' 'rocsparse-dev' 'hipsparse' 'hipsparse-dev' 'openmp-extras-dev' 'rccl' 'rccl-dev' 'rocrand' 'rocrand-dev' 'rocalution' 'rocalution-dev'
	'rocm-hip-libraries' 'rocm-hip-runtime-dev' 'rocthrust' 'rocthrust-dev' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma-dev' 'rocm-developer-tools' 'miopen' 'miopen-hip' 'miopen-hip-dev' 'rocm-ml-libraries' 'rocm-ml-sdk')
conflicts=('rocm-llvm' 'rocblas' 'rocblas-dev' 'rocsolver' 'rocsolver-dev' 'hipblas' 'hipblas-dev' 'hipblaslt' 'hipblaslt-dev' 'rocprim' 'rocprim-dev' 'hipcub' 'hipcub-dev' 'rocfft' 'rocfft-dev' 'hipfft' 'hipfft-dev'
	'hipfort' 'hipfort-dev' 'hipify-clang' 'hipsolver' 'hipsolver-dev' 'rocsparse' 'rocsparse-dev' 'hipsparse' 'hipsparse-dev' 'openmp-extras-dev' 'rccl' 'rccl-dev' 'rocrand' 'rocrand-dev' 'rocalution' 'rocalution-dev'
	'rocm-hip-libraries' 'rocm-hip-runtime-dev' 'rocthrust' 'rocthrust-dev' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma-dev' 'rocm-developer-tools' 'miopen' 'miopen-hip' 'miopen-hip-dev' 'rocm-ml-libraries' 'rocm-ml-sdk')

source=(
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/o/openmp-extras-dev/openmp-extras-dev_16.56.0.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rocm-llvm/rocm-llvm_16.0.0.23332.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rocblas/rocblas_3.0.0.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rocblas-dev/rocblas-dev_3.0.0.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rocsolver/rocsolver_3.22.0.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rocsolver-dev/rocsolver-dev_3.22.0.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/h/hipblas/hipblas_1.0.0.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/h/hipblas-dev/hipblas-dev_1.0.0.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/h/hipblaslt/hipblaslt_0.2.0.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/h/hipblaslt-dev/hipblaslt-dev_0.2.0.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rocprim-dev/rocprim-dev_2.13.0.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/h/hipcub-dev/hipcub-dev_2.13.1.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rocfft/rocfft_1.0.23.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rocfft-dev/rocfft-dev_1.0.23.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/h/hipfft/hipfft_1.0.12.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/h/hipfft-dev/hipfft-dev_1.0.12.50601-93~22.04_amd64.deb"
#"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/h/hipfort/hipfort_0.4.0.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/h/hipfort-dev/hipfort-dev_0.4.0.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/h/hipsolver/hipsolver_1.8.0.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/h/hipsolver-dev/hipsolver-dev_1.8.0.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/h/hipify-clang/hipify-clang_16.0.0.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rocsparse/rocsparse_2.5.2.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rocsparse-dev/rocsparse-dev_2.5.2.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/h/hipsparse/hipsparse_2.3.7.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/h/hipsparse-dev/hipsparse-dev_2.3.7.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rccl/rccl_2.16.5.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rccl-dev/rccl-dev_2.16.5.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rocrand/rocrand_2.10.17.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rocrand-dev/rocrand-dev_2.10.17.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rocalution/rocalution_2.1.9.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rocalution-dev/rocalution-dev_2.1.9.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rocm-hip-libraries/rocm-hip-libraries_5.6.1.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rocm-hip-runtime-dev/rocm-hip-runtime-dev_5.6.1.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rocthrust-dev/rocthrust-dev_2.18.0.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rocm-hip-sdk/rocm-hip-sdk_5.6.1.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rocm-opencl-sdk/rocm-opencl-sdk_5.6.1.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rocwmma-dev/rocwmma-dev_1.1.0.50601-93~22.04_amd64.deb"
#"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rocm-developer-tools/rocm-developer-tools_5.4.3.50601-93~22.04_amd64.deb"
# ML
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/m/miopen-hip/miopen-hip_2.20.0.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/m/miopen-hip-dev/miopen-hip-dev_2.20.0.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rocm-ml-libraries/rocm-ml-libraries_5.6.1.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rocm-ml-sdk/rocm-ml-sdk_5.6.1.50601-93~22.04_amd64.deb"
)

sha256sums=(
"beb9f30a1eb399cb5756ea93a75e538e5f0cd66befad3bab39163457e1339942"
"672ad80cae670e7765b095b31d7fbd06d9f19da0387c7bb5750639e4a1601092"
"c06c33426277f14f2396162f7396f11b28932d01a238421253e94bd72d4b254a"
"dcbec70b2c2493c7f5d6636114f810be63301872c84a0a9c73c27f89c4991125"
"6b2547ffe7319b18039ff638783346a3d8a52025cdbcc1ee80c319edb604278e"
"3a21c67170d38244acfbac3ab19c49068da2383d6a0c53a4d1c51a6ee1989800"
"11377fc49570f697acba2da4d50636832adcb6ba0e06bbbf6ead137ad92a92a2"
"167026e06e9df62379697f91e3629a9f67ed18b152b1a360f8a55f39b16246f1"
"d85b00426ba9533683c4bc4d74e255778daa66edeb6d62471b0b648baaac6ef4"
"1f50481c4d98ffc19e51092f5df1363440a204904665215a36541bcab3a61012"
"c556c03e002076b043b980ba8e6b63f86aacec739de9f2ab17d404bf8de38321"
"9ac9e5dc601ea6c41fcc2d9da2d4737d677d0f522efb55e0d995ec6816436bbd"
"ae96253638fce2e164c5a90a98d0f976465ce84534505f2379f35c5226a7a326"
"4b415768b35d3e1f09eb375b7415826824e99cd1b7ae3c41cf10aba85b6a1e2c"
"9b56d7bf14eb2094e5490941e3f464736cf28be8cc715f7f5af82b7cc44e0c76"
"1214f26c361105d312b10b2f19f062b2eaded8777971eb484cd0f009d2acd64f"
#"2c2bb011e24eaf7a4604a5496c024776e2db026bfc11e8f5c8748ad355655353"
"b6247e6c668c639d00976761f0225effdd318648453443f0d536f19fc2596fec"
"a31d133c9eb42809ecec21a4ed0210dd0cf790106d68d673fda219d84b360604"
"8efdddfb3f494f991c0b59b861bae38b84ebce07aa63e2219075b83fc63e62d0"
"820f7c6774f96440cc34fa67f139a90df88b17151164f6322e401b64285ee8fd"
"576d47661a6793ae0071062c91ea03157f87762e9d69ebdfcf64b33250295175"
"0f7babe0197b7e78f0262b486cd64dbe350180e71120b95eee855820b89be68c"
"15d5a0cc0b97b89ef255e2e58b035dfa8e6c8dd47cddc94219b827b65dc8c54f"
"86845be743425ce04f6998d064ee52893b1bd31df7904adc4ae2461738984819"
"b3f998114520f4929cfc843d1cf04bdbc5afab0f2f25f34d423eeb0e228984e6"
"d80ebed2abaf01d5ee167d304235d03e4eb6b2166ca66c42ab1f82fc7fb6f545"
"f471a1abc72e8081e7f0b34b44f774d65dad1dae63b71bf1a180289b12165320"
"be09914be296e59404a9851c6ac84e2a7187dd4154ee7a78fa090d63f3947afd"
"c27498e59d5df078ebfcc5b12154dde7c2d5e6982e017a6c719eb43869cf435c"
"38a921854f772d131fa978469275ee9f4ffbb879185dd646503f9a914accaa19"
"50f4dc96109b9fc943fd20bba4afe99a54f66295ea2666a6de67ea7c2afc67ce"
"a0cdb0fcef1d04a20a4b7a71af2d442a47920a5b90cd1af2c90175217419e493"
"c020efe5dd7f3a575d493cb59a6e3bc8a42e226c25593641145eeea8c7e25361"
"2c8b4843f82e75520a20ee86cb338319df798cbee07a519431f57e128f39531c"
"0a5726d425b9e464678cb841093c5e67faa8af94e34e65524ec5c03e0f4b00d2"
"ab848d7ecb74d25b5d237c3f5fe35c36af0a651d39cc92f6ec41e607a093646e"
# "4bba416791003fb689db8e9ebc68c15eac2951be98c4c5b9d09c40f202748d23"
# ML
"6a3411520d473ab34230c7384d697564dca41fad0921115cdd19ae08af699dcc"
"ec916209ad8ef7aeb939887a382bf48e32a0a24682910466885d20b06e08b909"
"53c9806026ee10dda71fb947f89c9b2f90cb964cde7c1142d983bae8b6f55374"
"66ad869109c7513965220451994d4cc422b9ef22db876375608f0213301f3e25"
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
	egz "${srcdir}/openmp-extras-dev_16.56.0.50601-93~22.04_amd64.deb"
	egz "${srcdir}/rocm-llvm_16.0.0.23332.50601-93~22.04_amd64.deb"
	exz "${srcdir}/rocblas_3.0.0.50601-93~22.04_amd64.deb"
	exz "${srcdir}/rocblas-dev_3.0.0.50601-93~22.04_amd64.deb"
	exz "${srcdir}/hipblas_1.0.0.50601-93~22.04_amd64.deb"
	exz "${srcdir}/hipblas-dev_1.0.0.50601-93~22.04_amd64.deb"
	exz "${srcdir}/hipblaslt_0.2.0.50601-93~22.04_amd64.deb"
	exz "${srcdir}/hipblaslt-dev_0.2.0.50601-93~22.04_amd64.deb"
	exz "${srcdir}/rocprim-dev_2.13.0.50601-93~22.04_amd64.deb"
	exz "${srcdir}/hipcub-dev_2.13.1.50601-93~22.04_amd64.deb"
	exz "${srcdir}/rocfft_1.0.23.50601-93~22.04_amd64.deb"
	exz "${srcdir}/rocfft-dev_1.0.23.50601-93~22.04_amd64.deb"
	exz "${srcdir}/hipfft_1.0.12.50601-93~22.04_amd64.deb"
	exz "${srcdir}/hipfft-dev_1.0.12.50601-93~22.04_amd64.deb"
	#exz "${srcdir}/hipfort_0.4.0.50601-93~22.04_amd64.deb"
	exz "${srcdir}/hipfort-dev_0.4.0.50601-93~22.04_amd64.deb"
	exz "${srcdir}/hipsolver_1.8.0.50601-93~22.04_amd64.deb"
	exz "${srcdir}/hipsolver-dev_1.8.0.50601-93~22.04_amd64.deb"
	egz "${srcdir}/hipify-clang_16.0.0.50601-93~22.04_amd64.deb"
	exz "${srcdir}/rocsparse_2.5.2.50601-93~22.04_amd64.deb"
	exz "${srcdir}/rocsparse-dev_2.5.2.50601-93~22.04_amd64.deb"
	exz "${srcdir}/hipsparse_2.3.7.50601-93~22.04_amd64.deb"
	exz "${srcdir}/hipsparse-dev_2.3.7.50601-93~22.04_amd64.deb"
	exz "${srcdir}/miopen-hip_2.20.0.50601-93~22.04_amd64.deb"
	exz "${srcdir}/miopen-hip-dev_2.20.0.50601-93~22.04_amd64.deb"
	exz "${srcdir}/rccl_2.16.5.50601-93~22.04_amd64.deb"
	exz "${srcdir}/rccl-dev_2.16.5.50601-93~22.04_amd64.deb"
	exz "${srcdir}/rocrand_2.10.17.50601-93~22.04_amd64.deb"
	exz "${srcdir}/rocrand-dev_2.10.17.50601-93~22.04_amd64.deb"
	exz "${srcdir}/rocalution_2.1.9.50601-93~22.04_amd64.deb"
	exz "${srcdir}/rocalution-dev_2.1.9.50601-93~22.04_amd64.deb"	
	egz "${srcdir}/rocm-hip-libraries_5.6.1.50601-93~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime-dev_5.6.1.50601-93~22.04_amd64.deb"	
	exz "${srcdir}/rocsolver_3.22.0.50601-93~22.04_amd64.deb"
	exz "${srcdir}/rocsolver-dev_3.22.0.50601-93~22.04_amd64.deb"	
	exz "${srcdir}/rocthrust-dev_2.18.0.50601-93~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-sdk_5.6.1.50601-93~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-sdk_5.6.1.50601-93~22.04_amd64.deb"
	exz "${srcdir}/rocwmma-dev_1.1.0.50601-93~22.04_amd64.deb"
	# egz "${srcdir}/rocm-developer-tools_5.4.3.50601-93~22.04_amd64.deb"
	egz "${srcdir}/rocm-ml-libraries_5.6.1.50601-93~22.04_amd64.deb"	
	egz "${srcdir}/rocm-ml-sdk_5.6.1.50601-93~22.04_amd64.deb"
	
	mv "${srcdir}/opt/" "${pkgdir}/"
	# mkdir -p "${pkgdir}/opt/rocm-5.6.1/hsa"
	# ln -s "/opt/rocm-5.6.1/include/hsa" "$pkgdir/opt/rocm-5.6.1/hsa/include"
}
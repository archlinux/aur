# Release notes https://rocm.docs.amd.com/en/latest/about/CHANGELOG.html#rocm-6-0-2
amdgpu_repo='https://repo.radeon.com/amdgpu/6.0.2/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/6.0'
opencl_lib='opt/rocm-6.0.2/opencl/lib'
rocm_lib='opt/rocm-6.0.2/lib'
hip_lib='opt/rocm-6.0.2/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd-dev
pkgdesc="OpenCL SDK / HIP SDK / ROCM Compiler. This package needs at least 10GB of space."
pkgver=6.0.2
pkgrel=1
epoch=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('opencl-amd')
provides=('amd-smi-lib' 'composablekernel-dev' 'rocm-llvm' 'rocblas' 'rocblas-dev' 'rocsolver' 'rocsolver-dev' 'half' 'hipblas' 'hipblas-dev' 'hipblaslt' 'hipblaslt-dev' 'hiprand' 'hiprand-dev' 'rocprim' 'rocprim-dev' 'hipcub' 'hipcub-dev' 'rocfft' 'rocfft-dev' 'hipfft' 'hipfft-dev'
	'hipfort' 'hipfort-dev' 'hipify-clang' 'hipsolver' 'hipsolver-dev' 'rocsparse' 'rocsparse-dev' 'hipsparse' 'hipsparse-dev' 'hipsparselt' 'hipsparselt-dev' 'hiptensor' 'hiptensor-dev' 'openmp-extras-dev' 'rccl' 'rccl-dev' 'rocrand' 'rocrand-dev' 'rocalution' 'rocalution-dev'
	'rocm-hip-libraries' 'rocm-hip-runtime-dev' 'rocthrust' 'rocthrust-dev' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma-dev' 'rocm-developer-tools' 'miopen' 'miopen-hip' 'miopen-hip-dev' 'rocm-ml-libraries' 'rocm-ml-sdk')
conflicts=('amd-smi-lib' 'composablekernel-dev' 'rocm-llvm' 'rocblas' 'rocblas-dev' 'rocsolver' 'rocsolver-dev' 'hipblas' 'hipblas-dev' 'hipblaslt' 'hipblaslt-dev' 'hiprand' 'hiprand-dev' 'rocprim' 'rocprim-dev' 'hipcub' 'hipcub-dev' 'rocfft' 'rocfft-dev' 'hipfft' 'hipfft-dev'
	'hipfort' 'hipfort-dev' 'hipify-clang' 'hipsolver' 'hipsolver-dev' 'rocsparse' 'rocsparse-dev' 'hipsparse' 'hipsparse-dev' 'hipsparselt' 'hipsparselt-dev' 'hiptensor' 'hiptensor-dev' 'openmp-extras-dev' 'rccl' 'rccl-dev' 'rocrand' 'rocrand-dev' 'rocalution' 'rocalution-dev'
	'rocm-hip-libraries' 'rocm-hip-runtime-dev' 'rocthrust' 'rocthrust-dev' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma-dev' 'rocm-developer-tools' 'miopen' 'miopen-hip' 'miopen-hip-dev' 'rocm-ml-libraries' 'rocm-ml-sdk')

source=(
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/a/amd-smi-lib/amd-smi-lib_23.4.2.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/c/composablekernel-dev/composablekernel-dev_1.1.0.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/h/half/half_1.12.0.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/h/hiprand/hiprand_2.10.16.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/h/hiprand-dev/hiprand-dev_2.10.16.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/h/hipcub-dev/hipcub-dev_3.0.0.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/h/hipblas/hipblas_2.0.0.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/h/hipblas-dev/hipblas-dev_2.0.0.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/h/hipblaslt/hipblaslt_0.6.0.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/h/hipblaslt-dev/hipblaslt-dev_0.6.0.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/h/hipfft/hipfft_1.0.13.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/h/hipfft-dev/hipfft-dev_1.0.13.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/h/hipfort-dev/hipfort-dev_0.4.0.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/h/hipsolver/hipsolver_2.0.0.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/h/hipsolver-dev/hipsolver-dev_2.0.0.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/h/hipify-clang/hipify-clang_17.0.0.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/h/hipsparse/hipsparse_3.0.0.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/h/hipsparse-dev/hipsparse-dev_3.0.0.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/h/hipsparselt/hipsparselt_0.1.0.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/h/hipsparselt-dev/hipsparselt-dev_0.1.0.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/h/hiptensor/hiptensor_1.1.0.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/h/hiptensor-dev/hiptensor-dev_1.1.0.60002-115~22.04_amd64.deb"
#"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/h/hiptensor-samples/hiptensor-samples_1.1.0.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/o/openmp-extras-dev/openmp-extras-dev_17.60.0.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rocm-llvm/rocm-llvm_17.0.0.24012.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rocblas/rocblas_4.0.0.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rocblas-dev/rocblas-dev_4.0.0.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rocsolver/rocsolver_3.24.0.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rocsolver-dev/rocsolver-dev_3.24.0.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rocprim-dev/rocprim-dev_3.0.0.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rocfft/rocfft_1.0.25.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rocfft-dev/rocfft-dev_1.0.25.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rocsparse/rocsparse_3.0.2.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rocsparse-dev/rocsparse-dev_3.0.2.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rccl/rccl_2.18.3.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rccl-dev/rccl-dev_2.18.3.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rocrand/rocrand_3.0.0.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rocrand-dev/rocrand-dev_3.0.0.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rocalution/rocalution_3.0.3.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rocalution-dev/rocalution-dev_3.0.3.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rocm-hip-libraries/rocm-hip-libraries_6.0.2.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rocm-hip-runtime-dev/rocm-hip-runtime-dev_6.0.2.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rocthrust-dev/rocthrust-dev_3.0.0.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rocm-hip-sdk/rocm-hip-sdk_6.0.2.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rocm-opencl-sdk/rocm-opencl-sdk_6.0.2.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rocwmma-dev/rocwmma-dev_1.3.0.60002-115~22.04_amd64.deb"
# ML
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/m/miopen-hip/miopen-hip_3.00.0.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/m/miopen-hip-dev/miopen-hip-dev_3.00.0.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rocm-ml-libraries/rocm-ml-libraries_6.0.2.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rocm-ml-sdk/rocm-ml-sdk_6.0.2.60002-115~22.04_amd64.deb"
)

sha256sums=(
"b1f7d6ba4feca0fe29418a947e0896c92c6fc89f4b3ac12153e5eab158d1ba9f"
"86bb70cca83ce8986f03df099f4f87fbdc5e059c8f0cc837dfb145be13c603bb"
"2af1a2ece996e400ac6ec38d718b1df03cd39091bf0f81069c72bd5c281c753f"
"38dc2d2633b725c016a50f1e5554b67de98dee1c0b2cb4eb19ec7f64fb9bf148"
"c399d48d480b39fb7f072f147c84f46de2fca5a25cc5cae88d218f437b1fcfc1"
"6ca8932e4f2b10c8d4d057a8d153e729ca54672de7c53f3e57a33f8a3266ba72"
"2da991b7bfb94645cf421e2ac096924b11e66d4db4e5fb5611924934bede0215"
"def305c241c0b628800951c199257ddd17f6f068a6d96aeeed2b0da059f9502a"
"e146c23d38aaf163c2ac77c48228752b9ebe1f68eb5c91eb0889d7c30111c2dc"
"6922e821f195d7d6f472970725e4c8bb0f946f17212e1a73dcb078b15f4bf39e"
"78c1d75b67122b38c38ca2bf03d38e7e498956ef7623696eead01515dda1420a"
"d967ab3519aa2abb8a67d8e481cd18d4c07dfa2a3beef8be60bc1967f450cf74"
"59ccad1e9e40d334894c3c71cee2c1281603f83255ffbe591d376b35913b8b1c"
"6dd82b56ca4c9c12bc7509d7b3b07c53367e9d1ad9b37c5c68d6c19c25351fda"
"316768119c51d60053fd2c7423016cdd3f92ce16ed3edcb06a5a967ae45cc16a"
"2a48df2ddd14630c49d2d542f953fc6c6179edce8b9dc5d6e05eb512dd77cde9"
"0abe0d21ce2a5bd0daf3172c2ab760f35e7575a27e6bed5ad19bb7df6bfee4ad"
"4699a4b9d230514c072d662b7de22730181d484a43bf1a16506be42d874023c7"
"0ec6d36de37338c60452259c5ce5bef32a0e18d74f4ffc7d015096c59e401694"
"8f8d9d05f7e99ef2b77b02d772203d1ab15952fc3da93fec7fe9555ef147209f"
"9faddbf6e73884344727990474da1d9d50fbd84d9a245acf1c3b974333eb9e1c"
"e7bce4fadac4e837fec945b9e0c0e53330976589367cbc2ef7349a378bcab16f"
#"2c2bb011e24eaf7a4604a5496c024776e2db026bfc11e8f5c8748ad355655353"
"881df9c367736a59541bb358197853b9893682cfd962deac31fb4e54d46b62ce"
"2c972f97b94b2ebe09f07a5aae27475e3ff2d8fc6ce88eee54de407b459f4cf1"
"92c682ddea466f843be14c14b52fce0b5ebac5b8f212017d9255a7c69aac0e57"
"1e35d5ec4f798f8bbec0e422b9ff4e43969f65ed1b3c98f1a2da287f51a83538"
"690b5ddd3e996c8293594bfdbce8a2618a9c85335d9eeea3d921bc4dd525cc96"
"a6735405195080e1f6713e1bfd2f86f8042b56f2ed1e01a7033995990c51625d"
"2c13710a33009f79ccbadea40fc948e3f4746f4c59e511ad2c6f3154c357830b"
"3bb360110a3f5941cf40652bc2ea62b5a34baf63d134c4e077340f3d08659a0b"
"44d475b3d3ed4302730634ec10725950cb523303db0d6bf34b9ca0684c76f418"
"b1f5b18e4b44ea7a871e0c53faf953f14eb35f93f602607b6cd5ba7f2e407d9f"
"6c4bbf5d0cdcfddfa8727b28cd5cfe9b3f27b87d65be8e90fb666ea6c20679dc"
"94bef4ffc7d83a6f9679409415457f0b996d1dfe5d48d9313e208b64f4ffaa6a"
"e5073f00f722ea50501244fdaab8081ee65398f1617b530ae429f00301ddf14b"
"a9681188315201adcbf1a7bec36a692d76ca1d434ff1e2c5b448938bc8414311"
"ab1f5d00f6880af2f884f55c00b33239d851af03cad7bd04a7caf007c4eec290"
"0d3e15081a6cd380ce7366049e939e83ed7ae2636316be67599f421755dc3531"
"aed7eb352adeb51b917aad56b86d697121abad6a5d979260b2192058f7349645"
"951e8a2bdc1f71254ced9e0d30740cfd107d279ee8a3dcc95a9397f151b6aeea"
"eb49bf55aaedb10ab75731979413d6c87769499eadc6ea7b46cf1e6f6eb49aab"
"ed156bb8f6f2c9b5319a1f876fbe83aa1d2905b7076714773ccc0394371286ad"
"e4e93c3486071f65e3f25851bc0732a668efda39558051b740a80924ea7f0038"
"9f27894ae6cae5f489eeeaac867983a99d56b184ade8a7b644c411a19235bcd4"
"1b4de14f237f48b7ea433e1e6630bedf195cae13bb3d42d41aa945a7011ac718"
# ML
"ebabe7cce3df641a08429736c2e7d53757a054bed9c1f3b82b1234eebe3b3134"
"18c54ca0bda000ca4dd000dbafb7fe03c9e571733fda9e65a0815fbb939fbcd5"
"2b715bfe7450921fd380b4d19be613f74cdcc027b8317b1008afba887b866520"
"0bcc26d08fef8bfe1f63dd65aefc235582f1623fd2c62cb6856b1c7487eac679"
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
	egz "${srcdir}/amd-smi-lib_23.4.2.60002-115~22.04_amd64.deb"
	exz "${srcdir}/composablekernel-dev_1.1.0.60002-115~22.04_amd64.deb"
	exz "${srcdir}/half_1.12.0.60002-115~22.04_amd64.deb"
	exz "${srcdir}/hiprand_2.10.16.60002-115~22.04_amd64.deb"
	exz "${srcdir}/hiprand-dev_2.10.16.60002-115~22.04_amd64.deb"
	exz "${srcdir}/hipblas_2.0.0.60002-115~22.04_amd64.deb"
	exz "${srcdir}/hipblas-dev_2.0.0.60002-115~22.04_amd64.deb"
	exz "${srcdir}/hipblaslt_0.6.0.60002-115~22.04_amd64.deb"
	exz "${srcdir}/hipblaslt-dev_0.6.0.60002-115~22.04_amd64.deb"
	exz "${srcdir}/hipcub-dev_3.0.0.60002-115~22.04_amd64.deb"
	exz "${srcdir}/hipfft_1.0.13.60002-115~22.04_amd64.deb"
	exz "${srcdir}/hipfft-dev_1.0.13.60002-115~22.04_amd64.deb"	
	exz "${srcdir}/hipfort-dev_0.4.0.60002-115~22.04_amd64.deb"
	exz "${srcdir}/hipsolver_2.0.0.60002-115~22.04_amd64.deb"
	exz "${srcdir}/hipsolver-dev_2.0.0.60002-115~22.04_amd64.deb"
	egz "${srcdir}/hipify-clang_17.0.0.60002-115~22.04_amd64.deb"
	exz "${srcdir}/hipsparse_3.0.0.60002-115~22.04_amd64.deb"
	exz "${srcdir}/hipsparse-dev_3.0.0.60002-115~22.04_amd64.deb"
	exz "${srcdir}/hipsparselt_0.1.0.60002-115~22.04_amd64.deb"
	exz "${srcdir}/hipsparselt-dev_0.1.0.60002-115~22.04_amd64.deb"
	exz "${srcdir}/hiptensor_1.1.0.60002-115~22.04_amd64.deb"
	exz "${srcdir}/hiptensor-dev_1.1.0.60002-115~22.04_amd64.deb"
	#exz "${srcdir}/hiptensor-samples_1.1.0.60002-115~22.04_amd64.deb"
	exz "${srcdir}/miopen-hip_3.00.0.60002-115~22.04_amd64.deb"
	exz "${srcdir}/miopen-hip-dev_3.00.0.60002-115~22.04_amd64.deb"
	egz "${srcdir}/openmp-extras-dev_17.60.0.60002-115~22.04_amd64.deb"
	egz "${srcdir}/rocm-llvm_17.0.0.24012.60002-115~22.04_amd64.deb"	
	exz "${srcdir}/rocblas_4.0.0.60002-115~22.04_amd64.deb"
	exz "${srcdir}/rocblas-dev_4.0.0.60002-115~22.04_amd64.deb"
	exz "${srcdir}/rocprim-dev_3.0.0.60002-115~22.04_amd64.deb"
	exz "${srcdir}/rocfft_1.0.25.60002-115~22.04_amd64.deb"
	exz "${srcdir}/rocfft-dev_1.0.25.60002-115~22.04_amd64.deb"
	exz "${srcdir}/rocsparse_3.0.2.60002-115~22.04_amd64.deb"
	exz "${srcdir}/rocsparse-dev_3.0.2.60002-115~22.04_amd64.deb"
	exz "${srcdir}/rccl_2.18.3.60002-115~22.04_amd64.deb"
	exz "${srcdir}/rccl-dev_2.18.3.60002-115~22.04_amd64.deb"
	exz "${srcdir}/rocrand_3.0.0.60002-115~22.04_amd64.deb"
	exz "${srcdir}/rocrand-dev_3.0.0.60002-115~22.04_amd64.deb"
	exz "${srcdir}/rocalution_3.0.3.60002-115~22.04_amd64.deb"
	exz "${srcdir}/rocalution-dev_3.0.3.60002-115~22.04_amd64.deb"	
	egz "${srcdir}/rocm-hip-libraries_6.0.2.60002-115~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime-dev_6.0.2.60002-115~22.04_amd64.deb"
	exz "${srcdir}/rocsolver_3.24.0.60002-115~22.04_amd64.deb"
	exz "${srcdir}/rocsolver-dev_3.24.0.60002-115~22.04_amd64.deb"	
	exz "${srcdir}/rocthrust-dev_3.0.0.60002-115~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-sdk_6.0.2.60002-115~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-sdk_6.0.2.60002-115~22.04_amd64.deb"
	exz "${srcdir}/rocwmma-dev_1.3.0.60002-115~22.04_amd64.deb"	
	egz "${srcdir}/rocm-ml-libraries_6.0.2.60002-115~22.04_amd64.deb"	
	egz "${srcdir}/rocm-ml-sdk_6.0.2.60002-115~22.04_amd64.deb"
	
	mv "${srcdir}/opt/" "${pkgdir}/"
	# mkdir -p "${pkgdir}/opt/rocm-6.0.2/hsa"
	# ln -s "/opt/rocm-6.0.2/include/hsa" "$pkgdir/opt/rocm-6.0.2/hsa/include"
}
# Release notes https://rocm.docs.amd.com/en/latest/CHANGELOG.html#rocm-5-7-0
amdgpu_repo='https://repo.radeon.com/amdgpu/5.7/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/5.7'
opencl_lib='opt/rocm-5.7.0/opencl/lib'
rocm_lib='opt/rocm-5.7.0/lib'
hip_lib='opt/rocm-5.7.0/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd-dev
pkgdesc="OpenCL SDK / HIP SDK / ROCM Compiler. This package needs at least 10GB of space."
pkgver=5.7.0
pkgrel=1
epoch=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('opencl-amd')
provides=('rocm-llvm' 'rocblas' 'rocblas-dev' 'rocsolver' 'rocsolver-dev' 'hipblas' 'hipblas-dev' 'hipblaslt' 'hipblaslt-dev' 'rocprim' 'rocprim-dev' 'hipcub' 'hipcub-dev' 'rocfft' 'rocfft-dev' 'hipfft' 'hipfft-dev'
	'hipfort' 'hipfort-dev' 'hipify-clang' 'hipsolver' 'hipsolver-dev' 'rocsparse' 'rocsparse-dev' 'hipsparse' 'hipsparse-dev' 'hiptensor' 'openmp-extras-dev' 'rccl' 'rccl-dev' 'rocrand' 'rocrand-dev' 'rocalution' 'rocalution-dev'
	'rocm-hip-libraries' 'rocm-hip-runtime-dev' 'rocthrust' 'rocthrust-dev' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma-dev' 'rocm-developer-tools' 'miopen' 'miopen-hip' 'miopen-hip-dev' 'rocm-ml-libraries' 'rocm-ml-sdk')
conflicts=('rocm-llvm' 'rocblas' 'rocblas-dev' 'rocsolver' 'rocsolver-dev' 'hipblas' 'hipblas-dev' 'hipblaslt' 'hipblaslt-dev' 'rocprim' 'rocprim-dev' 'hipcub' 'hipcub-dev' 'rocfft' 'rocfft-dev' 'hipfft' 'hipfft-dev'
	'hipfort' 'hipfort-dev' 'hipify-clang' 'hipsolver' 'hipsolver-dev' 'rocsparse' 'rocsparse-dev' 'hipsparse' 'hipsparse-dev' 'hiptensor' 'openmp-extras-dev' 'rccl' 'rccl-dev' 'rocrand' 'rocrand-dev' 'rocalution' 'rocalution-dev'
	'rocm-hip-libraries' 'rocm-hip-runtime-dev' 'rocthrust' 'rocthrust-dev' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma-dev' 'rocm-developer-tools' 'miopen' 'miopen-hip' 'miopen-hip-dev' 'rocm-ml-libraries' 'rocm-ml-sdk')

source=(
"https://repo.radeon.com/rocm/apt/5.7/pool/main/o/openmp-extras-dev/openmp-extras-dev_17.57.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rocm-llvm/rocm-llvm_17.0.0.23352.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rocblas/rocblas_3.1.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rocblas-dev/rocblas-dev_3.1.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rocsolver/rocsolver_3.23.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rocsolver-dev/rocsolver-dev_3.23.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/h/hipblas/hipblas_1.1.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/h/hipblas-dev/hipblas-dev_1.1.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/h/hipblaslt/hipblaslt_0.3.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/h/hipblaslt-dev/hipblaslt-dev_0.3.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rocprim-dev/rocprim-dev_2.13.1.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/h/hipcub-dev/hipcub-dev_2.13.1.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rocfft/rocfft_1.0.23.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rocfft-dev/rocfft-dev_1.0.23.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/h/hipfft/hipfft_1.0.12.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/h/hipfft-dev/hipfft-dev_1.0.12.50700-63~22.04_amd64.deb"
#"https://repo.radeon.com/rocm/apt/5.7/pool/main/h/hipfort/hipfort_0.4.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/h/hipfort-dev/hipfort-dev_0.4.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/h/hipsolver/hipsolver_1.8.1.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/h/hipsolver-dev/hipsolver-dev_1.8.1.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/h/hipify-clang/hipify-clang_17.0.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rocsparse/rocsparse_2.5.4.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rocsparse-dev/rocsparse-dev_2.5.4.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/h/hipsparse/hipsparse_2.3.8.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/h/hipsparse-dev/hipsparse-dev_2.3.8.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/h/hiptensor/hiptensor_1.0.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/h/hiptensor-dev/hiptensor-dev_1.0.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/h/hiptensor-samples/hiptensor-samples_1.0.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rccl/rccl_2.17.1.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rccl-dev/rccl-dev_2.17.1.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rocrand/rocrand_2.10.17.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rocrand-dev/rocrand-dev_2.10.17.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rocalution/rocalution_2.1.11.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rocalution-dev/rocalution-dev_2.1.11.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rocm-hip-libraries/rocm-hip-libraries_5.7.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rocm-hip-runtime-dev/rocm-hip-runtime-dev_5.7.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rocthrust-dev/rocthrust-dev_2.18.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rocm-hip-sdk/rocm-hip-sdk_5.7.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rocm-opencl-sdk/rocm-opencl-sdk_5.7.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rocwmma-dev/rocwmma-dev_1.2.0.50700-63~22.04_amd64.deb"
#"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rocm-developer-tools/rocm-developer-tools_5.4.3.50700-63~22.04_amd64.deb"
# ML
"https://repo.radeon.com/rocm/apt/5.7/pool/main/m/miopen-hip/miopen-hip_2.20.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/m/miopen-hip-dev/miopen-hip-dev_2.20.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rocm-ml-libraries/rocm-ml-libraries_5.7.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rocm-ml-sdk/rocm-ml-sdk_5.7.0.50700-63~22.04_amd64.deb"
)

sha256sums=(
"3b4c7d750e42c5c9a6a8e3ebc174268e96c723ba5fe1fc6cbdebe4bf79c618d7"
"fdb8e4a4f99daa25a494511687fcf542805d55fdc9ec91dd403608528ce41ea7"
"e00c1f16876ae704402c80d174de30f81276c707f74f1f2cca53451cda3acf07"
"4a7b3d926c992a5f302bd3d89cee053348c0e543c62851d2071faccb3d54067e"
"7ac5ba31619e857635f05a7c7f012fb9a570d0dc5458415a3867c6e7f122c257"
"25199ac5d2188daa48fc96abc3faa7763abfe8fcf72389e9727b42959082c859"
"ea8a876dff466d43c6cb4e093072296e9d67b3603908f6974a937a0549476696"
"bb9c0c82425751dbd25f17c563faa4dd4733e1622e1e8138d3d166c19a869c34"
"24cf363ad09ba36c61e7d2078e6ead90ed70c020ad065bbd9792b08b961e98a3"
"d59eb0734140c36156c13d9536f4b8dee4aa6d6d8469670c1514e8f2e870c90e"
"e15633df44ca26f7943ce0a58f1f0e8dd68504270ea86bd9b6d33f9f159b7d76"
"e33941f86e88780fa485f0a4232800df30663ec9fa6b4354663cc3e85ccce99a"
"49a6554bad0e89b2fc0427b2bc160fd81355c0d770886fd7ec0a9eab646e53ee"
"646045a746edf645c1005dc3b876674eb21813e2527a02c6f4ad42c185ba1ea8"
"9ec112b36c5290ed0e0c81410a935513c974e9431f01f22d42e8752235374637"
"684b6f56d5988ce13607104427940903ba8ce4df54bedf49f33d97c6f0d6dd86"
#"2c2bb011e24eaf7a4604a5496c024776e2db026bfc11e8f5c8748ad355655353"
"0b7b80ba042d7bce1a778b68091714ccdaeb3d53f3464b514e6722b9d10c2ea1"
"5665ec5d51f6981ce9e494017ab2d6f36cc60fbe60d8c26fad5d5f0a57f6a271"
"60b4aba2d92362cab5cd44afbd1ca4b59ea9b7071d93ea8d100d48f5e80eb49b"
"f2e02808fed0c6d67669e6ba011e684f1794b6ddcb764f1da5a14db4e70eb46a"
"45117ee66cba3f5fdfd5877905c7d29570afe1da0da5aa2c19efc633020ffebe"
"e201e349eda24c404ed696430c32b2593cc47ab502628454864ad26b9fb3d819"
"295e17a5d571db2b29552a2e868d8ba5d49bddc35f94af02b4c6bbe83623fc18"
"4d03c2ed288fd9ec214c8a44448c98fb3e3ffda1f98f855fa2875137ba630fc4"
"2443e56ee9a796cb26d84467eb6cd2304bfa579da0f21a4252efdce348030fb9"
"ab3512ca7f79f237155550aed672920d9567c58964639ed678b4ebd529abb758"
"0d0adcbd563ad47ed8f6a194e3d837dedc89d954417ece3959c825c4de899fb9"
"849749ce76bb915a6f36760e5237b99c3ca9cc14abf63ab651bf0a30747a4077"
"e4d4fbc5427c9922852030e0709b3a19980856dfc6fa6f5d48130cd6a1c8c5b0"
"c3d2cd142aefb53a0663701c348f70eaa164ef3fc0465a2fcd0ca94835b63e72"
"1782339aff3fc15309db0364dfba8fc7db7c71da824aa174e0f7adbb453b276c"
"686c2fb6cca0aafd998338318da0678834d7226723ef47766e08885bde02f1e6"
"a30082835d49ef3c77d4605592b12236c405b206c439c82fc0c76fa3c27611f3"
"d4551ce46a34f72ecc24d2ec5efe60c69419ee42f9d2011b9d55c97d156c6efd"
"dd7f0cb5296ef1475cdaed78bc6e78fa3598963ad98a33ef93a2b8be20cdf3f0"
"c69ff0b6bedfd90a75dfb84eded7b3179e3779de0e50835b7b1b9861136439c3"
"23b2bc6fb9774bef7449c22e52e149bc6449fb971a2f2f2eeed6d197ac0d0b82"
"0829307380b2d2c0baa4f6da67d9af635ff0dd9869fdf3f108df89a1df1cf37d"
"a4f21080a256edef6080f36456a6a961c42223b6301bdac6749107748ccc7475"
# "4bba416791003fb689db8e9ebc68c15eac2951be98c4c5b9d09c40f202748d23"
# ML
"9ce5c2f600460aff507a44b7b1bbe2343c411f48e2ac3a8d8759eae5ff4c0bb7"
"c2cad73759bec0b2997d9af46a93b892ae7c8fee28749cd223dfb003755e9fa8"
"c454fb564968705b5aeb2ea40dec8bd6525bbac35bf6b7121a3d173d87698586"
"9f85e993139d39fdb45f14d9d882ea27d177db18533b51b9dc04df9f49193b2b"
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
	egz "${srcdir}/openmp-extras-dev_17.57.0.50700-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-llvm_17.0.0.23352.50700-63~22.04_amd64.deb"
	exz "${srcdir}/rocblas_3.1.0.50700-63~22.04_amd64.deb"
	exz "${srcdir}/rocblas-dev_3.1.0.50700-63~22.04_amd64.deb"
	exz "${srcdir}/hipblas_1.1.0.50700-63~22.04_amd64.deb"
	exz "${srcdir}/hipblas-dev_1.1.0.50700-63~22.04_amd64.deb"
	exz "${srcdir}/hipblaslt_0.3.0.50700-63~22.04_amd64.deb"
	exz "${srcdir}/hipblaslt-dev_0.3.0.50700-63~22.04_amd64.deb"
	exz "${srcdir}/rocprim-dev_2.13.1.50700-63~22.04_amd64.deb"
	exz "${srcdir}/hipcub-dev_2.13.1.50700-63~22.04_amd64.deb"
	exz "${srcdir}/rocfft_1.0.23.50700-63~22.04_amd64.deb"
	exz "${srcdir}/rocfft-dev_1.0.23.50700-63~22.04_amd64.deb"
	exz "${srcdir}/hipfft_1.0.12.50700-63~22.04_amd64.deb"
	exz "${srcdir}/hipfft-dev_1.0.12.50700-63~22.04_amd64.deb"
	#exz "${srcdir}/hipfort_0.4.0.50700-63~22.04_amd64.deb"
	exz "${srcdir}/hipfort-dev_0.4.0.50700-63~22.04_amd64.deb"
	exz "${srcdir}/hipsolver_1.8.1.50700-63~22.04_amd64.deb"
	exz "${srcdir}/hipsolver-dev_1.8.1.50700-63~22.04_amd64.deb"
	egz "${srcdir}/hipify-clang_17.0.0.50700-63~22.04_amd64.deb"
	exz "${srcdir}/rocsparse_2.5.4.50700-63~22.04_amd64.deb"
	exz "${srcdir}/rocsparse-dev_2.5.4.50700-63~22.04_amd64.deb"
	exz "${srcdir}/hipsparse_2.3.8.50700-63~22.04_amd64.deb"
	exz "${srcdir}/hipsparse-dev_2.3.8.50700-63~22.04_amd64.deb"
	exz "${srcdir}/hiptensor_1.0.0.50700-63~22.04_amd64.deb"
	exz "${srcdir}/hiptensor-dev_1.0.0.50700-63~22.04_amd64.deb"
	exz "${srcdir}/hiptensor-samples_1.0.0.50700-63~22.04_amd64.deb"
	exz "${srcdir}/miopen-hip_2.20.0.50700-63~22.04_amd64.deb"
	exz "${srcdir}/miopen-hip-dev_2.20.0.50700-63~22.04_amd64.deb"
	exz "${srcdir}/rccl_2.17.1.50700-63~22.04_amd64.deb"
	exz "${srcdir}/rccl-dev_2.17.1.50700-63~22.04_amd64.deb"
	exz "${srcdir}/rocrand_2.10.17.50700-63~22.04_amd64.deb"
	exz "${srcdir}/rocrand-dev_2.10.17.50700-63~22.04_amd64.deb"
	exz "${srcdir}/rocalution_2.1.11.50700-63~22.04_amd64.deb"
	exz "${srcdir}/rocalution-dev_2.1.11.50700-63~22.04_amd64.deb"	
	egz "${srcdir}/rocm-hip-libraries_5.7.0.50700-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime-dev_5.7.0.50700-63~22.04_amd64.deb"	
	exz "${srcdir}/rocsolver_3.23.0.50700-63~22.04_amd64.deb"
	exz "${srcdir}/rocsolver-dev_3.23.0.50700-63~22.04_amd64.deb"	
	exz "${srcdir}/rocthrust-dev_2.18.0.50700-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-sdk_5.7.0.50700-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-sdk_5.7.0.50700-63~22.04_amd64.deb"
	exz "${srcdir}/rocwmma-dev_1.2.0.50700-63~22.04_amd64.deb"
	# egz "${srcdir}/rocm-developer-tools_5.4.3.50700-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-ml-libraries_5.7.0.50700-63~22.04_amd64.deb"	
	egz "${srcdir}/rocm-ml-sdk_5.7.0.50700-63~22.04_amd64.deb"
	
	mv "${srcdir}/opt/" "${pkgdir}/"
	# mkdir -p "${pkgdir}/opt/rocm-5.7.0/hsa"
	# ln -s "/opt/rocm-5.7.0/include/hsa" "$pkgdir/opt/rocm-5.7.0/hsa/include"
}
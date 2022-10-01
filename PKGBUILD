# Release notes https://docs.amd.com/bundle/ROCm-Release-Notes-v5.3/page/About_This_Document.html
amdgpu_install='22.40.0.50300'
amdgpu_version='22.40.0'
rocm_version='50300'
amdgpu_build_id='1483871.22.04'
rocm_build_id='63~22.04'
amdgpu_repo='https://repo.radeon.com/amdgpu/5.3/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/5.3'
opencl_lib='opt/rocm-5.3.0/opencl/lib'
rocm_lib='opt/rocm-5.3.0/lib'
hip_lib='opt/rocm-5.3.0/hip/lib/'
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
provides=('rocm-llvm' 'rocblas' 'rocblas-dev' 'rocsolver' 'rocsolver-dev' 'hipblas' 'hipblas-dev' 'rocprim-dev' 'hipcub-dev' 'rocfft' 'rocfft-dev' 'hipfft' 'hipfft-dev' 'hipfort' 'hipfort-dev' 
	'hipify-clang' 'hipsolver' 'hipsolver-dev' 'rocsparse' 'rocsparse-dev' 'hipsparse' 'hipsparse-dev' 'rccl' 'rccl-dev' 'rocrand' 'rocrand-dev' 'rocalution' 'rocalution-dev' 'rocm-hip-libraries' 
	'rocm-hip-runtime-dev' 'rocthrust-dev' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma-dev' 'rocm-developer-tools' 'miopen-hip' 'miopen-hip-dev' 'rocm-ml-libraries' 'rocm-ml-sdk')

source=(
"https://repo.radeon.com/rocm/apt/5.3/pool/main/o/openmp-extras-dev/openmp-extras-dev_15.53.0.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/rocm-llvm/rocm-llvm_15.0.0.22362.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/rocblas/rocblas_2.45.0.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/rocblas-dev/rocblas-dev_2.45.0.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/rocsolver/rocsolver_3.19.0.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/rocsolver-dev/rocsolver-dev_3.19.0.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/h/hipblas/hipblas_0.52.0.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/h/hipblas-dev/hipblas-dev_0.52.0.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/rocprim-dev/rocprim-dev_2.10.9.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/h/hipcub-dev/hipcub-dev_2.10.12.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/rocfft/rocfft_1.0.18.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/rocfft-dev/rocfft-dev_1.0.18.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/h/hipfft/hipfft_1.0.9.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/h/hipfft-dev/hipfft-dev_1.0.9.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/h/hipfort/hipfort_0.4.0.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/h/hipfort-dev/hipfort-dev_0.4.0.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/h/hipify-clang/hipify-clang_15.0.0.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/rocsparse/rocsparse_2.3.3.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/rocsparse-dev/rocsparse-dev_2.3.3.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/h/hipsparse/hipsparse_2.3.2.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/h/hipsparse-dev/hipsparse-dev_2.3.2.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/rccl/rccl_2.12.12.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/rccl-dev/rccl-dev_2.12.12.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/rocrand/rocrand_2.10.9.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/rocrand-dev/rocrand-dev_2.10.9.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/rocalution/rocalution_2.1.2.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/rocalution-dev/rocalution-dev_2.1.2.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/rocm-hip-libraries/rocm-hip-libraries_5.3.0.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/rocm-hip-runtime-dev/rocm-hip-runtime-dev_5.3.0.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/rocthrust-dev/rocthrust-dev_2.10.9.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/rocm-hip-sdk/rocm-hip-sdk_5.3.0.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/rocm-opencl-sdk/rocm-opencl-sdk_5.3.0.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/rocwmma-dev/rocwmma-dev_0.7.0.50300-63~22.04_amd64.deb"
#"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/rocm-developer-tools/rocm-developer-tools_5.3.0.50300-63~22.04_amd64.deb"
# ML
"https://repo.radeon.com/rocm/apt/5.3/pool/main/m/miopen-hip/miopen-hip_2.18.0.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/m/miopen-hip-dev/miopen-hip-dev_2.18.0.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/rocm-ml-libraries/rocm-ml-libraries_5.3.0.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/rocm-ml-sdk/rocm-ml-sdk_5.3.0.50300-63~22.04_amd64.deb"
)

sha256sums=(
"d3bf5fda899e83d2f8b3f30103cc008fbce3abe008a4c47a812218d40aacf3cf"
"cf8dc5bbae99cfe56b1d759f340c9c2200cc9b6aaf3d58bd0c41509dd4acef3f"
"55b96425f1d9f5e38b65b2f33794be0a328eaf9151787ab079f31ce1450aa583"
"d0b829a6a2e319a1ce7ebe90a707bb279a4fec0f81e98f4a5dc15415dd4fe77a"
"91ab44f5cd2779f31b48dcff058df8be538815559df4dc9e7887be6604c44ea1"
"78aac1badd7f14f0839bbd9eb5e675bf8e65f66a68d8ec024749fe87c997785d"
"370a0001d2e915ab824321a845328fd426874a70d9811be56e8a449eaf5d53e0"
"7ca0d8ae060db7ff27eaac4ee569e8741e26ed3b5876cfe396734aae2023ed77"
"f7137e172ce9bd350fd35fe331feeb6541b5e237a0dc5523085ce5388e6b3cb2"
"90abdf503034b8da04191225ddc4b75c074a9d1d7bbfb0d9570b6d50d3605890"
"2abb867f467c812aa0b74301271f0451deab2088a216087215accae099cfaafe"
"d9fd9b0ad6bbc6fe8ee1dea65e607e2b5b840485315799c2ddc36772cf1a1dc2"
"020c6cbf9c4c929925980d96cdb345685721dfb67dda84eee6b857428476f407"
"f8b3faf9e56a261d85e08298a26007a2544e2fa7c980fb64ac636810d3bdd650"
"3b59ba47c29e4f74727812772bb8c8f6679ad4d72e22cd28e49139be4a77c63d"
"1bb380f2ebc10e5f019dfbc36974f5b11da3bdaa0f92d8ca73a1d638439d2042"
"271c7dc72e0724ef37b220296ecb8b3acb92687a7c84557db3aa5019a2607ba9"
"943b6d63f7bac6aea21012ced6d6278af41b6a1b3d06236e1eaa88715fadf196"
"63c57766f4d962ebbf3d00304fdf3b3461c470bcad13b41d3e8640dd88d0a27b"
"371e3f4fb71238d7b86eb1de8e62aff5edaae5e67b2ffde634adf1c17a293d0e"
"03bb9729324e1e3abea3f336bcdc8c537078cb124687c1722db1f871f3ee2fe2"
"fb518043f7696efb861bd954fdd4be8e8c9ed06891c16b28fce0b84fe1abba8d"
"ac8adf8c8edf64cee9f008fc51ef0e533e08b54c76db63f27a282312f3743506"
"37b41a57d9dc2ac96cb586f863173a4082dfc8285c21387c4b861531a2807229"
"115d6a4ca5eafbaa6bec1e7b4c9af3080f7e58cc5d9016fd8a0d867b852344c5"
"7e012715ac78c6b4f19bebdfefa5d6b6a302d8e499118dfe3d8ffe884eacabe4"
"046c75564e16d101eaeea18edeb4bfc666e6527df144ede5fac072fcf2ee5fd7"
"18d2c4b06edfb5893a645e67bd3bc9472727858627d133b9cd372ae74be49c95"
"36bb438773481105af8124b638d993874d268a3c1492ed4128f5ce37b2b096f3"
"8fad7911a0a1b5da3049a562c1db1944756275159199fec3056697369f8ee088"
"34fc23572029646d57bd766a690e78e74c4116c7750c4aab339df079ace0202d"
"9e0f7d681f7f4ad80d1dfdfd00cf25e115c90111de74e3ab96ffca2fcdfde1a7"
"4e3bcc07926beb145fc285a5e98298d7e16d47b60cd02d552f2d77902228b570"
# "4bba416791003fb689db8e9ebc68c15eac2951be98c4c5b9d09c40f202748d23"
# ML
"da964525685fc892e6ef136ca647f0e9dfee14d1cd60e969bfac299c2619680d"
"bd7ad83b1a48553430c53b550c8a89d28bad67e107b7ec00c229380e30975d26"
"157dc7b7011879ff52a24603078e167bc10a823eb0d9f2824f4ed2087c404215"
"0f67da5210cebe0d0adf2200aeac97624fc7bda13911fab039d0047d6c3e8b12"
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
	egz "${srcdir}/openmp-extras-dev_15.53.0.50300-63~22.04_amd64.deb"
	exz "${srcdir}/rocm-llvm_15.0.0.22362.50300-63~22.04_amd64.deb"
	exz "${srcdir}/rocblas_2.45.0.50300-63~22.04_amd64.deb"
	egz "${srcdir}/rocblas-dev_2.45.0.50300-63~22.04_amd64.deb"		
	exz "${srcdir}/hipblas_0.52.0.50300-63~22.04_amd64.deb"
	exz "${srcdir}/hipblas-dev_0.52.0.50300-63~22.04_amd64.deb"
	exz "${srcdir}/rocprim-dev_2.10.9.50300-63~22.04_amd64.deb"
	exz "${srcdir}/hipcub-dev_2.10.12.50300-63~22.04_amd64.deb"
	exz "${srcdir}/rocfft_1.0.18.50300-63~22.04_amd64.deb"
	exz "${srcdir}/rocfft-dev_1.0.18.50300-63~22.04_amd64.deb"
	exz "${srcdir}/hipfft_1.0.9.50300-63~22.04_amd64.deb"
	exz "${srcdir}/hipfft-dev_1.0.9.50300-63~22.04_amd64.deb"
	exz "${srcdir}/hipfort_0.4.0.50300-63~22.04_amd64.deb"
	exz "${srcdir}/hipfort-dev_0.4.0.50300-63~22.04_amd64.deb"
	egz "${srcdir}/hipify-clang_15.0.0.50300-63~22.04_amd64.deb"
	exz "${srcdir}/rocsparse_2.3.3.50300-63~22.04_amd64.deb"
	exz "${srcdir}/rocsparse-dev_2.3.3.50300-63~22.04_amd64.deb"
	exz "${srcdir}/hipsparse_2.3.2.50300-63~22.04_amd64.deb"
	exz "${srcdir}/hipsparse-dev_2.3.2.50300-63~22.04_amd64.deb"
	exz "${srcdir}/miopen-hip_2.18.0.50300-63~22.04_amd64.deb"
	exz "${srcdir}/miopen-hip-dev_2.18.0.50300-63~22.04_amd64.deb"
	exz "${srcdir}/rccl_2.12.12.50300-63~22.04_amd64.deb"
	exz "${srcdir}/rccl-dev_2.12.12.50300-63~22.04_amd64.deb"
	exz "${srcdir}/rocrand_2.10.9.50300-63~22.04_amd64.deb"
	exz "${srcdir}/rocrand-dev_2.10.9.50300-63~22.04_amd64.deb"
	exz "${srcdir}/rocalution_2.1.2.50300-63~22.04_amd64.deb"
	exz "${srcdir}/rocalution-dev_2.1.2.50300-63~22.04_amd64.deb"	
	egz "${srcdir}/rocm-hip-libraries_5.3.0.50300-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime-dev_5.3.0.50300-63~22.04_amd64.deb"	
	exz "${srcdir}/rocsolver_3.19.0.50300-63~22.04_amd64.deb"
	exz "${srcdir}/rocsolver-dev_3.19.0.50300-63~22.04_amd64.deb"	
	exz "${srcdir}/rocthrust-dev_2.10.9.50300-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-sdk_5.3.0.50300-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-sdk_5.3.0.50300-63~22.04_amd64.deb"
	exz "${srcdir}/rocwmma-dev_0.7.0.50300-63~22.04_amd64.deb"
	# egz "${srcdir}//rocm-developer-tools_5.3.0.50300-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-ml-libraries_5.3.0.50300-63~22.04_amd64.deb"	
	egz "${srcdir}/rocm-ml-sdk_5.3.0.50300-63~22.04_amd64.deb"
	
	mv "${srcdir}/opt/" "${pkgdir}/"
	# mkdir -p "${pkgdir}/opt/rocm-5.3.0/hsa"
	# ln -s "/opt/rocm-5.3.0/include/hsa" "$pkgdir/opt/rocm-5.3.0/hsa/include"
}
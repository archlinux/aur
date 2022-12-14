# Release notes https://docs.amd.com/bundle/ROCm-Release-Notes-v5.4.1/page/About_This_Document.html
amdgpu_repo='https://repo.radeon.com/amdgpu/5.4.1/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/5.4.1'
opencl_lib='opt/rocm-5.4.1/opencl/lib'
rocm_lib='opt/rocm-5.4.1/lib'
hip_lib='opt/rocm-5.4.1/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd-dev
pkgdesc="OpenCL SDK / HIP SDK / ROCM Compiler. This package needs at least 10GB of space."
pkgver=5.4.1
pkgrel=1
epoch=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('opencl-amd')
provides=('rocm-llvm' 'rocblas' 'rocblas-dev' 'rocsolver' 'rocsolver-dev' 'hipblas' 'hipblas-dev' 'rocprim-dev' 'hipcub-dev' 'rocfft' 'rocfft-dev' 'hipfft' 'hipfft-dev' 'hipfort' 'hipfort-dev' 
	'hipify-clang' 'hipsolver' 'hipsolver-dev' 'rocsparse' 'rocsparse-dev' 'hipsparse' 'hipsparse-dev' 'rccl' 'rccl-dev' 'rocrand' 'rocrand-dev' 'rocalution' 'rocalution-dev' 'rocm-hip-libraries' 
	'rocm-hip-runtime-dev' 'rocthrust-dev' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma-dev' 'rocm-developer-tools' 'miopen' 'miopen-hip' 'miopen-hip-dev' 'rocm-ml-libraries' 'rocm-ml-sdk')

source=(
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/o/openmp-extras-dev/openmp-extras-dev_15.54.0.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/rocm-llvm/rocm-llvm_15.0.0.22465.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/rocblas/rocblas_2.46.0.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/rocblas-dev/rocblas-dev_2.46.0.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/rocsolver/rocsolver_3.20.0.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/rocsolver-dev/rocsolver-dev_3.20.0.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/h/hipblas/hipblas_0.53.0.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/h/hipblas-dev/hipblas-dev_0.53.0.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/rocprim-dev/rocprim-dev_2.10.9.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/h/hipcub-dev/hipcub-dev_2.10.12.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/rocfft/rocfft_1.0.20.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/rocfft-dev/rocfft-dev_1.0.20.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/h/hipfft/hipfft_1.0.10.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/h/hipfft-dev/hipfft-dev_1.0.10.50401-84~22.04_amd64.deb"
#"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/h/hipfort/hipfort_0.4.0.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/h/hipfort-dev/hipfort-dev_0.4.0.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/h/hipsolver/hipsolver_1.6.0.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/h/hipsolver-dev/hipsolver-dev_1.6.0.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/h/hipify-clang/hipify-clang_15.0.0.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/rocsparse/rocsparse_2.3.3.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/rocsparse-dev/rocsparse-dev_2.3.3.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/h/hipsparse/hipsparse_2.3.3.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/h/hipsparse-dev/hipsparse-dev_2.3.3.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/rccl/rccl_2.13.4.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/rccl-dev/rccl-dev_2.13.4.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/rocrand/rocrand_2.10.9.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/rocrand-dev/rocrand-dev_2.10.9.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/rocalution/rocalution_2.1.3.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/rocalution-dev/rocalution-dev_2.1.3.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/rocm-hip-libraries/rocm-hip-libraries_5.4.1.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/rocm-hip-runtime-dev/rocm-hip-runtime-dev_5.4.1.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/rocthrust-dev/rocthrust-dev_2.10.9.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/rocm-hip-sdk/rocm-hip-sdk_5.4.1.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/rocm-opencl-sdk/rocm-opencl-sdk_5.4.1.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/rocwmma-dev/rocwmma-dev_0.7.0.50401-84~22.04_amd64.deb"
#"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/rocm-developer-tools/rocm-developer-tools_5.4.1.50401-84~22.04_amd64.deb"
# ML
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/m/miopen-hip/miopen-hip_2.19.0.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/m/miopen-hip-dev/miopen-hip-dev_2.19.0.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/rocm-ml-libraries/rocm-ml-libraries_5.4.1.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/rocm-ml-sdk/rocm-ml-sdk_5.4.1.50401-84~22.04_amd64.deb"
)

sha256sums=(
"b35c9c24a92511aeaa4c3235ce54d0cc2ccd79b457b6e5981fcbcd772f55df8f"
"f9e9cfc62ed96f90e492b10b920b5120267973c5b1262c4f9e2877ee42fcb6aa"
"e3811d2aec4ed02e251965ebff8e7005f2a934eee09ed1705d4114a3ad794d30"
"abdd781b46b55562569bd83dff8394fde880872c98b7e3fe93927e8ffde4a226"
"e7f9b79a3452be9dae04f4316ea8f158a9e9b188e8cb4c300902a6d688e0c839"
"9a254a4f2547821a96bc0b6e030e791b63c0767003aa54e2d1e113b0223af838"
"95dd939fb293296286b95a38ee6946ab0d47bb59340263bd74409ac5b6c38b99"
"b902296a0820b6293b7c2754b630c8d0663424ffbab7f1abc14c349037a567fc"
"e0377a519819aff86d09fcb289619e731a4243c1301c31f88e429f130e23b53b"
"476647f4e1d8a8fc03937b874cf5c200dca69eb61dba8333baa31b42a1be690c"
"81d4ea29bf9e8bc58f359873c6b2ad60d0025c0d7bd583f3874f324edc3a3107"
"04e6bb2c323bd323ef0ac7020e93d6714f682872b34fffe5234e62067c4fac25"
"39ae1c1b4673c52700cbc283ec78e4625f672bcf8b046686764b8bcef218fa6b"
"27022dd56f0b68e08ce4089947c201c1308f618d53a304555a6b122f688bf5ad"
#"2c2bb011e24eaf7a4604a5496c024776e2db026bfc11e8f5c8748ad355655353"
"3a25007e335accd14c549de4ddf8d0db88818fff9e61fdbd98f12d72d4da0a8f"
"973cef8dff0b21df86b5d2895afe22f91d54ff50e8558dc992fa9e6d423ac659"
"c1ecd90ff6a6480ad6deac5da50cd9bde2b3f2ed2d8224d9d3eaf1ba408e9344"
"420ceb78ec2113ba57e70195016111def9bb940d6d23ff17296684e9d37652bc"
"d251899b6ff8f571cdf358dc6a8cbeb2442cb22d0a25a81472454c0f00ab5d20"
"0599183ba715f2dcee156588e615309c498f97fa8d17b4623aae9fe9780a9d8d"
"d0e1887c7023e979e22af479f93c169de1e7423a950ce06fac315812927ab36c"
"1a911c7717b345a69fbd164b9ee8453780f1a9eb454d8e5eb9a66aac264dc508"
"e8a46742f918be8e22c9d53e5e074c338b71713b88cb2b12ef59c54fe19496c3"
"e091f21739a33f0d8b8e9d20142e78ceafc3f957f766585c288c76f68cc2e780"
"15ce2e328a70b2db141edc094abb33d11f3b2788d6eef2b012f62af9666bb45f"
"19612c2d4f23d82aaf8cad73a49d85cb78e3701734b675f9c46911436e18ca69"
"098677594f0f078dcff86b6a578afd450ef6506a0e2676fe46038789aceb2a89"
"ade4e4c7696146d20ec14297da5073a6911b9fca05df5886f3a3ed12e0caa54c"
"4eeb5ca504a137349a779203f1fd887c1da2de4853b6590526cf453ab628ca90"
"b7a0e3576d2f2047fa4f7859314b20b567404f1a408892f01395b552c3abbf6c"
"ffe0e852cdf836f6e367f05676e73e400b12eeef24747b8ba748f3ffaf907db8"
"b44dbece123916d41c8cbb9dd063f88f4eaf0c092220248673983224ab3cac59"
"9c7d03291ee6db2117629b355585d0d2510b4ebfe6f0d6896bcff9df4bc8dfd5"
"ea0d2d9460ec36c599926a4463c8845abae3bf15aa31381be0def38bf118849c"
# "4bba416791003fb689db8e9ebc68c15eac2951be98c4c5b9d09c40f202748d23"
# ML
"3e2e592685fe7eb4448c2b3123e4cb477249795063623b50e4fc1e0e0f98c990"
"1f898cf877abf97a9ef5e86dcef181cb6339a35c45365f0391447d8e4f952d47"
"4e9ea842fd1faf37bebfe5ff80cbdd78f98a52f156fdf1be214ba837283eeccf"
"0fe5c48eedb4735c225cfcc54d1c9847123f9252e7f81f5c66242f79e43a1a14"
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
	egz "${srcdir}/openmp-extras-dev_15.54.0.50401-84~22.04_amd64.deb"
	egz "${srcdir}/rocm-llvm_15.0.0.22465.50401-84~22.04_amd64.deb"
	exz "${srcdir}/rocblas_2.46.0.50401-84~22.04_amd64.deb"
	exz "${srcdir}/rocblas-dev_2.46.0.50401-84~22.04_amd64.deb"
	exz "${srcdir}/hipblas_0.53.0.50401-84~22.04_amd64.deb"
	exz "${srcdir}/hipblas-dev_0.53.0.50401-84~22.04_amd64.deb"
	exz "${srcdir}/rocprim-dev_2.10.9.50401-84~22.04_amd64.deb"
	exz "${srcdir}/hipcub-dev_2.10.12.50401-84~22.04_amd64.deb"
	exz "${srcdir}/rocfft_1.0.20.50401-84~22.04_amd64.deb"
	exz "${srcdir}/rocfft-dev_1.0.20.50401-84~22.04_amd64.deb"
	exz "${srcdir}/hipfft_1.0.10.50401-84~22.04_amd64.deb"
	exz "${srcdir}/hipfft-dev_1.0.10.50401-84~22.04_amd64.deb"
	#exz "${srcdir}/hipfort_0.4.0.50401-84~22.04_amd64.deb"
	exz "${srcdir}/hipfort-dev_0.4.0.50401-84~22.04_amd64.deb"
	exz "${srcdir}/hipsolver_1.6.0.50401-84~22.04_amd64.deb"
	exz "${srcdir}/hipsolver-dev_1.6.0.50401-84~22.04_amd64.deb"
	egz "${srcdir}/hipify-clang_15.0.0.50401-84~22.04_amd64.deb"
	exz "${srcdir}/rocsparse_2.3.3.50401-84~22.04_amd64.deb"
	exz "${srcdir}/rocsparse-dev_2.3.3.50401-84~22.04_amd64.deb"
	exz "${srcdir}/hipsparse_2.3.3.50401-84~22.04_amd64.deb"
	exz "${srcdir}/hipsparse-dev_2.3.3.50401-84~22.04_amd64.deb"
	exz "${srcdir}/miopen-hip_2.19.0.50401-84~22.04_amd64.deb"
	exz "${srcdir}/miopen-hip-dev_2.19.0.50401-84~22.04_amd64.deb"
	exz "${srcdir}/rccl_2.13.4.50401-84~22.04_amd64.deb"
	exz "${srcdir}/rccl-dev_2.13.4.50401-84~22.04_amd64.deb"
	exz "${srcdir}/rocrand_2.10.9.50401-84~22.04_amd64.deb"
	exz "${srcdir}/rocrand-dev_2.10.9.50401-84~22.04_amd64.deb"
	exz "${srcdir}/rocalution_2.1.3.50401-84~22.04_amd64.deb"
	exz "${srcdir}/rocalution-dev_2.1.3.50401-84~22.04_amd64.deb"	
	egz "${srcdir}/rocm-hip-libraries_5.4.1.50401-84~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime-dev_5.4.1.50401-84~22.04_amd64.deb"	
	exz "${srcdir}/rocsolver_3.20.0.50401-84~22.04_amd64.deb"
	exz "${srcdir}/rocsolver-dev_3.20.0.50401-84~22.04_amd64.deb"	
	exz "${srcdir}/rocthrust-dev_2.10.9.50401-84~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-sdk_5.4.1.50401-84~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-sdk_5.4.1.50401-84~22.04_amd64.deb"
	exz "${srcdir}/rocwmma-dev_0.7.0.50401-84~22.04_amd64.deb"
	# egz "${srcdir}//rocm-developer-tools_5.4.1.50401-84~22.04_amd64.deb"
	egz "${srcdir}/rocm-ml-libraries_5.4.1.50401-84~22.04_amd64.deb"	
	egz "${srcdir}/rocm-ml-sdk_5.4.1.50401-84~22.04_amd64.deb"
	
	mv "${srcdir}/opt/" "${pkgdir}/"
	# mkdir -p "${pkgdir}/opt/rocm-5.4.1/hsa"
	# ln -s "/opt/rocm-5.4.1/include/hsa" "$pkgdir/opt/rocm-5.4.1/hsa/include"
}
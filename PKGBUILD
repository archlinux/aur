# Release notes https://docs.amd.com/bundle/ROCm-Release-Notes-v5.3.3/page/About_This_Document.html
amdgpu_install='22.40.0.50303'
amdgpu_version='22.40.0'
rocm_version='50303'
amdgpu_build_id='1504718.22.04'
rocm_build_id='99~22.04'
amdgpu_repo='https://repo.radeon.com/amdgpu/5.3.3/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/5.3.3'
opencl_lib='opt/rocm-5.3.3/opencl/lib'
rocm_lib='opt/rocm-5.3.3/lib'
hip_lib='opt/rocm-5.3.3/hip/lib/'
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
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/o/openmp-extras-dev/openmp-extras-dev_15.53.0.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/rocm-llvm/rocm-llvm_15.0.0.22414.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/rocblas/rocblas_2.45.0.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/rocblas-dev/rocblas-dev_2.45.0.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/rocsolver/rocsolver_3.19.0.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/rocsolver-dev/rocsolver-dev_3.19.0.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/h/hipblas/hipblas_0.52.0.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/h/hipblas-dev/hipblas-dev_0.52.0.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/rocprim-dev/rocprim-dev_2.10.9.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/h/hipcub-dev/hipcub-dev_2.10.12.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/rocfft/rocfft_1.0.18.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/rocfft-dev/rocfft-dev_1.0.18.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/h/hipfft/hipfft_1.0.9.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/h/hipfft-dev/hipfft-dev_1.0.9.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/h/hipfort/hipfort_0.4.0.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/h/hipfort-dev/hipfort-dev_0.4.0.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/h/hipify-clang/hipify-clang_15.0.0.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/rocsparse/rocsparse_2.3.3.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/rocsparse-dev/rocsparse-dev_2.3.3.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/h/hipsparse/hipsparse_2.3.2.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/h/hipsparse-dev/hipsparse-dev_2.3.2.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/rccl/rccl_2.12.12.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/rccl-dev/rccl-dev_2.12.12.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/rocrand/rocrand_2.10.9.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/rocrand-dev/rocrand-dev_2.10.9.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/rocalution/rocalution_2.1.2.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/rocalution-dev/rocalution-dev_2.1.2.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/rocm-hip-libraries/rocm-hip-libraries_5.3.3.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/rocm-hip-runtime-dev/rocm-hip-runtime-dev_5.3.3.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/rocthrust-dev/rocthrust-dev_2.10.9.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/rocm-hip-sdk/rocm-hip-sdk_5.3.3.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/rocm-opencl-sdk/rocm-opencl-sdk_5.3.3.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/rocwmma-dev/rocwmma-dev_0.7.0.50303-99~22.04_amd64.deb"
#"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/rocm-developer-tools/rocm-developer-tools_5.3.3.50303-99~22.04_amd64.deb"
# ML
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/m/miopen-hip/miopen-hip_2.18.0.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/m/miopen-hip-dev/miopen-hip-dev_2.18.0.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/rocm-ml-libraries/rocm-ml-libraries_5.3.3.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/rocm-ml-sdk/rocm-ml-sdk_5.3.3.50303-99~22.04_amd64.deb"
)

sha256sums=(
"b8a443679511895837d1f2fd59df5d91fa94898e3875f1710b0d752cc681bdc8"
"8154bf7a5e74d7ce5df048c5be84fe5173d5f80926698571d39a842c85093fb1"
"80efbe531655a46a37d2c57d128dda09d0f0b302772a357273fddd1489d86cf2"
"61953c5c6fdae940296688773952e7a94957de91b67d5288797a5a386cc3b29f"
"8ef00058d56e8c60ffd91e051cdb963f1e8aeefc7bc0b802b47c17bd48277d95"
"0afd3a1188ca3a18fb440821bcecb46bda1d5e555fc1c6dfb8b6205f0a1bab14"
"a058794b5d10faa2dafd082800b2914d2f0e46eab96bf19d0af4e8435d7267e7"
"020b902629d86f579f3ba873d1734f3dc8906745dc44b013acbe5fbcd3763426"
"668abdd0321be2eab3427d9324f1d48fa3eb79c87deee22928ef35bb7bcf6a4f"
"e6038e398011b91aaaa4b04907f4c2f4ee9c38e16642180dd95fe46fee6d4c00"
"aedd255713b85211dab647d62812cb3d8ed5230641f26a173503cd2594f62c2c"
"bfa26e57034486cd1a86dec25db53c56102a35352b5e2d4ee24b60565520c63e"
"106b54de5d89775d6078cd5b3d47be24525b518d46cb58cb8cc908b7dcb918a9"
"5ef6ba20730ad67b3981a22a6e3d21622f69daf120e57729ae395adc660a0c9e"
"2c2bb011e24eaf7a4604a5496c024776e2db026bfc11e8f5c8748ad355655353"
"c0968bac00d10b03713068d85489da01cac3ce7d6f69aae444ce661ee60bb361"
"8c6c8b16f7fef841febce1313f6556012b96ae07c0fa5f58e9cae4ef275eeb3b"
"75ed1ee080e23c90cdda0c16aeedb8abffe4bc29362534094e89c4453ab236f5"
"5da7c409d62bec2ebdc7e5de1838b97e717975ce440aab7554da332c8e614f68"
"e9a8744126c784a844caab31539e70e7676187ac83ae6f094ca3e229e2d90695"
"ea8d5f050fb5f3679dbc05cbcf2c33c3686e91e33a7bb103e2f95118372e969f"
"53ad86e8e3ff7117f3b46de77df05e3f0385a966ff36c1e7e954a2d3d7478e11"
"5d978cccd15f45f6d21e811d187caf1ffc73cd677366f5284fcf6e412eb6a685"
"45fb542e24b2f0995ffb831b04225e30828732ff9b4a84f0efee94cde7a8de05"
"ac2f7712f0a00785fd737cba7730f6ba151f1da678cf976887e9b7a05c36bce9"
"02a250aea21b8a664ac72376d4839a9b9d030ef40948accf7ba5d9e677a06e7c"
"9c0ef7b9eeb52733374b91e99945a23f300bb7087c06761e44213bb0f2b1d2f7"
"6947c5ff34b64c119676919626a1673cec3a02e8f25690060f288808b4ec4b64"
"7951131e26d2927964ce627fa68c005a15bb8995c800efd742e897cd0a06296d"
"44308562aad4678a2f82be8c11efc685950b556e101227cccc8d3b086b7e5f6e"
"87b02e6673c49c77b2c476ed650eac0f344ebca97fb9c0708282edc7cf620947"
"aef6ae79f311bfbfce7734ab28f38ac4115dd8121405d1a1329243daeb8d08b9"
"4624abd3c0f427927810e61045b47089b6b7488cfcb95795d4daef0075f74482"
# "4bba416791003fb689db8e9ebc68c15eac2951be98c4c5b9d09c40f202748d23"
# ML
"7fd974eeeedcd09a319cdeea28658b9d25e824de859f5407314c5e8932b861b1"
"473307ddc3e90778e29e618e423b97f2d3fac8683736d3744080bd129c885138"
"c68de77fec54f9e17127a19f89541de6f648380689b3a4c83d343a58f1b7c874"
"e9b9b31901dcf1220b01fb9678710b669a6a1855ae2eb1398381f72b42405cbd"
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
	egz "${srcdir}/openmp-extras-dev_15.53.0.50303-99~22.04_amd64.deb"
	egz "${srcdir}/rocm-llvm_15.0.0.22414.50303-99~22.04_amd64.deb"
	exz "${srcdir}/rocblas_2.45.0.50303-99~22.04_amd64.deb"
	exz "${srcdir}/rocblas-dev_2.45.0.50303-99~22.04_amd64.deb"
	exz "${srcdir}/hipblas_0.52.0.50303-99~22.04_amd64.deb"
	exz "${srcdir}/hipblas-dev_0.52.0.50303-99~22.04_amd64.deb"
	exz "${srcdir}/rocprim-dev_2.10.9.50303-99~22.04_amd64.deb"
	exz "${srcdir}/hipcub-dev_2.10.12.50303-99~22.04_amd64.deb"
	exz "${srcdir}/rocfft_1.0.18.50303-99~22.04_amd64.deb"
	exz "${srcdir}/rocfft-dev_1.0.18.50303-99~22.04_amd64.deb"
	exz "${srcdir}/hipfft_1.0.9.50303-99~22.04_amd64.deb"
	exz "${srcdir}/hipfft-dev_1.0.9.50303-99~22.04_amd64.deb"
	exz "${srcdir}/hipfort_0.4.0.50303-99~22.04_amd64.deb"
	exz "${srcdir}/hipfort-dev_0.4.0.50303-99~22.04_amd64.deb"
	egz "${srcdir}/hipify-clang_15.0.0.50303-99~22.04_amd64.deb"
	exz "${srcdir}/rocsparse_2.3.3.50303-99~22.04_amd64.deb"
	exz "${srcdir}/rocsparse-dev_2.3.3.50303-99~22.04_amd64.deb"
	exz "${srcdir}/hipsparse_2.3.2.50303-99~22.04_amd64.deb"
	exz "${srcdir}/hipsparse-dev_2.3.2.50303-99~22.04_amd64.deb"
	exz "${srcdir}/miopen-hip_2.18.0.50303-99~22.04_amd64.deb"
	exz "${srcdir}/miopen-hip-dev_2.18.0.50303-99~22.04_amd64.deb"
	exz "${srcdir}/rccl_2.12.12.50303-99~22.04_amd64.deb"
	exz "${srcdir}/rccl-dev_2.12.12.50303-99~22.04_amd64.deb"
	exz "${srcdir}/rocrand_2.10.9.50303-99~22.04_amd64.deb"
	exz "${srcdir}/rocrand-dev_2.10.9.50303-99~22.04_amd64.deb"
	exz "${srcdir}/rocalution_2.1.2.50303-99~22.04_amd64.deb"
	exz "${srcdir}/rocalution-dev_2.1.2.50303-99~22.04_amd64.deb"	
	egz "${srcdir}/rocm-hip-libraries_5.3.3.50303-99~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime-dev_5.3.3.50303-99~22.04_amd64.deb"	
	exz "${srcdir}/rocsolver_3.19.0.50303-99~22.04_amd64.deb"
	exz "${srcdir}/rocsolver-dev_3.19.0.50303-99~22.04_amd64.deb"	
	exz "${srcdir}/rocthrust-dev_2.10.9.50303-99~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-sdk_5.3.3.50303-99~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-sdk_5.3.3.50303-99~22.04_amd64.deb"
	exz "${srcdir}/rocwmma-dev_0.7.0.50303-99~22.04_amd64.deb"
	# egz "${srcdir}//rocm-developer-tools_5.3.3.50303-99~22.04_amd64.deb"
	egz "${srcdir}/rocm-ml-libraries_5.3.3.50303-99~22.04_amd64.deb"	
	egz "${srcdir}/rocm-ml-sdk_5.3.3.50303-99~22.04_amd64.deb"
	
	mv "${srcdir}/opt/" "${pkgdir}/"
	# mkdir -p "${pkgdir}/opt/rocm-5.3.3/hsa"
	# ln -s "/opt/rocm-5.3.3/include/hsa" "$pkgdir/opt/rocm-5.3.3/hsa/include"
}
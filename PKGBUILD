# Release notes https://docs.amd.com/bundle/ROCm-Release-Notes-v5.4/page/About_This_Document.html
amdgpu_repo='https://repo.radeon.com/amdgpu/5.4/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/5.4'
opencl_lib='opt/rocm-5.4.0/opencl/lib'
rocm_lib='opt/rocm-5.4.0/lib'
hip_lib='opt/rocm-5.4.0/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd-dev
pkgdesc="OpenCL SDK / HIP SDK / ROCM Compiler. This package needs at least 10GB of space."
pkgver=5.4.0
pkgrel=1
epoch=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('opencl-amd')
provides=('rocm-llvm' 'rocblas' 'rocblas-dev' 'rocsolver' 'rocsolver-dev' 'hipblas' 'hipblas-dev' 'rocprim-dev' 'hipcub-dev' 'rocfft' 'rocfft-dev' 'hipfft' 'hipfft-dev' 'hipfort' 'hipfort-dev' 
	'hipify-clang' 'hipsolver' 'hipsolver-dev' 'rocsparse' 'rocsparse-dev' 'hipsparse' 'hipsparse-dev' 'rccl' 'rccl-dev' 'rocrand' 'rocrand-dev' 'rocalution' 'rocalution-dev' 'rocm-hip-libraries' 
	'rocm-hip-runtime-dev' 'rocthrust-dev' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma-dev' 'rocm-developer-tools' 'miopen-hip' 'miopen-hip-dev' 'rocm-ml-libraries' 'rocm-ml-sdk')

source=(
"https://repo.radeon.com/rocm/apt/5.4/pool/main/o/openmp-extras-dev/openmp-extras-dev_15.54.0.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/rocm-llvm/rocm-llvm_15.0.0.22465.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/rocblas/rocblas_2.46.0.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/rocblas-dev/rocblas-dev_2.46.0.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/rocsolver/rocsolver_3.20.0.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/rocsolver-dev/rocsolver-dev_3.20.0.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/h/hipblas/hipblas_0.53.0.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/h/hipblas-dev/hipblas-dev_0.53.0.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/rocprim-dev/rocprim-dev_2.10.9.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/h/hipcub-dev/hipcub-dev_2.10.12.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/rocfft/rocfft_1.0.19.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/rocfft-dev/rocfft-dev_1.0.19.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/h/hipfft/hipfft_1.0.10.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/h/hipfft-dev/hipfft-dev_1.0.10.50400-72~22.04_amd64.deb"
#"https://repo.radeon.com/rocm/apt/5.4/pool/main/h/hipfort/hipfort_0.4.0.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/h/hipfort-dev/hipfort-dev_0.4.0.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/h/hipsolver/hipsolver_1.6.0.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/h/hipsolver-dev/hipsolver-dev_1.6.0.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/h/hipify-clang/hipify-clang_15.0.0.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/rocsparse/rocsparse_2.3.3.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/rocsparse-dev/rocsparse-dev_2.3.3.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/h/hipsparse/hipsparse_2.3.3.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/h/hipsparse-dev/hipsparse-dev_2.3.3.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/rccl/rccl_2.13.4.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/rccl-dev/rccl-dev_2.13.4.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/rocrand/rocrand_2.10.9.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/rocrand-dev/rocrand-dev_2.10.9.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/rocalution/rocalution_2.1.3.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/rocalution-dev/rocalution-dev_2.1.3.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/rocm-hip-libraries/rocm-hip-libraries_5.4.0.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/rocm-hip-runtime-dev/rocm-hip-runtime-dev_5.4.0.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/rocthrust-dev/rocthrust-dev_2.10.9.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/rocm-hip-sdk/rocm-hip-sdk_5.4.0.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/rocm-opencl-sdk/rocm-opencl-sdk_5.4.0.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/rocwmma-dev/rocwmma-dev_0.7.0.50400-72~22.04_amd64.deb"
#"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/rocm-developer-tools/rocm-developer-tools_5.4.0.50400-72~22.04_amd64.deb"
# ML
"https://repo.radeon.com/rocm/apt/5.4/pool/main/m/miopen-hip/miopen-hip_2.19.0.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/m/miopen-hip-dev/miopen-hip-dev_2.19.0.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/rocm-ml-libraries/rocm-ml-libraries_5.4.0.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/rocm-ml-sdk/rocm-ml-sdk_5.4.0.50400-72~22.04_amd64.deb"
)

sha256sums=(
"641f4eda63b1df5c98fac181c4f5f689e25e7e55a50e3de6b66cff64286f8ffa"
"893a29ce036f4f1b031edfa3f1fd64bcdaf9b1a99a6b9c9ab95fdc9a804ce167"
"0444d9f45ca6a6333cf93a24aa692614fcc91d02b3aeacc3964e681348c0a444"
"a9dfd3d25ab8d35f36167e05a393fab463203d1176389722dcb212935a566bfe"
"0fe0f8818ab8722cfeb06a4c01caf61110c07d3d3e34b85a9706eecc885cbbec"
"998799320a331f328941a9a5a6a985601bab11df9b8894b13f6b6af16ac26fd9"
"273e8c10d49871bb9d5684b3b183aa9ff18b6f7a1790df4e06bd21765802705c"
"698154f5d0af0de60bfc64b2d424bd59b3bd5f3639f6efa971bbb21dbf861e51"
"febb5d9c0fb6b36d9ed6a8e5e897cf3cc72d0e0f5de4bbf28f57104e7800e4e1"
"44993d36db3bd4e2951e33c49c8df4c00c355dca10e2d75b6a6e0d22b1ec532e"
"b5642a61b1167f896de5cd0f21dfb8b69c430423e2aa9d5c79b045494c28377c"
"e25492fb675dab388c8bc3250402ac47508f3fd83e4208e80dd19b4eb44ab9f0"
"5c4e3e67ed01aafc5b96097f6d3fc23119b412e7f4c9a8c76911781c292d3781"
"dff52f8fbe6eab0815d52e8b9c4107c1110d81b460891357c3cfdd09f46b6a35"
#"2c2bb011e24eaf7a4604a5496c024776e2db026bfc11e8f5c8748ad355655353"
"2dd276c479209dbc0f18462bc2c3baf1076455470f00ec0bde27f01c59a0c8f5"
"b11615ed7cdf88b04751bcc3e74ec96a8dc662a7cf1c3c96895a08787250d2db"
"8abfbcdbd1c975253106ce4591fec92d8bc5ebaf9176f4c686b25868ca7719c1"
"53060cfca99f204829818876753435f6f6d50155f27068c8201be52ec3534637"
"e2371bd09638ae3a32d7dc933d8716eda652f2bc5714edf23ce7dfd970dac0d0"
"40f310cdd23a1d2d1b3bce43737726fe708541dc1a1eeb818404b7e18e207ffc"
"250f0d55c8bfd38c3bc7b1549a70abda6f4ac6f51519145b803f716df8ecc66d"
"ee01c64daa67225be4c150745e02ea3029e8e116e20cc88a24a419d0cb9defa0"
"a6d2a9ed113bea9eda8e7cf5f1ccca5112246526570e625960ed9bca1d98b197"
"fcf3be6dcef05bdb3ad85106b573548e08a233f387710f6efbb466d7339931c8"
"ed027809981ed375c898b2fd4e06730ee861013bb0c82feff97577a8b612b3ac"
"41a9e2021fbcb6f216b7fabd6d6bb21143be1c29fe908a3601b4785297d4081c"
"37eebb9119ffb244e7a448bfe9a19efdd1f58739a57a415ebc1c19f4799c7318"
"c2d820c40339f5f3f08d0577cbbcc288de52dd21f5329641bb6debc78cf812c9"
"72955bb6c91fe400103dba75faf4a0422c76737a31ca769c880b4c638b2b42cb"
"d94bad07286bace72e4f0e6e986163b95cf2e5ec07810a46f1d448fd16794b56"
"41f0569dc1acdb7703ad0c8027ba93e19d67d38bcad5e6f433e7427cd0d378b9"
"8a42172cc480552d73e2afd0f5a3ff69d79c76a4d8c44a910ff80a0823548ffc"
"c5d83b50da2f8ac83db1c9cf089a8332010224c9a6ae76a681d355e4d11d3d6d"
"da53d78fc8c16316dc3f5293bb45b0a125e7a2a2947a8ecd6a47fa4f6ea06ef3"
# "4bba416791003fb689db8e9ebc68c15eac2951be98c4c5b9d09c40f202748d23"
# ML
"0c1e5378eb8cb5c7ad5c636ff39b2eb0beca8d5e7004f21fe3e30a9f46808be1"
"457df00bf856998a09431af85555c597c7ada2cbc041c8ad568bebdb3fa8982e"
"f6f98de01a6ccb52d2631e5448199eb8852721342b4847e986fe9201f17f954a"
"47d684c607ef58067fabea21bacedb77993e30f6578fd48cfd7016372e024e3e"
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
	egz "${srcdir}/openmp-extras-dev_15.54.0.50400-72~22.04_amd64.deb"
	egz "${srcdir}/rocm-llvm_15.0.0.22465.50400-72~22.04_amd64.deb"
	exz "${srcdir}/rocblas_2.46.0.50400-72~22.04_amd64.deb"
	exz "${srcdir}/rocblas-dev_2.46.0.50400-72~22.04_amd64.deb"
	exz "${srcdir}/hipblas_0.53.0.50400-72~22.04_amd64.deb"
	exz "${srcdir}/hipblas-dev_0.53.0.50400-72~22.04_amd64.deb"
	exz "${srcdir}/rocprim-dev_2.10.9.50400-72~22.04_amd64.deb"
	exz "${srcdir}/hipcub-dev_2.10.12.50400-72~22.04_amd64.deb"
	exz "${srcdir}/rocfft_1.0.19.50400-72~22.04_amd64.deb"
	exz "${srcdir}/rocfft-dev_1.0.19.50400-72~22.04_amd64.deb"
	exz "${srcdir}/hipfft_1.0.10.50400-72~22.04_amd64.deb"
	exz "${srcdir}/hipfft-dev_1.0.10.50400-72~22.04_amd64.deb"
	#exz "${srcdir}/hipfort_0.4.0.50400-72~22.04_amd64.deb"
	exz "${srcdir}/hipfort-dev_0.4.0.50400-72~22.04_amd64.deb"
	exz "${srcdir}/hipsolver_1.6.0.50400-72~22.04_amd64.deb"
	exz "${srcdir}/hipsolver-dev_1.6.0.50400-72~22.04_amd64.deb"
	egz "${srcdir}/hipify-clang_15.0.0.50400-72~22.04_amd64.deb"
	exz "${srcdir}/rocsparse_2.3.3.50400-72~22.04_amd64.deb"
	exz "${srcdir}/rocsparse-dev_2.3.3.50400-72~22.04_amd64.deb"
	exz "${srcdir}/hipsparse_2.3.3.50400-72~22.04_amd64.deb"
	exz "${srcdir}/hipsparse-dev_2.3.3.50400-72~22.04_amd64.deb"
	exz "${srcdir}/miopen-hip_2.19.0.50400-72~22.04_amd64.deb"
	exz "${srcdir}/miopen-hip-dev_2.19.0.50400-72~22.04_amd64.deb"
	exz "${srcdir}/rccl_2.13.4.50400-72~22.04_amd64.deb"
	exz "${srcdir}/rccl-dev_2.13.4.50400-72~22.04_amd64.deb"
	exz "${srcdir}/rocrand_2.10.9.50400-72~22.04_amd64.deb"
	exz "${srcdir}/rocrand-dev_2.10.9.50400-72~22.04_amd64.deb"
	exz "${srcdir}/rocalution_2.1.3.50400-72~22.04_amd64.deb"
	exz "${srcdir}/rocalution-dev_2.1.3.50400-72~22.04_amd64.deb"	
	egz "${srcdir}/rocm-hip-libraries_5.4.0.50400-72~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime-dev_5.4.0.50400-72~22.04_amd64.deb"	
	exz "${srcdir}/rocsolver_3.20.0.50400-72~22.04_amd64.deb"
	exz "${srcdir}/rocsolver-dev_3.20.0.50400-72~22.04_amd64.deb"	
	exz "${srcdir}/rocthrust-dev_2.10.9.50400-72~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-sdk_5.4.0.50400-72~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-sdk_5.4.0.50400-72~22.04_amd64.deb"
	exz "${srcdir}/rocwmma-dev_0.7.0.50400-72~22.04_amd64.deb"
	# egz "${srcdir}//rocm-developer-tools_5.4.0.50400-72~22.04_amd64.deb"
	egz "${srcdir}/rocm-ml-libraries_5.4.0.50400-72~22.04_amd64.deb"	
	egz "${srcdir}/rocm-ml-sdk_5.4.0.50400-72~22.04_amd64.deb"
	
	mv "${srcdir}/opt/" "${pkgdir}/"
	# mkdir -p "${pkgdir}/opt/rocm-5.4.0/hsa"
	# ln -s "/opt/rocm-5.4.0/include/hsa" "$pkgdir/opt/rocm-5.4.0/hsa/include"
}
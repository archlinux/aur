# Release notes https://docs.amd.com/bundle/ROCm-Release-Notes-v5.5/page/About_This_Document.html
amdgpu_repo='https://repo.radeon.com/amdgpu/5.5/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/5.5'
opencl_lib='opt/rocm-5.5.0/opencl/lib'
rocm_lib='opt/rocm-5.5.0/lib'
hip_lib='opt/rocm-5.5.0/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd-dev
pkgdesc="OpenCL SDK / HIP SDK / ROCM Compiler. This package needs at least 10GB of space."
pkgver=5.5.0
pkgrel=1
epoch=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('opencl-amd')
provides=('rocm-llvm' 'rocblas' 'rocblas-dev' 'rocsolver' 'rocsolver-dev' 'hipblas' 'hipblas-dev' 'rocprim' 'rocprim-dev' 'hipcub' 'hipcub-dev' 'rocfft' 'rocfft-dev' 'hipfft' 'hipfft-dev' 'hipfort' 'hipfort-dev' 
	'hipify-clang' 'hipsolver' 'hipsolver-dev' 'rocsparse' 'rocsparse-dev' 'hipsparse' 'hipsparse-dev' 'rccl' 'rccl-dev' 'rocrand' 'rocrand-dev' 'rocalution' 'rocalution-dev' 'rocm-hip-libraries' 
	'rocm-hip-runtime-dev' 'rocthrust' 'rocthrust-dev' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma-dev' 'rocm-developer-tools' 'miopen' 'miopen-hip' 'miopen-hip-dev' 'rocm-ml-libraries' 'rocm-ml-sdk')
conflicts=('rocm-llvm' 'rocblas' 'rocblas-dev' 'rocsolver' 'rocsolver-dev' 'hipblas' 'hipblas-dev' 'rocprim' 'rocprim-dev' 'hipcub' 'hipcub-dev' 'rocfft' 'rocfft-dev' 'hipfft' 'hipfft-dev' 'hipfort' 'hipfort-dev' 
	'hipify-clang' 'hipsolver' 'hipsolver-dev' 'rocsparse' 'rocsparse-dev' 'hipsparse' 'hipsparse-dev' 'rccl' 'rccl-dev' 'rocrand' 'rocrand-dev' 'rocalution' 'rocalution-dev' 'rocm-hip-libraries' 
	'rocm-hip-runtime-dev' 'rocthrust' 'rocthrust-dev' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma-dev' 'rocm-developer-tools' 'miopen' 'miopen-hip' 'miopen-hip-dev' 'rocm-ml-libraries' 'rocm-ml-sdk')

source=(
"https://repo.radeon.com/rocm/apt/5.5/pool/main/o/openmp-extras-dev/openmp-extras-dev_15.55.0.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/rocm-llvm/rocm-llvm_16.0.0.23144.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/rocblas/rocblas_2.47.0.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/rocblas-dev/rocblas-dev_2.47.0.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/rocsolver/rocsolver_3.21.0.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/rocsolver-dev/rocsolver-dev_3.21.0.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/h/hipblas/hipblas_0.54.0.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/h/hipblas-dev/hipblas-dev_0.54.0.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/rocprim-dev/rocprim-dev_2.10.9.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/h/hipcub-dev/hipcub-dev_2.10.12.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/rocfft/rocfft_1.0.21.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/rocfft-dev/rocfft-dev_1.0.21.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/h/hipfft/hipfft_1.0.11.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/h/hipfft-dev/hipfft-dev_1.0.11.50500-63~22.04_amd64.deb"
#"https://repo.radeon.com/rocm/apt/5.5/pool/main/h/hipfort/hipfort_0.4.0.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/h/hipfort-dev/hipfort-dev_0.4.0.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/h/hipsolver/hipsolver_1.7.0.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/h/hipsolver-dev/hipsolver-dev_1.7.0.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/h/hipify-clang/hipify-clang_16.0.0.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/rocsparse/rocsparse_2.5.1.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/rocsparse-dev/rocsparse-dev_2.5.1.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/h/hipsparse/hipsparse_2.3.6.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/h/hipsparse-dev/hipsparse-dev_2.3.6.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/rccl/rccl_2.15.5.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/rccl-dev/rccl-dev_2.15.5.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/rocrand/rocrand_2.10.16.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/rocrand-dev/rocrand-dev_2.10.16.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/rocalution/rocalution_2.1.8.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/rocalution-dev/rocalution-dev_2.1.8.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/rocm-hip-libraries/rocm-hip-libraries_5.5.0.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/rocm-hip-runtime-dev/rocm-hip-runtime-dev_5.5.0.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/rocthrust-dev/rocthrust-dev_2.10.9.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/rocm-hip-sdk/rocm-hip-sdk_5.5.0.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/rocm-opencl-sdk/rocm-opencl-sdk_5.5.0.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/rocwmma-dev/rocwmma-dev_0.7.0.50500-63~22.04_amd64.deb"
#"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/rocm-developer-tools/rocm-developer-tools_5.4.3.50500-63~22.04_amd64.deb"
# ML
"https://repo.radeon.com/rocm/apt/5.5/pool/main/m/miopen-hip/miopen-hip_2.19.0.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/m/miopen-hip-dev/miopen-hip-dev_2.19.0.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/rocm-ml-libraries/rocm-ml-libraries_5.5.0.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/rocm-ml-sdk/rocm-ml-sdk_5.5.0.50500-63~22.04_amd64.deb"
)

sha256sums=(
"502752f2fc124e57a8da8fe023396441f3dde7975e9e656e6bfeb90607f4c571"
"d2d01d8a30d2d87a8f2dc1b4403d8b17d88102409c089c8089d3068736d7ebe5"
"442be908e7ff848b049952945232d72daaeb0bb4737b19bc26097d11af60a291"
"91d712a2ccaf4532eab3ebd57fe6056fe91a3dbff9b185fa989d44badacd55a4"
"825da047fc08b6c292d4f4f4bb8c639124e643d218f0b0953740e4c97e0da591"
"49ead1c273aa3eec758761da8f7d2c1f7303273f90fdd9efd721b785c2b9c543"
"88e2d40d0ea0b80ef360d8164c796416692184256dd69a976d630ff88ea35e7b"
"32938624d28113f1ac4416564c245a6e80f914e8b20f473918acb0af2002a288"
"b9bac4ab43407f11733d96ae480057f6c9c2ac57bfada3f79939f7ed28ad459f"
"9726c2069787e1cd6f0adf882c7d09833ba36cd14b84469599950917a758b35c"
"e89cc27a4c9a84e0250e7d7965c600c65a794f86a455bd8bd85fe638dbe44fd6"
"2b123381943835336a3b436ad3b959d82d27c3fc2d08c374a84a47e2ee11d1cd"
"806f8472baf09101a94153941300e81adc308b2e69f15fbbe79c85b858039d64"
"6347e028627aa1b87df8a15a45206d0a50c742bff0f9c02d5350a03cd2bc0332"
#"2c2bb011e24eaf7a4604a5496c024776e2db026bfc11e8f5c8748ad355655353"
"344ecce3b0573375d7434ef2c940d8e2fb4a098b24de5e922eaa9c1a89cca891"
"565039329299c7ef0c5018e2d608aa1004f8bc1d30ce00b130d413eb8c2c9b9c"
"735322cd2609073eeae3eabb141a9a5261e3e0ec5f9f4d0055f5b46a6edb7766"
"d3fab402edd84f8d40be1f2330089efdc3e33086327822ab65d6417287ad1801"
"cebcac6c6dc4fe33aa190a5d515ce43529327bab18e9897141773e96e4cb15e7"
"2d03d20f20b9a74bb0cd00b20b6cdfc595c4d0a5fda50a0556dade56bdc09610"
"b26f55f0be50a719198740cd771c7037240a7d0161dd318c013d118a52f291c7"
"9dc7eeeb899c48b8a80a2cd08ff7f4a17192c3a715c5a7fbaf1e7c4859026527"
"e6251ac72df1d4dfe2fefbc9f337d77e22f8f65c598cb86e38af87220f9f640c"
"c2bc7af1673f0ef2d5bf0fa8f47caf4498930c732daca250457602b6aae26bdd"
"76021a93979dfd02072d7de94de5892a9d41415653b1201b8fc61ede3f63e1d1"
"aa1b871e83699e2a5127483ed8123b38b82b4694b0f6491e753b99dc08e99357"
"f543c8e8ffafe803fb3e0bf1188d3158dacabaab12d6371a8479a6d45b4614a5"
"ef68fe0489cafa91a635482bb8177cadd7230df0815b0f4433372ea56477a44b"
"e9cd48fc4571447ec3961cd007d4c37f20843a0537452f009475e51bace3bb49"
"00899474f181ef049a50d2553c10dce00250f77b70d2bfa1b2a007c12554b2af"
"a0126f262e913b6c8e03b521a666a22ca3d68ba8627a047a5572bb2002f396a7"
"1264b7674f598a4f9d17d194f72cbd4196fa017c5ebd24e9cc66e03ae479fe99"
"a5815c8ef69c1d4c65706bb0bf3969676abb95c602d77809c94ae558401db1e4"
"be0b8f5672f93e413547469d47aed5cdaa4de019d1515ef92388dab8c076b8c6"
# "4bba416791003fb689db8e9ebc68c15eac2951be98c4c5b9d09c40f202748d23"
# ML
"b83798094b1092b843846d13e6ef9a618a49d522a7df523a06e771206e3bb8eb"
"a8325cf1506d70400693af26f63c8fde898693717cc808b20c799d8440229f1c"
"0d55740a9c7bb59ad556c8a0185f3cc5d42ee2a47cb0b43b21e7763252b180cc"
"b99f15684c721baf4ae29dd46d1e2dd6a8aee164b41eacceca31febf4fc9c374"
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
	egz "${srcdir}/openmp-extras-dev_15.55.0.50500-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-llvm_16.0.0.23144.50500-63~22.04_amd64.deb"
	exz "${srcdir}/rocblas_2.47.0.50500-63~22.04_amd64.deb"
	exz "${srcdir}/rocblas-dev_2.47.0.50500-63~22.04_amd64.deb"
	exz "${srcdir}/hipblas_0.54.0.50500-63~22.04_amd64.deb"
	exz "${srcdir}/hipblas-dev_0.54.0.50500-63~22.04_amd64.deb"
	exz "${srcdir}/rocprim-dev_2.10.9.50500-63~22.04_amd64.deb"
	exz "${srcdir}/hipcub-dev_2.10.12.50500-63~22.04_amd64.deb"
	exz "${srcdir}/rocfft_1.0.21.50500-63~22.04_amd64.deb"
	exz "${srcdir}/rocfft-dev_1.0.21.50500-63~22.04_amd64.deb"
	exz "${srcdir}/hipfft_1.0.11.50500-63~22.04_amd64.deb"
	exz "${srcdir}/hipfft-dev_1.0.11.50500-63~22.04_amd64.deb"
	#exz "${srcdir}/hipfort_0.4.0.50500-63~22.04_amd64.deb"
	exz "${srcdir}/hipfort-dev_0.4.0.50500-63~22.04_amd64.deb"
	exz "${srcdir}/hipsolver_1.7.0.50500-63~22.04_amd64.deb"
	exz "${srcdir}/hipsolver-dev_1.7.0.50500-63~22.04_amd64.deb"
	egz "${srcdir}/hipify-clang_16.0.0.50500-63~22.04_amd64.deb"
	exz "${srcdir}/rocsparse_2.5.1.50500-63~22.04_amd64.deb"
	exz "${srcdir}/rocsparse-dev_2.5.1.50500-63~22.04_amd64.deb"
	exz "${srcdir}/hipsparse_2.3.6.50500-63~22.04_amd64.deb"
	exz "${srcdir}/hipsparse-dev_2.3.6.50500-63~22.04_amd64.deb"
	exz "${srcdir}/miopen-hip_2.19.0.50500-63~22.04_amd64.deb"
	exz "${srcdir}/miopen-hip-dev_2.19.0.50500-63~22.04_amd64.deb"
	exz "${srcdir}/rccl_2.15.5.50500-63~22.04_amd64.deb"
	exz "${srcdir}/rccl-dev_2.15.5.50500-63~22.04_amd64.deb"
	exz "${srcdir}/rocrand_2.10.16.50500-63~22.04_amd64.deb"
	exz "${srcdir}/rocrand-dev_2.10.16.50500-63~22.04_amd64.deb"
	exz "${srcdir}/rocalution_2.1.8.50500-63~22.04_amd64.deb"
	exz "${srcdir}/rocalution-dev_2.1.8.50500-63~22.04_amd64.deb"	
	egz "${srcdir}/rocm-hip-libraries_5.5.0.50500-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime-dev_5.5.0.50500-63~22.04_amd64.deb"	
	exz "${srcdir}/rocsolver_3.21.0.50500-63~22.04_amd64.deb"
	exz "${srcdir}/rocsolver-dev_3.21.0.50500-63~22.04_amd64.deb"	
	exz "${srcdir}/rocthrust-dev_2.10.9.50500-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-sdk_5.5.0.50500-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-sdk_5.5.0.50500-63~22.04_amd64.deb"
	exz "${srcdir}/rocwmma-dev_0.7.0.50500-63~22.04_amd64.deb"
	# egz "${srcdir}/rocm-developer-tools_5.4.3.50500-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-ml-libraries_5.5.0.50500-63~22.04_amd64.deb"	
	egz "${srcdir}/rocm-ml-sdk_5.5.0.50500-63~22.04_amd64.deb"
	
	mv "${srcdir}/opt/" "${pkgdir}/"
	# mkdir -p "${pkgdir}/opt/rocm-5.5.0/hsa"
	# ln -s "/opt/rocm-5.5.0/include/hsa" "$pkgdir/opt/rocm-5.5.0/hsa/include"
}
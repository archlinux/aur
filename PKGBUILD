# Release notes https://rocm.docs.amd.com/en/latest/about/release-notes.html
amdgpu_repo='https://repo.radeon.com/amdgpu/6.2/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/6.2'
opencl_lib='opt/rocm-6.2.0/opencl/lib'
rocm_lib='opt/rocm-6.2.0/lib'
hip_lib='opt/rocm-6.2.0/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd-dev
pkgdesc="OpenCL SDK / HIP SDK / ROCM Compiler. This package needs at least 20GB of disk space."
pkgver=6.2.0
pkgrel=2
epoch=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('opencl-amd' 'suitesparse' 'blas' 'lapack')
provides=('composablekernel-dev' 'rocm-llvm' 'rocblas' 'rocblas-dev' 'rocsolver' 'rocsolver-dev' 'half' 'hipblas' 'hipblas-dev' 'hipblaslt' 'hipblaslt-dev' 'hiprand' 'hiprand-dev' 'rocprim' 'rocprim-dev' 'hipcub' 'hipcub-dev' 'rocfft' 'rocfft-dev' 'hipfft' 'hipfft-dev'
	'hipfort' 'hipfort-dev' 'hipify-clang' 'hipsolver' 'hipsolver-dev' 'rocsparse' 'rocsparse-dev' 'hipsparse' 'hipsparse-dev' 'hipsparselt' 'hipsparselt-dev' 'hiptensor' 'hiptensor-dev' 'openmp-extras-dev' 'omniperf' 'omnitrace' 'rccl' 'rccl-dev' 'rocrand' 'rocrand-dev' 'rocalution' 'rocalution-dev'
	'rocm-hip-libraries' 'rocm-hip-runtime-dev' 'rocthrust' 'rocthrust-dev' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma-dev' 'rocprofiler-sdk' 'rocm-developer-tools' 'migraphx' 'migraphx-dev' 'miopen' 'miopen-hip' 'miopen-hip-dev' 'mivisionx' 'mivisionx-dev' 'rocm-ml-libraries' 'rocm-ml-sdk' 'rpp' 'rpp-dev')
conflicts=('composablekernel-dev' 'rocm-llvm' 'rocblas' 'rocblas-dev' 'rocsolver' 'rocsolver-dev' 'hipblas' 'hipblas-dev' 'hipblaslt' 'hipblaslt-dev' 'hiprand' 'hiprand-dev' 'rocprim' 'rocprim-dev' 'hipcub' 'hipcub-dev' 'rocfft' 'rocfft-dev' 'hipfft' 'hipfft-dev'
	'hipfort' 'hipfort-dev' 'hipify-clang' 'hipsolver' 'hipsolver-dev' 'rocsparse' 'rocsparse-dev' 'hipsparse' 'hipsparse-dev' 'hipsparselt' 'hipsparselt-dev' 'hiptensor' 'hiptensor-dev' 'openmp-extras-dev' 'omniperf' 'omnitrace' 'rccl' 'rccl-dev' 'rocrand' 'rocrand-dev' 'rocalution' 'rocalution-dev'
	'rocm-hip-libraries' 'rocm-hip-runtime-dev' 'rocthrust' 'rocthrust-dev' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma-dev' 'rocprofiler-sdk' 'rocm-developer-tools' 'migraphx' 'migraphx-dev' 'miopen' 'miopen-hip' 'miopen-hip-dev' 'mivisionx' 'mivisionx-dev' 'rocm-ml-libraries' 'rocm-ml-sdk' 'rpp' 'rpp-dev')

source=(
"https://repo.radeon.com/rocm/apt/6.2/pool/main/c/composablekernel-dev/composablekernel-dev_1.1.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/h/half/half_1.12.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/h/hiprand/hiprand_2.11.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/h/hiprand-dev/hiprand-dev_2.11.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/h/hipcub-dev/hipcub-dev_3.2.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/h/hipblas/hipblas_2.2.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/h/hipblas-dev/hipblas-dev_2.2.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/h/hipblaslt/hipblaslt_0.8.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/h/hipblaslt-dev/hipblaslt-dev_0.8.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/h/hipfft/hipfft_1.0.14.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/h/hipfft-dev/hipfft-dev_1.0.14.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/h/hipfort-dev/hipfort-dev_0.4.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/h/hipsolver/hipsolver_2.2.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/h/hipsolver-dev/hipsolver-dev_2.2.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/h/hipify-clang/hipify-clang_18.0.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/h/hipsparse/hipsparse_3.1.1.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/h/hipsparse-dev/hipsparse-dev_3.1.1.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/h/hipsparselt/hipsparselt_0.2.1.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/h/hipsparselt-dev/hipsparselt-dev_0.2.1.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/h/hiptensor/hiptensor_1.3.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/h/hiptensor-dev/hiptensor-dev_1.3.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/o/openmp-extras-dev/openmp-extras-dev_18.62.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/o/omniperf/omniperf_2.0.1.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/o/omnitrace/omnitrace_1.11.2.60200-66~22.04_amd64.deb" # TODO FIX
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocm-llvm/rocm-llvm_18.0.0.24292.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocblas/rocblas_4.2.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocblas-dev/rocblas-dev_4.2.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocsolver/rocsolver_3.26.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocsolver-dev/rocsolver-dev_3.26.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocprim-dev/rocprim-dev_3.2.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocfft/rocfft_1.0.28.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocfft-dev/rocfft-dev_1.0.28.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocsparse/rocsparse_3.2.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocsparse-dev/rocsparse-dev_3.2.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rccl/rccl_2.20.5.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rccl-dev/rccl-dev_2.20.5.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocrand/rocrand_3.1.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocrand-dev/rocrand-dev_3.1.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocalution/rocalution_3.2.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocalution-dev/rocalution-dev_3.2.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocm-hip-libraries/rocm-hip-libraries_6.2.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocm-hip-runtime-dev/rocm-hip-runtime-dev_6.2.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocthrust-dev/rocthrust-dev_3.0.1.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocm-hip-sdk/rocm-hip-sdk_6.2.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocm-opencl-sdk/rocm-opencl-sdk_6.2.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocwmma-dev/rocwmma-dev_1.5.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocprofiler-sdk/rocprofiler-sdk_0.4.0-66~24.04_amd64.deb"
# Machine learning and computer vision
"https://repo.radeon.com/rocm/apt/6.2/pool/main/m/migraphx/migraphx_2.10.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/m/migraphx-dev/migraphx-dev_2.10.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/m/miopen-hip/miopen-hip_3.2.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/m/miopen-hip-dev/miopen-hip-dev_3.2.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/m/mivisionx/mivisionx_3.0.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/m/mivisionx-dev/mivisionx-dev_3.0.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocm-ml-libraries/rocm-ml-libraries_6.2.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocm-ml-sdk/rocm-ml-sdk_6.2.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rpp/rpp_1.8.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rpp-dev/rpp-dev_1.8.0.60200-66~24.04_amd64.deb"
)

sha256sums=(
"91f994cbf6ee4b58598945c1a72a4238b60c4ea1b5a5c8f277d055e85026d6e4"
"5784c925770d4ac180bb4382bf6672105610c4611b35eebe1cc5f9017380c9fe"
"270a4d4979749405b9be02afd110fce9ca27fc987cda8f07374291c0c975508f"
"53aae62d0c4bfb4bcc1e219b41a2d71acb6c12faf7afccd3cf7645acc4d98780"
"61051ed1e506dc4077d564d36e2ce107eb1e3146c8d83898f8f766f900665602"
"85657208753d24b13f0da42aa2227dcb7daf05485240d485cc14d140783e34e5"
"1603bb01ee7fe23648e03e80ea1dc473e3992511d4911d54d28d63c92946e632"
"53372ebb57b03fa6a9103d0563e85d536e2191e237828239ac151117d5329f43"
"e0b9892cc10013c61a995958e71dbedd86836c137eef200434cdd7e73eab3251"
"167053a6c61fba433dcca05ecc51d1f961edabf66b83d0f7e8906179fe80d0d4"
"26c5f92a2d05ae5d9cf3f0849e633e9e3880ee172a364e4e58a7e019597700b1"
"4380a2f35f23bc378fecc091111324044f78a245b8e6f8cfe492631475486905"
"a9acc5a19ac451ed9448c92f2ac665aef9a47f48f884efe8b61cd1f86ee930f4"
"1553b2abe1a5febe35ecb45f64a1cdb7f73c73c18d6b2481ae71277cad77c4a8"
"772d0457a519baa97f421347afa008569e7c2ebc3b09ee669c5ac046821a3fe7"
"bd7f9264f9d689b741601702adbe8cd862f5c5122372f01ead5cdcaada1bfade"
"69619f0b7eef345e01c70c7182c1f4ed570326f20fbf3054c4b93864588611d7"
"56a9eff048c770a44289773948ae18ba622544b8cde43a18f1f4f364978b7397"
"1503093e7ba9d2186cd5735f281c42cd8695adace8b57a520a59287d040dbd7f"
"f9963a30ac447c1bad675cb91bfda98fe6e4e534a037ef3322f052c54753481e"
"eb3fb77a04a3bb713f94e3d57388acbb2225d646241da5a32021f81be012bcf4"
"25efddbfcc3e771e2b55da3f53dc22c8b21c263cfd53bd21bfc54491c25a746b"
"b0882bc88badd5a6622aa3c26aad02faed6c4fff6eb9ce5ce9e5ba9cf48bea8b"
"c0b29973fc07db592793ee5c164459b74f0fe1fb79f088bb4f510ceae2de0564"
"1c59b5dd4619a1c11dd1369d729d87e92cbda97c59c94c476b0a197755aa914b"
"f8a56c72404c1b35fd2684a76b135746d97b13241e4a40ba6c1a73b2b5b133bb"
"00f135ce2ae47c35085ef06248ff7d5ce8c12fd0d5b82e7bd77b1dbc0ce7058e"
"f513b31aafc28b9cb1a742dbd9b139e6694790b0bbc957f7a8d2779e183fd66f"
"1d60dda96a01247c4f6930b8c8bbfd53800542100ef2148279016f08fea83bc9"
"5990ba3f7edfde2c72262126a65be890e4a9dda5b95cf19582e00121fc5d08e9"
"b2e796734007efb07e65891d46d1cedc72699641b9d38b87f0400a5715505d34"
"06ae132e9cb8ab89843429664b9f127a6feaa5af2c5a492134398dfd90d485f0"
"d6a4a7a20b4d9246f83c7706a0cc449a1430fc24c542e4a611600bfe8e4c9cdc"
"fb7e08ff4c5e03bde17a1e8b92ff6633bf0271eac07f07c6f22d5b4591b45f46"
"3f6679b9b930afa316d9a7931f0c1e7576a6edf6bd1f51c3949db005f02ea99f"
"8c00225b3d32013861a7e9cea82c79303d95a169f486e2e9970a297aa56f3aad"
"58eeb119cde912ef0e1400ba320ca507edb15df85412e97829908a38009a6bd6"
"2a2a95185ce0e54df226474b2f5cfcdc9e5ede5a6d88a8a70c2635ea2237abba"
"1e264c42f381d5914ffba6e6257e20f907e670efb9c2d32aaf369f2b1935dd86"
"5d983cb7d31f267ea429c77c720da1a111e6f92e711877a52a6023d46ef63e2c"
"228f07a3caefc41f6efd5345eb9d3630f1db769f9b4abd1313cbcb32d077ce53"
"31422c783daa6cf0e6ca2f368045648137911eccf0cbb759525d832ed6e8da34"
"d74b5c1e36d0fba9397336c5db45228397f97620e25a0f08195adbae7a9909b9"
"a5f2f73f656db4aeeaceef0d2bccd2f9071b16d41cdabe5bf976edbc30a11ddd"
"2c8f47ec1cd59411e2f64e903f9cfc4ac68ca24ef6f6f2cdbb4eb8ab4626b491"
"b99166816370fec4ffbff14baf62af71e1a60182c9014311db6637e7d41dfd83"
"f879b1f80cbe7dd2fab42a5f51fe0f06f389842b2850bd3be83ba880f42d21e2"
# Machine learning and computer vision
"5d371ef16d96421ef876935120da70ec3347bb5436c8ecda014e732b2a968283"
"79eda5c1fbcd145f9d61b2bd19f27e5c4202d5769626bac467a476b1cfc7d222"
"7cc203c63a8120fbb17832b2ea2ed010f1e56028c1f8926b87ed4cf4618c0bae"
"df5fdd2218e4d380b133ba402f3734fbe0589d9cdd8618a101b71b968909b4ba"
"e9d4c1e9d5a6e3d4b2f5712b63921993d4523a78ba7f0777faeb345fafcbbd17"
"b38407287afbc452063ed5a80ec5111d9a4927d71fa423a7467f76927900c370"
"2d4884a55920288f7ff4f1aa1e21a81076d9978c2a94d5b791ac1f79690e1590"
"dc0b6146110c17d388838e1d0a25ee0b6fa6cf255bc232e4c68fb49b24b05e45"
"b91ce9912bf6bbe54ad0d86a14a45613ad143a0470b846230a2f324e6964e980"
"f4d449a0c00ccd892321378c38c2efa84157c905f0e78a65547d737b1d5141ce"
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
	exz "${srcdir}/composablekernel-dev_1.1.0.60200-66~24.04_amd64.deb"
	exz "${srcdir}/half_1.12.0.60200-66~24.04_amd64.deb"
	exz "${srcdir}/hiprand_2.11.0.60200-66~24.04_amd64.deb"
	exz "${srcdir}/hiprand-dev_2.11.0.60200-66~24.04_amd64.deb"
	exz "${srcdir}/hipblas_2.2.0.60200-66~24.04_amd64.deb"
	exz "${srcdir}/hipblas-dev_2.2.0.60200-66~24.04_amd64.deb"
	exz "${srcdir}/hipblaslt_0.8.0.60200-66~24.04_amd64.deb"
	exz "${srcdir}/hipblaslt-dev_0.8.0.60200-66~24.04_amd64.deb"
	exz "${srcdir}/hipcub-dev_3.2.0.60200-66~24.04_amd64.deb"
	exz "${srcdir}/hipfft_1.0.14.60200-66~24.04_amd64.deb"
	exz "${srcdir}/hipfft-dev_1.0.14.60200-66~24.04_amd64.deb"	
	exz "${srcdir}/hipfort-dev_0.4.0.60200-66~24.04_amd64.deb"
	exz "${srcdir}/hipsolver_2.2.0.60200-66~24.04_amd64.deb"
	exz "${srcdir}/hipsolver-dev_2.2.0.60200-66~24.04_amd64.deb"
	egz "${srcdir}/hipify-clang_18.0.0.60200-66~24.04_amd64.deb"
	exz "${srcdir}/hipsparse_3.1.1.60200-66~24.04_amd64.deb"
	exz "${srcdir}/hipsparse-dev_3.1.1.60200-66~24.04_amd64.deb"
	exz "${srcdir}/hipsparselt_0.2.1.60200-66~24.04_amd64.deb"
	exz "${srcdir}/hipsparselt-dev_0.2.1.60200-66~24.04_amd64.deb"
	exz "${srcdir}/hiptensor_1.3.0.60200-66~24.04_amd64.deb"
	exz "${srcdir}/hiptensor-dev_1.3.0.60200-66~24.04_amd64.deb"		
	egz "${srcdir}/openmp-extras-dev_18.62.0.60200-66~24.04_amd64.deb"
	egz "${srcdir}/omniperf_2.0.1.60200-66~24.04_amd64.deb"
	egz "${srcdir}/omnitrace_1.11.2.60200-66~22.04_amd64.deb"
	egz "${srcdir}/rocm-llvm_18.0.0.24292.60200-66~24.04_amd64.deb"	
	exz "${srcdir}/rocblas_4.2.0.60200-66~24.04_amd64.deb"
	exz "${srcdir}/rocblas-dev_4.2.0.60200-66~24.04_amd64.deb"
	exz "${srcdir}/rocprim-dev_3.2.0.60200-66~24.04_amd64.deb"
	exz "${srcdir}/rocfft_1.0.28.60200-66~24.04_amd64.deb"
	exz "${srcdir}/rocfft-dev_1.0.28.60200-66~24.04_amd64.deb"
	exz "${srcdir}/rocsparse_3.2.0.60200-66~24.04_amd64.deb"
	exz "${srcdir}/rocsparse-dev_3.2.0.60200-66~24.04_amd64.deb"
	exz "${srcdir}/rccl_2.20.5.60200-66~24.04_amd64.deb"
	exz "${srcdir}/rccl-dev_2.20.5.60200-66~24.04_amd64.deb"
	exz "${srcdir}/rocrand_3.1.0.60200-66~24.04_amd64.deb"
	exz "${srcdir}/rocrand-dev_3.1.0.60200-66~24.04_amd64.deb"
	exz "${srcdir}/rocalution_3.2.0.60200-66~24.04_amd64.deb"
	exz "${srcdir}/rocalution-dev_3.2.0.60200-66~24.04_amd64.deb"	
	egz "${srcdir}/rocm-hip-libraries_6.2.0.60200-66~24.04_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime-dev_6.2.0.60200-66~24.04_amd64.deb"
	exz "${srcdir}/rocsolver_3.26.0.60200-66~24.04_amd64.deb"
	exz "${srcdir}/rocsolver-dev_3.26.0.60200-66~24.04_amd64.deb"	
	exz "${srcdir}/rocthrust-dev_3.0.1.60200-66~24.04_amd64.deb"
	egz "${srcdir}/rocm-hip-sdk_6.2.0.60200-66~24.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-sdk_6.2.0.60200-66~24.04_amd64.deb"
	exz "${srcdir}/rocwmma-dev_1.5.0.60200-66~24.04_amd64.deb"
	egz "${srcdir}/rocprofiler-sdk_0.4.0-66~24.04_amd64.deb"	
	# Machine learning and computer vision
	exz "${srcdir}/migraphx_2.10.0.60200-66~24.04_amd64.deb"
	exz "${srcdir}/migraphx-dev_2.10.0.60200-66~24.04_amd64.deb"
	exz "${srcdir}/miopen-hip_3.2.0.60200-66~24.04_amd64.deb"
	exz "${srcdir}/miopen-hip-dev_3.2.0.60200-66~24.04_amd64.deb"
	egz "${srcdir}/mivisionx_3.0.0.60200-66~24.04_amd64.deb"
	egz "${srcdir}/mivisionx-dev_3.0.0.60200-66~24.04_amd64.deb"
	egz "${srcdir}/rocm-ml-libraries_6.2.0.60200-66~24.04_amd64.deb"	
	egz "${srcdir}/rocm-ml-sdk_6.2.0.60200-66~24.04_amd64.deb"
	egz "${srcdir}/rpp_1.8.0.60200-66~24.04_amd64.deb"
	egz "${srcdir}/rpp-dev_1.8.0.60200-66~24.04_amd64.deb"

	mv "${srcdir}/opt/" "${pkgdir}/"
	# mkdir -p "${pkgdir}/opt/rocm-6.2.0/hsa"
	# ln -s "/opt/rocm-6.2.0/include/hsa" "$pkgdir/opt/rocm-6.2.0/hsa/include"
}
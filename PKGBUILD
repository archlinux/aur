# Release notes https://rocm.docs.amd.com/en/latest/about/release-notes.html
amdgpu_repo='https://repo.radeon.com/amdgpu/7.0_rc1/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/7.0_rc1'
opencl_lib='opt/rocm-7.0.0/opencl/lib'
rocm_lib='opt/rocm-7.0.0/lib'
hip_lib='opt/rocm-7.0.0/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd-dev
pkgdesc="OpenCL SDK / HIP SDK / ROCM Compiler. This package needs at least 20GB of disk space."
pkgver=7.0.0
pkgrel=1
epoch=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('opencl-amd' 'suitesparse' 'blas' 'lapack')
provides=('composablekernel-dev' 'rocm-llvm' 'rocblas' 'rocblas-dev' 'rocsolver' 'rocsolver-dev' 'half' 'hipblas' 'hipblas-dev' 'hipblas-common' 'hipblas-common-dev' 'hipblaslt' 'hipblaslt-dev' 'hiprand' 'hiprand-dev' 'rocprim' 'rocprim-dev' 'hipcub' 'hipcub-dev' 'rocfft' 'rocfft-dev' 'hipfft' 'hipfft-dev'
	'hipfort' 'hipfort-dev' 'hipify-clang' 'hipsolver' 'hipsolver-dev' 'rocsparse' 'rocsparse-dev' 'hipsparse' 'hipsparse-dev' 'hipsparselt' 'hipsparselt-dev' 'hiptensor' 'hiptensor-dev' 'openmp-extras-dev' 'rccl' 'rccl-dev' 'rocrand' 'rocrand-dev' 'rocalution' 'rocalution-dev'
	'rocm-hip-libraries' 'rocm-hip-runtime-dev' 'rocthrust' 'rocthrust-dev' 'rocprofiler-compute' 'rocprofiler-debug' 'rocprofiler-systems' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma-dev' 'rocprofiler-sdk' 'rocprofiler-sdk-roctx' 'rocm-developer-tools' 'migraphx' 'migraphx-dev' 'miopen' 'miopen-hip' 'miopen-hip-dev' 'mivisionx' 'mivisionx-dev' 'rocm-ml-libraries' 'rocm-ml-sdk' 'rpp' 'rpp-dev')
conflicts=('composablekernel-dev' 'rocm-llvm' 'rocblas' 'rocblas-dev' 'rocsolver' 'rocsolver-dev' 'hipblas' 'hipblas-dev' 'hipblas-common' 'hipblas-common-dev' 'hipblaslt' 'hipblaslt-dev' 'hiprand' 'hiprand-dev' 'rocprim' 'rocprim-dev' 'hipcub' 'hipcub-dev' 'rocfft' 'rocfft-dev' 'hipfft' 'hipfft-dev'
	'hipfort' 'hipfort-dev' 'hipify-clang' 'hipsolver' 'hipsolver-dev' 'rocsparse' 'rocsparse-dev' 'hipsparse' 'hipsparse-dev' 'hipsparselt' 'hipsparselt-dev' 'hiptensor' 'hiptensor-dev' 'openmp-extras-dev' 'rccl' 'rccl-dev' 'rocrand' 'rocrand-dev' 'rocalution' 'rocalution-dev'
	'rocm-hip-libraries' 'rocm-hip-runtime-dev' 'rocthrust' 'rocthrust-dev' 'rocprofiler-compute' 'rocprofiler-debug' 'rocprofiler-systems' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma-dev' 'rocprofiler-sdk' 'rocprofiler-sdk-roctx' 'rocm-developer-tools' 'migraphx' 'migraphx-dev' 'miopen' 'miopen-hip' 'miopen-hip-dev' 'mivisionx' 'mivisionx-dev' 'rocm-ml-libraries' 'rocm-ml-sdk' 'rpp' 'rpp-dev')

source=(
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/c/composablekernel-dev/composablekernel-dev_1.1.0.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/h/half/half_1.12.0.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/h/hiprand/hiprand_3.0.0.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/h/hiprand-dev/hiprand-dev_3.0.0.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/h/hipcub-dev/hipcub-dev_4.0.0.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/h/hipblas/hipblas_3.0.0.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/h/hipblas-dev/hipblas-dev_3.0.0.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/h/hipblas-common-dev/hipblas-common-dev_1.2.0.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/h/hipblaslt/hipblaslt_1.0.0.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/h/hipblaslt-dev/hipblaslt-dev_1.0.0.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/h/hipfft/hipfft_1.0.20.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/h/hipfft-dev/hipfft-dev_1.0.20.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/h/hipfort-dev/hipfort-dev_0.7.0.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/h/hipsolver/hipsolver_3.0.0.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/h/hipsolver-dev/hipsolver-dev_3.0.0.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/h/hipify-clang/hipify-clang_20.0.0.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/h/hipsparse/hipsparse_4.0.1.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/h/hipsparse-dev/hipsparse-dev_4.0.1.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/h/hipsparselt/hipsparselt_0.2.4.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/h/hipsparselt-dev/hipsparselt-dev_0.2.4.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/h/hiptensor/hiptensor_2.0.0.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/h/hiptensor-dev/hiptensor-dev_2.0.0.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/o/openmp-extras-dev/openmp-extras-dev_20.70.0.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/r/rocm-llvm/rocm-llvm_20.0.0.25293.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/r/rocblas/rocblas_5.0.0.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/r/rocblas-dev/rocblas-dev_5.0.0.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/r/rocsolver/rocsolver_3.30.0.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/r/rocsolver-dev/rocsolver-dev_3.30.0.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/r/rocprim-dev/rocprim-dev_4.0.0.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/r/rocfft/rocfft_1.0.34.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/r/rocfft-dev/rocfft-dev_1.0.34.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/r/rocsparse/rocsparse_4.0.2.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/r/rocsparse-dev/rocsparse-dev_4.0.2.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/r/rccl/rccl_2.26.6.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/r/rccl-dev/rccl-dev_2.26.6.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/r/rocrand/rocrand_4.0.0.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/r/rocrand-dev/rocrand-dev_4.0.0.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/r/rocalution/rocalution_4.0.0.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/r/rocalution-dev/rocalution-dev_4.0.0.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/r/rocm-hip-runtime-dev/rocm-hip-runtime-dev_7.0.0.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/r/rocthrust-dev/rocthrust-dev_4.0.0.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/r/rocm-opencl-sdk/rocm-opencl-sdk_7.0.0.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/r/rocwmma-dev/rocwmma-dev_2.0.0.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/r/rocprofiler-sdk/rocprofiler-sdk_1.0.0-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/r/rocprofiler-sdk-roctx/rocprofiler-sdk-roctx_1.0.0-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/r/rocprofiler-sdk-rocpd/rocprofiler-sdk-rocpd_1.0.0-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/r/rocprofiler-compute/rocprofiler-compute_3.2.0.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/r/rocprofiler-systems/rocprofiler-systems_1.1.0.70000-17~24.04_amd64.deb"
# Machine learning and computer vision
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/m/migraphx/migraphx_2.13.0.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/m/migraphx-dev/migraphx-dev_2.13.0.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/m/miopen-hip/miopen-hip_3.4.1.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/m/miopen-hip-dev/miopen-hip-dev_3.4.1.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/m/mivisionx/mivisionx_3.3.0.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/m/mivisionx-dev/mivisionx-dev_3.3.0.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/r/rpp/rpp_2.0.0.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/r/rpp-dev/rpp-dev_2.0.0.70000-17~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0_rc1/pool/main/t/transferbench-dev/transferbench-dev_1.62.0.70000-17~24.04_amd64.deb"
)

sha256sums=(
"3a755d0f7124313f40776208d54f4398841f40c5bfa9bae95e1e5f8df3114fbe"
"2ea16f6fe64ce80a2176aad7aaf253c47c5719f7dd2da03779e333d3789c447a"
"551644cc4386e305f60aae77b1e7bfb773e76eace407a5df4d607defeb3a00e6"
"29a4421fc3a2769c243e0225d4e8c0b24a70f2c3721a1b35beb8cdf07b0e7e77"
"9aacd72862d12b9a371eb4e03a08c307b3532c8a32fad6d3bd0fe6f516d725f7"
"ec4a3c143c7eddc5f61a7a000dfb12754ed1933eb83a326a645231112eeac778"
"ffc1cb42be573baecbb4efa3a6f57c2574887b2651bc2a968bfa9ff0354c233b"
"08ad6bf8d2f4a2ae374f806d930eb321fc89dd825b78609c4d51f8fda7533674"
"da130f77259d498447b22a61a2853fa9f760d2d8d1eec41bb028a2559466a3fe"
"ada63c2d553630fcca689142458872606f976e734528ee7e2c74b7e96102cd45"
"e7518d915366040936e940caca6a309da8a67b9a7d5bbcb0e373379ad4043fd1"
"6a753393051626bd28738b75bfe5a9b933d94b7dc292cd73ef4ef090ca93fe17"
"292cca0447e84bc8cd1da46d98155875ce146964aa99566a6fc681b66f10d52e"
"8206073c166cc468f9bab7b1dc837161ea316baff2e5b7aa53ef95088a8651d4"
"f5778d80522f2808f3bf100983d49d84496312e52061519b2691c78140c9ee05"
"1d5b63f520620069658759f3f0df14fe75f90aa86bfe04d8a8a095d69663c21c"
"b3d1e825952f76409c0cdb4fc2cdc01842f96ee14dc4dd5265267f7c95641a75"
"b43a2a4746af1db0af541aee9790f8dbdac2c72d9a36eb8cc43d4888b6192d86"
"f37ea2514d26241006769f32dc1b331e6d553643d5a23a22956033b5727e6950"
"3ca834db3df44d29ef490785610ec0219a705c3b5fb53350bdc47db05d596c17"
"daea061d3f492bea1f084c875a786bc7c57492d9f140375ff8086539351d9ba0"
"34d286c718589ac400de53511bd251d949932838de567dd04b4eb8d6aef59eee"
"6a7de06c66e21842ecbfeaeaa65fc1f09da08e0d4b61efb73650971e0b4d653a"
"0811cd071f149be87cb1a9dd503324ddecca4097f20af69139ee2103b4bc1947"
"859a4f6f189d3ed171297b57ddec7bb8824c219016c016021963e7b71b66d1fa"
"2e9472fe782beb895b5bf40aead4418ce0e56ca255f55dc885a9f503b6d8dc7f"
"efc4f586869caca98ada2a9f0dabb761d466077e23c0ef0d3b9142eeb68190de"
"c5199bbd2b4bb62fc408235af78e57d1a626fa7281c097a262d6e202ed8ab955"
"e608b9e07b01944d1016d3e9c614bc7f728df7bdf85a808fcfabf9712be19a76"
"fe0fa07f9a3e993b12cd019e16b209ea163bd25f7e404edccdcb4e268ed75022"
"edb31386fb1fe4e0ef34b6b4efa2115cf66447bdc3a3b2e36b4448d068adb418"
"ea4c0f225011e21fa4f93cf830b4efa18a80b3baad3427c11bf86da946181c7e"
"50be60c046a3096bcc760fd3381dfeb57e794652137203074bd6830ce9948ab6"
"37f4a715ee0c4e22b28df8256ef5094c576ad17cd987cf758b1419d827baf33b"
"fb9b566cfcb87b3cb16e0554ad2244356086a912fc674b3a337b3a73e9bd3702"
"3bea33e80ea1cd1d9efe79c7edc56f24ca685d41011ffae063c7734f9726dd7f"
"0530bbb999ace2f4d7bcdc8a1f82859fdfd0ee44a1d988a93a6e265cdf1a77ec"
"177b1f23eadf7d94c5b378670b3b1db90692e7815f1ca03114aca623a8478ba1"
"3f5d24e60164eb28acb108568d6f67c328838185dd8f7d3f60a524aad792371c"
"01572faadf85164c3c960cc12eb36430bea451f6763e9bcbe979c22053bd4990"
"956ebd0b6d978c7436073cc681578632e45d247f0986dad1e8cc12632f920f16"
"c31ecc0c0a06324b3e765e253a5becec8add896d7339d2f4fb56e184b2cede09"
"c55140514878c4d9e7db9382fb39b2b764f5a63e5fc58bea98422dfb026d06cd"
"7ba405e0ad4e34152be0b29d82b08a867cc89ac1ee589e2da65b712ceed6e0d4"
"399f17e71823e447177d050303c788bd828f5d9cd520ef11dfd32bbf54488a62"
"22ba9a83d2c2ae784238ccde97c75d24ad612e7cbe1308912bea6dd52e0be58d"
"d96e8274b4e1b95b10c101fe3ef801623bf026ebf931096dd81ee653835e2313"
"23578b066a1f22967d51cd20a6a52ee4750610ccabbd5d03ed27eb496065226f"
# Machine learning and computer vision
"5e82ee2c11f0374ae1d468facd136c46dd1abf10bf89a5784cee87783d2d4bda"
"9249e0d0b193d3661b963725cd73eae8b1645513f60c52f59764dbb289fbe2b8"
"f9a3ab5ff6c54ed88311dfbe1fd5c2ae030164a90b5a78b03bec8b00cee25b1a"
"b49a1c80b07d6016ea8b9f829d3b34a874ff28eaaf511830b10e46da42335096"
"1412a195d15b1cceca638ecd51b0d668521d180b9ab207f22b60d53212ab08ce"
"3e7ac657907937d91bd8e7a381efcc3dfbcdf65a04439375f158d9c4a397a5a4"
"be00816c9b0c01f00795f9f28b68cc4b4a8c6dc413f40e72032865a68f841e49"
"abef1beb43e7b2c7ec741f93bc5d359fa72012d4a79b43e255e2b8f71dc69793"
"866ab17eb99a714e83fbd21bf7bdf3e0d63ddbc7590e6590f29dfaa91bc3c553"
)

package() {	
	for p in *.deb; do
		ar x "${p}"
		if [[ -f data.tar.gz ]]; then
			# echo gz: "${srcdir}/${p}"
			tar xfx data.tar.gz
			rm data.tar.gz
		elif [[ -f data.tar.xz ]]; then
			# echo xz: "${srcdir}/${p}"
			tar xJf data.tar.xz
			rm data.tar.xz
		fi
	done

	mv "${srcdir}/opt/" "${pkgdir}/"
	mv "${pkgdir}/opt/rocm-7.0.0" "${pkgdir}/opt/rocm"
	# mkdir -p "${pkgdir}/opt/rocm-7.0.0/hsa"
	# ln -s "/opt/rocm-7.0.0/include/hsa" "$pkgdir/opt/rocm-7.0.0/hsa/include"
}
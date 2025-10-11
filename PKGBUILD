# Release notes https://rocm.docs.amd.com/en/latest/about/release-notes.html
amdgpu_repo='https://repo.radeon.com/amdgpu/7.0.2/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/7.0.2'
opencl_lib='opt/rocm-7.0.2/opencl/lib'
rocm_lib='opt/rocm-7.0.2/lib'
hip_lib='opt/rocm-7.0.2/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd-dev
pkgdesc="ROCm extra runtime and developer packages. This package needs 13.45GB of disk space."
pkgver=7.0.2
pkgrel=1
epoch=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('opencl-amd' 'suitesparse' 'blas' 'lapack')
provides=('composablekernel-dev' 'hip-dev' 'hip-doc' 'hip-samples' 'hipcc' 'rocm-llvm' 'rocblas' 'rocblas-dev' 'rocsolver' 'rocsolver-dev' 'half' 'hipblas' 'hipblas-dev' 'hipblas-common' 'hipblas-common-dev' 'hipblaslt' 'hipblaslt-dev' 'hiprand' 'hiprand-dev' 
'rocdecode' 'rocdecode-dev' 'rocjpeg' 'rocjpeg-dev' 'rocprim' 'rocprim-dev' 'hipcub' 'hipcub-dev' 'rocfft' 'rocfft-dev' 'hipfft' 'hipfft-dev'
	'hipfort' 'hipfort-dev' 'hipify-clang' 'hipsolver' 'hipsolver-dev' 'rocsparse' 'rocsparse-dev' 'hipsparse' 'hipsparse-dev' 'hipsparselt' 'hipsparselt-dev' 'hiptensor' 'hiptensor-dev' 'openmp-extras-dev' 'rccl' 'rccl-dev' 'rocrand' 'rocrand-dev' 'rocalution' 'rocalution-dev'
	'rocm-hip-libraries' 'rocm-hip-runtime-dev' 'rocthrust' 'rocthrust-dev' 'rocprofiler-compute' 'rocprofiler-debug' 'rocprofiler-systems' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma-dev' 'rocprofiler-sdk' 'rocprofiler-sdk-roctx' 'rocprofiler-sdk-rocpd' 'rocm-developer-tools' 'migraphx' 'migraphx-dev' 'miopen' 'miopen-hip' 'miopen-hip-dev' 'mivisionx' 'mivisionx-dev' 'rocm-ml-libraries' 'rocm-ml-sdk' 'rpp' 'rpp-dev')
conflicts=('composablekernel-dev' 'hip-dev' 'hip-doc' 'hip-samples' 'hipcc' 'rocm-llvm' 'rocblas' 'rocblas-dev' 'rocsolver' 'rocsolver-dev' 'hipblas' 'hipblas-dev' 'hipblas-common' 'hipblas-common-dev' 'hipblaslt' 'hipblaslt-dev' 'hiprand' 'hiprand-dev'
'rocdecode' 'rocdecode-dev' 'rocjpeg' 'rocjpeg-dev' 'rocprim' 'rocprim-dev' 'hipcub' 'hipcub-dev' 'rocfft' 'rocfft-dev' 'hipfft' 'hipfft-dev'
	'hipfort' 'hipfort-dev' 'hipify-clang' 'hipsolver' 'hipsolver-dev' 'rocsparse' 'rocsparse-dev' 'hipsparse' 'hipsparse-dev' 'hipsparselt' 'hipsparselt-dev' 'hiptensor' 'hiptensor-dev' 'openmp-extras-dev' 'rccl' 'rccl-dev' 'rocrand' 'rocrand-dev' 'rocalution' 'rocalution-dev'
	'rocm-hip-libraries' 'rocm-hip-runtime-dev' 'rocthrust' 'rocthrust-dev' 'rocprofiler-compute' 'rocprofiler-debug' 'rocprofiler-systems' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma-dev' 'rocprofiler-sdk' 'rocprofiler-sdk-roctx' 'rocprofiler-sdk-rocpd' 'rocm-developer-tools' 'migraphx' 'migraphx-dev' 'miopen' 'miopen-hip' 'miopen-hip-dev' 'mivisionx' 'mivisionx-dev' 'rocm-ml-libraries' 'rocm-ml-sdk' 'rpp' 'rpp-dev')

source=(
# ROCm runtime
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/h/half/half_1.12.0.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/h/hiprand/hiprand_3.0.0.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/h/hiprand-dev/hiprand-dev_3.0.0.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/h/hipblas/hipblas_3.0.2.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/h/hipblas-dev/hipblas-dev_3.0.2.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/h/hipblas-common-dev/hipblas-common-dev_1.2.0.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/h/hipfft/hipfft_1.0.20.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/h/hipfft-dev/hipfft-dev_1.0.20.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/h/hipsolver/hipsolver_3.0.0.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/h/hipsolver-dev/hipsolver-dev_3.0.0.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/h/hipsparse/hipsparse_4.0.1.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/h/hipsparse-dev/hipsparse-dev_4.0.1.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/h/hipsparselt/hipsparselt_0.2.4.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/h/hipsparselt-dev/hipsparselt-dev_0.2.4.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/h/hiptensor/hiptensor_2.0.0.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/h/hiptensor-dev/hiptensor-dev_2.0.0.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/rocfft/rocfft_1.0.34.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/rocfft-dev/rocfft-dev_1.0.34.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/rocrand/rocrand_4.0.0.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/rocrand-dev/rocrand-dev_4.0.0.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/rpp/rpp_2.0.0.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/rpp-dev/rpp-dev_2.0.0.70002-56~24.04_amd64.deb"
# Missing from Ubuntu release
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/rocdecode/rocdecode_1.0.0.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/rocdecode-dev/rocdecode-dev_1.0.0.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/rocjpeg/rocjpeg_1.1.0.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/rocjpeg-dev/rocjpeg-dev_1.1.0.70002-56~24.04_amd64.deb"
# ROCm runtime or dev
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/c/composablekernel-dev/composablekernel-dev_1.1.0.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/h/hipify-clang/hipify-clang_20.0.0.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/o/openmp-extras-runtime/openmp-extras-runtime_20.70.0.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/rocm-cmake/rocm-cmake_0.14.0.70002-56~24.04_amd64.deb"
# Runtime but big size or dependencies of a big sized package
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/h/hipblaslt/hipblaslt_1.0.0.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/h/hipblaslt-dev/hipblaslt-dev_1.0.0.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/m/miopen-hip/miopen-hip_3.5.0.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/m/miopen-hip-dev/miopen-hip-dev_3.5.0.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/m/migraphx/migraphx_2.13.0.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/m/migraphx-dev/migraphx-dev_2.13.0.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/m/mivisionx/mivisionx_3.3.0.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/m/mivisionx-dev/mivisionx-dev_3.3.0.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/rccl/rccl_2.26.6.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/rccl-dev/rccl-dev_2.26.6.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/rocblas/rocblas_5.0.2.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/rocblas-dev/rocblas-dev_5.0.2.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/rocsparse/rocsparse_4.0.3.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/rocsparse-dev/rocsparse-dev_4.0.3.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/rocalution/rocalution_4.0.0.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/rocalution-dev/rocalution-dev_4.0.0.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/rocsolver/rocsolver_3.30.1.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/rocsolver-dev/rocsolver-dev_3.30.1.70002-56~24.04_amd64.deb"
# ROCm dev
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/h/hipcc/hipcc_1.1.1.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/h/hip-dev/hip-dev_7.0.51831.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/h/hip-samples/hip-samples_7.0.51831.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/h/hip-doc/hip-doc_7.0.51831.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/h/hipcub-dev/hipcub-dev_4.0.0.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/h/hipfort-dev/hipfort-dev_0.7.0.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/o/openmp-extras-dev/openmp-extras-dev_20.70.0.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/rocm-llvm/rocm-llvm_20.0.0.25385.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/rocprim-dev/rocprim-dev_4.0.1.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/rocthrust-dev/rocthrust-dev_4.0.0.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/rocwmma-dev/rocwmma-dev_2.0.0.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/rocprofiler-sdk/rocprofiler-sdk_1.0.0-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/rocprofiler-sdk-rocpd/rocprofiler-sdk-rocpd_1.0.0-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/rocprofiler-sdk-roctx/rocprofiler-sdk-roctx_1.0.0-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/rocprofiler-compute/rocprofiler-compute_3.2.3.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/rocprofiler-systems/rocprofiler-systems_1.1.1.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/roctracer/roctracer_4.1.70002.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/roctracer-dev/roctracer-dev_4.1.70002.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/t/transferbench-dev/transferbench-dev_1.63.00.70002-56~24.04_amd64.deb"
)

sha256sums=(
"4d87c981def2486e75b1d6b9a45350781e8f937061d55d17678f978ff0f49538"
"2fd0773c11e13f06000b730ecf70914fc5fbca89de0d621d4fc1a4993e1dd886"
"a5141045cac57d8ecd98cdb6af165dc672c333e8ee53fdb8c530ad1c559771aa"
"144cf5af52c49de5b146f929e2d136c346a45a82a4d20ee7680e8f9ab717f9cd"
"11b2a9ac011dc30b1d4e81721bddcad6a6e85836637b4fd8c63a387f8bc95029"
"9b0bb447096c7d74702e632218f9a644b4189a23efd7021f6d3660ef59ec168e"
"002f134bca3de10eafd7445701ea5af961b32d86a1ef52775f3a65b2ffecb06e"
"0e6480cfe39210b9d4ac045abddd827a886c4b860bc31f48c6d78c076610440d"
"25c0be42a11aa1605c48c3151de198732b038557caeed96cfae3576959c775e1"
"ba982cbaffb47c696aa61ad26ea387bf6570a814fd3e4216bf79260d100c6001"
"aa50250cbdaa23c7e3806f768ef5a90e7a18f9dbd57858b8e21c4f5cbed86399"
"7e0c15bf4d69e19372b8904d8a990f1e782ab63b57510c66eb36c892c209d23d"
"420d35091697074a8a8e2c2f766c721f741934d702f1e8ffcd4e1e3110b8e331"
"6945de14e736c8e98031bf71344810d455fafefceb857b3649e3955d8a98f04a"
"402d2ada12b23339109f86e832cc235d968074935dc97a997830620fc8572e1d"
"759c99ae1f7642fdc0c5343273ec378d14f6c49bdbee8522e4d9828002a57833"
"b56d95f62d2e59b58c07bb0257b742e00b83dcf173384a37df722e0623828fa5"
"be7025146a47a34b989aec60028adb26510db28806ea53a75ce6c4e8d98ca71f"
"0c1737551ce8a447a33c0434923fa23814e30dc46afbb8dfd8950b49caec6372"
"e6cdca8546d526b3208dc840562b0c5f02fb67e04b96cf3e2c8a7578ed0b7d6f"
"c0cb5b16a515918b70a38342e99376210be0c40905f8ace4fbb5e5e5cbc72282"
"bda828e4132b50969039a9642a466e7bb36d0c77a059a647fc0194fc06d1e868"
"91477e63620122f1a4e9975fea79b3c3880cf3eef51205907998f3b301fb7645"
"3f430a00a823c6ff46c4ad16bf521a936f90ad2276c3d2e3e83917005f18c32f"
"a4dccbd08235157b1380f190484da5365b281db6d0ebfcfd7c1a6b524a04510c"
"338a5539eb27aba914bbbf2d494ac145bde14c49d61bce7cbfe689b7a6836e8a"
"a4f68e0da1ec9a721008133017b527ad9b8a99644508c2a0e1ee8d8a6728e469"
"29d79209d6d80824bf6b10fe18906f425d38a1155c0cd6b37132d70999063da6"
"a61dd0dcb7352b8ddfcda59269c2465e7974afef895791479c106cd04c5c5318"
"f3f7cdca6f8c4a85c9c1c659ec1a26a82ee3dc5a4973df0526040a174714e36c"
"82367f5b7ee8615c673faa117e2975991d7e075e5202146541bd210349124144"
"d03f4dcb2a486f7c4a6353086bfeeeb3b0d4c98ec9d185d0f094e9b2029b9a09"
"1baa4fbcf7f39a624c9c97a64b7dfd5574f7471e7555279c17d15b06daf1b48f"
"f9bc44e82ca718d61569b34d02c9bd9d58efbe3fc21d80588f38d7c27f5deade"
"032b261600a35305296e6eba957684d29b22bc2bdcf1d01324ca9d18b897f235"
"14356e05a9fdfcad53db88898d6858ac928863fa71263dac707ecb634b699b32"
"213ae875df9893f44035f9804f3fcdbd2f847b5b6734bbd3b645a2f3f42c5188"
"d8af95ad8379d09cec22dad588dfe4635e23518e9a4c15166bc9f30fe22a7c39"
"9398e4bb2576dac5243a6d9a473510fff700a7958de42808a748e80ee000b33e"
"e3140978ae6a72d6fa4d0c33df1d2c8afbb2f59997a3e3249491eb87726180bb"
"a48edfafe8ee0910006ec1db0995fc99a58fdebf47d004e7bba942fbe744513b"
"8ba75eaf6095d3313c38b393a88b5946e44cb47a1f1adf3a027514c666f98789"
"b6fec4ef98929ec20331f6424b7ff8467c673fc038a0eeaac4559086e4d40596"
"10055cf166a826aff7ff2f82a7242d0b32e8bfd3cc55bca20d57108d13506194"
"33fef35d139f261289442b3142e63afae4b6a7be0d61173e422c44e4a0b4db25"
"846953e53a3625c1a832e4f9d1866a7bb6a956340728fc0244d582aa0596553f"
"54a4d80b56f03a5734d1de856d3dd7bd76451548b0d4c2f8e19a94cdc1c6f266"
"2a7c099ebda74831cc967d8d0f9fde159a250f0057e9cb8a91ba0ef5b245565d"
"2b1aa1b5b5dd135a26201da8aaf0dbf21a2fba1fc456944a2cf9bca267e8ff8e"
"0f96a380dce611852cb8cffebe3ceebb3268e903391e1ef53a9e8ecca6b57b33"
"ea031c6a295cc471d90a7e7a11989db3ade19b2afb0e305d46066c006afa03d3"
"6d9dd06e7625de1db31e9ff2dd44c8a87c4e0f395924fb0ac50f63fde34ec561"
"9492fdeee5e8fff1d9d11f27db52553152e985a877906889d96e1662c6dc8ff6"
"ca507cf2bd7a54616d658a48918f6e6126c7e22ebd573e24d76aaf0342eab89d"
"9ea7b0f8d8ec9b79bda2cfbe0a87400ac5bdb0bc52d7984ca3533ea3b7a2db21"
"66434e0d914ebed70e054e4606bdacfc8d3f06de62c1c6935c6bafbc15e7254a"
"30c8f82e9c55a0c5e257963cb8672155d0adbd04b77a887c3785ab64a900795d"
"add4ad7c428713de8afe16b52daa6a271557e7b4e01a2b2f9361ac4603984c9d"
"43af857b63ae8c3024d2fc6b2b87abbe1002f01f6cbf1166c9c4a2d867130af3"
"f29d0e8bd7a2852358fa30ca64f0d72d0684cc87f5a5bebd2665b855515516e5"
"84f6b2e7c60c6e109c867f90cf5e8c08d4592c5726c4dd534ea6985111860570"
"a0619fc6f28b25f6cb3398b2f19c18af947afbedd75e1a4559803cc53cbb15cd"
"34c7bc8558736ce604aa0b324df7071c59f73f57430871970850345cdd9beac8"
"1a1fd9288c9c481b9df7d748e20ce9accbc4413453ef792a28b132aa6ffccb88"
"cefa1cb3ec9cb06ecb6d13dd0e9e8d9e15f62f9057db60b8f677adab6b201974"
"e6b20793a765c2d03789ee37a0fc1226c55196452b72bf64400de4a8b20e800f"
"38a74f6023be4c7264cd2c9a818bb683cb9e5e843ef547e0b8d0c5a215f8a5a4"
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
	mv "${pkgdir}/opt/rocm-7.0.2" "${pkgdir}/opt/rocm"
	# mkdir -p "${pkgdir}/opt/rocm-7.0.2/hsa"
	# ln -s "/opt/rocm-7.0.2/include/hsa" "$pkgdir/opt/rocm-7.0.2/hsa/include"
}
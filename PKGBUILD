# Release notes https://rocm.docs.amd.com/en/latest/about/release-notes.html
amdgpu_repo='https://repo.radeon.com/amdgpu/7.2.1/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/7.2.1'
opencl_lib='opt/rocm-7.2.1/opencl/lib'
rocm_lib='opt/rocm-7.2.1/lib'
hip_lib='opt/rocm-7.2.1/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd-dev
pkgdesc="ROCm extra runtime and developer packages. This package needs 16.45GB of disk space."
pkgver=7.2.1
pkgrel=1
epoch=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('opencl-amd' 'suitesparse' 'blas' 'lapack')
provides=('composable-kernel' 'hip-doc' 'hip-samples' 'hipcc' 'rocm-llvm' 'rocblas' 'rocsolver' 'half' 'hipblas' 'hipblas-common' 'hipblaslt' 'hiprand' 'rocdecode' 'rocpydecode' 'rocjpeg' 'rocprim' 'hipcub' 'rocfft' 'hipfft' 'hipfort' 'hipify-clang' 'hipsolver' 'rocsparse' 'hipsparse' 'hipsparselt' 'hiptensor' 'openmp-extras-dev'
'rccl' 'rocrand' 'rocal' 'rocalution' 'rocm-hip-libraries' 'rocthrust' 'rocprofiler-compute' 'rocprofiler-debug' 'rocprofiler-systems' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma' 'rocprofiler-sdk' 'rocprofiler-sdk-roctx' 'rocprofiler-sdk-rocpd' 'rocm-developer-tools' 'rocshmem' 'migraphx' 'miopen' 'miopen-hip' 'mivisionx' 'rocm-ml-libraries'
'rocm-ml-sdk' 'rpp')
conflicts=('composable-kernel' 'hip-doc' 'hip-samples' 'hipcc' 'rocm-llvm' 'rocblas' 'rocsolver' 'hipblas' 'hipblas-common' 'hipblaslt' 'hiprand' 'rocdecode' 'rocpydecode' 'rocjpeg' 'rocprim' 'hipcub' 'rocfft' 'hipfft' 'hipfort' 'hipify-clang' 'hipsolver' 'rocsparse' 'hipsparse' 'hipsparselt' 'hiptensor' 'openmp-extras-dev'
'rccl' 'rocrand' 'rocal' 'rocalution' 'rocm-hip-libraries' 'rocthrust' 'rocprofiler-compute' 'rocprofiler-debug' 'rocprofiler-systems' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma' 'rocprofiler-sdk' 'rocprofiler-sdk-roctx' 'rocprofiler-sdk-rocpd' 'rocm-developer-tools' 'rocshmem' 'migraphx' 'miopen' 'miopen-hip' 'mivisionx' 'rocm-ml-libraries'
'rocm-ml-sdk' 'rpp')
options=('!strip')

source=(
# ROCm runtime
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/h/half/half_1.12.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/h/hiprand/hiprand_3.1.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/h/hiprand-dev/hiprand-dev_3.1.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/h/hipblas/hipblas_3.2.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/h/hipblas-dev/hipblas-dev_3.2.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/h/hipblas-common-dev/hipblas-common-dev_1.4.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/h/hipfft/hipfft_1.0.22.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/h/hipfft-dev/hipfft-dev_1.0.22.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/h/hipsolver/hipsolver_3.2.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/h/hipsolver-dev/hipsolver-dev_3.2.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/h/hipsparse/hipsparse_4.2.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/h/hipsparse-dev/hipsparse-dev_4.2.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/h/hipsparselt/hipsparselt_0.2.6.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/h/hipsparselt-dev/hipsparselt-dev_0.2.6.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/h/hiptensor/hiptensor_2.2.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/h/hiptensor-dev/hiptensor-dev_2.2.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rocfft/rocfft_1.0.36.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rocfft-dev/rocfft-dev_1.0.36.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rocrand/rocrand_4.2.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rocrand-dev/rocrand-dev_4.2.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rpp/rpp_2.2.1.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rpp-dev/rpp-dev_2.2.1.70201-81~24.04_amd64.deb"
# Missing from Ubuntu release
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rocal/rocal_2.5.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rocal-dev/rocal-dev_2.5.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rocdecode/rocdecode_1.7.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rocdecode-dev/rocdecode-dev_1.7.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rocpydecode/rocpydecode_0.8.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rocjpeg/rocjpeg_1.4.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rocjpeg-dev/rocjpeg-dev_1.4.0.70201-81~24.04_amd64.deb"
# ROCm runtime or dev
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/c/composablekernel-dev/composablekernel-dev_1.2.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/h/hipify-clang/hipify-clang_22.0.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/o/openmp-extras-runtime/openmp-extras-runtime_20.70.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rocm-cmake/rocm-cmake_0.14.0.70201-81~24.04_amd64.deb"
# Runtime but big size or dependencies of a big sized package
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/h/hipblaslt/hipblaslt_1.2.2.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/h/hipblaslt-dev/hipblaslt-dev_1.2.2.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/m/miopen-hip/miopen-hip_3.5.1.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/m/miopen-hip-dev/miopen-hip-dev_3.5.1.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/m/migraphx/migraphx_2.15.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/m/migraphx-dev/migraphx-dev_2.15.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/m/mivisionx/mivisionx_3.5.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/m/mivisionx-dev/mivisionx-dev_3.5.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rccl/rccl_2.27.7.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rccl-dev/rccl-dev_2.27.7.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rocblas/rocblas_5.2.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rocblas-dev/rocblas-dev_5.2.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rocsparse/rocsparse_4.2.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rocsparse-dev/rocsparse-dev_4.2.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rocalution/rocalution_4.1.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rocalution-dev/rocalution-dev_4.1.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rocsolver/rocsolver_3.32.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rocsolver-dev/rocsolver-dev_3.32.0.70201-81~24.04_amd64.deb"
# ROCm dev
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/h/hipcc/hipcc_1.1.1.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/h/hip-dev/hip-dev_7.2.53211.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/h/hip-samples/hip-samples_7.2.53211.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/h/hip-doc/hip-doc_7.2.53211.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/h/hipcub-dev/hipcub-dev_4.2.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/h/hipfort-dev/hipfort-dev_0.7.1.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/o/openmp-extras-dev/openmp-extras-dev_20.70.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rocm-llvm/rocm-llvm_22.0.0.26084.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rocprim-dev/rocprim-dev_4.2.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rocthrust-dev/rocthrust-dev_4.2.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rocwmma-dev/rocwmma-dev_2.2.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rocprofiler-sdk/rocprofiler-sdk_1.1.0-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rocprofiler-sdk-rocpd/rocprofiler-sdk-rocpd_1.1.0-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rocprofiler-sdk-roctx/rocprofiler-sdk-roctx_1.1.0-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rocprofiler-compute/rocprofiler-compute_3.4.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rocprofiler-systems/rocprofiler-systems_1.3.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rocshmem-dev/rocshmem-dev_3.2.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/roctracer/roctracer_4.1.70201.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/roctracer-dev/roctracer-dev_4.1.70201.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/t/transferbench-dev/transferbench-dev_1.64.00.70201-81~24.04_amd64.deb"
)

sha256sums=(
"8eb062d56965a537d4c1e12ab20dcc9a5bdea9b5f3b15e4cfbabc2bf83cb5938"
"97166585bb13859cbf24ddc484a7808a923c52a45839213f8d0faa79a9b10f7a"
"d973776b2fb3b747a2d640be2da8a1f52c1eb81d8b118073d48be7cd787b0af7"
"1622454208de4ab44dead5dcc976dbdf2e22d30c2660d9db77542e1284b7afbf"
"2c0bf5c4adbf601f4e1bef21b0e54dbc4cb14d163d8cf83d05e283ec88a580aa"
"280919d3df391d941994ab4eac2bca7a3ba7058523546a9a2fef5fd0da0b8fa4"
"6db6e59316bfcf2489a739e34ac35739fdcb2c6588bf3c16debcdaae0ebdfe60"
"7ade2126bdd04807ab411225753a8435c66e375852ccf622e40bfb7f4929102d"
"d3830c08b4329ea5f699bc0d76c6e6d7119b49e826de1da92e3b8960cc051887"
"cb9eb61ef691b5fef354089ebd1815f9be6f62d03ddffac33c1a300bdeeffa28"
"937a90935e3ec58d22f65ea6b64df190d51f46cca7a0042e0a74b3419a440658"
"487b653bd7cfdee68d302fedb5b37124610072d34d84850bbba0fe40b204d4fe"
"119b2ae008d50ae8c18be9c6d709385d95b496c82a8242e6fef391e363fa9175"
"0b1d57bc4daa0c631b0f017c0bca840d61a54e86e3f9b6681c499d0ee9c9123b"
"eefa7f8fae9b826735850a3786064cab1a7f1fca08d793018a7e8ccf4377d9dc"
"da312ace4bfb7a1d844a37ace5fb096bcef07569203c93f8652d3cf58eee616d"
"04a122d1b89ff36e1ca3714c7668cfd5c9e96e29371434d9c55e6717b5c3ae32"
"c2972dcc9d581cad7511c6271a7b1f69ae751c5d375f0d8739f9158e6f2bd7e4"
"e818b30ca3e6b6518810b904910fa7fbb8d15d55bd2d88a2d597287d9f554f39"
"b3f97ecc2b7642fe5ae75956adbc4268bb1bbe0c4e16f4d0c270e9ac3212786d"
"83fabca4858890be88287db32ffb713466f5539331b480658fabdfd15059f60a"
"13c3a375eb15b30bac1956d7441c959bb48e93d35e68aba1cb866a486b1feb50"
"ce5310464ddb7d65c6795aa276fe9c8ba7dd3c313041e0807224bdc7d6709691"
"bad9ad0516de535f2cd0df32fd437834129ad907bf913dcdd76ee26623e610fd"
"56a71e35c1291cc0cdbe0fd3b8742b56bb829dd5f036992403ce1204669ff869"
"affe40973a4fad81513d5e2df3ec44572758b34ae7dbe470176f4b11ee12b2d5"
"9e248b295fcab67f84c3bba2c22d6cdd4bf528103d04a2bc8b91efc713ee4a25"
"4fc412ba64ea2fd388fbb79cf28b9a22199970ddd814b90003c6f7f9027f729a"
"efb283c444a87537c8bd3ffd32324809746ff4960972d2c324997d7ec25f8fc9"
"79d2ad269fec0aead4fcf2a6589b5f43d2cad4b38f27922a746555c18ed08926"
"2f8c1b0d49f4d60b2f25a6d4b54adcaa86ffba98ab6bf553b8f616bace923c87"
"bbc9ed1bf0f652f576d324abcc179ba8490260abfa1ef7bb279798bc9572529f"
"fad4504cbb5e06c8b694a05defb0c7980546da0fc8538af37f9d5f16d58c11a1"
"0d3d18b0e520e1021c8bb303ee4447608f49ab291d327872bef242ab87279b6b"
"7a5c829a8971633ffa7f92f37734b95d9e69095be04e8f21c85bdb026c6c6d45"
"b0b23199dc24f3a51fa09b1ccf647609ce636bace89afa206f6143bd4b69baa5"
"6f242a444d41a27029645dd42d83bb5e47597901663ef65807e33ee2ab4cbdb3"
"cf0381824856c7181cfc45db415c1d25a98625090cf06de98de564693c02a01e"
"ba930c986539015f4a7a651e1c89ade6c7e2d1cf695c3e1ff89903c0601d9019"
"7adba588e2927f98be3eed9f192577ba8aba019d886c828a8ed2343a323b25b7"
"f2b8f26c19ae454b65510dd45139ed621e242d2f3629988c42903cd3b91e71b2"
"c4ce15f5a0e1871ef3c859aa79e6762301f4689e2818ecdbd258074ce9c775cb"
"a7eca326346dd323aa92f8229a9c462c3b985347f278fe964d8cda31e686e080"
"ddbbe57ea95101038bede7de0eb9bdb57012bcea105bf5353217d7e01145573c"
"753132779b2498e23aac40befe7ba867ef6568faae444da378c1153657ca3cd4"
"fecb1a57e08e79bc988dbfc02199b40d6eb57eedafea52844d7389c6f8aedb7a"
"8d241e8da0e51144228509a40faee2d97f888869ba3a6669390af4b7fed48890"
"03577fe2d186edd574a7a4d4ed0b9d1c04e79bdf522b3b62b3a8d9f99ce0b9ab"
"e25a7f7ab5e34558c3a81a7d767ec6f37fa1df6f793ff8ca5f17a9444ff7239a"
"d6b7769517d56cb17c90708356eece02d1e2b6aacb3dd1954561aed681993940"
"01832923e68f1bbd24ad27c6f1c9d478dfcbac7b755dfa0ce09bba6fac65fb95"
"2ec5ab1dcefa6b9a441015634e1272e05897b30b8ca489f0aaab16138cc1538a"
"5fb031d567f08f11a489a9c7dfbad401928d71828f41e2768fa24d3afe41892d"
"4c3a5aeef072554f90fed39488c1f6168c64095b8580b5e103d138015b1f571c"
"b2b2bb7c999cc425fad7bde0e88931ad60f92b7426706d7b1a79775e0c1da8b5"
"1f57356accb1aeb97e61295f22d66d76ca1d98d20b49d7ab4446f80c83f6a0e2"
"c5aa9d5ed1713ba28c8489d7e7565c757b514cd2c76447357b65bb1d3f133d2a"
"51476ce452ccc607466c75205c1cefe5e34c499eec4b44b27e6816b0f889ff22"
"1cbad039d161a03f9c4df81193fdb81d55d9a79e400ce8ce26ee55488512e0bd"
"364df46102b4fd6ce5a25f977c1b83d4d8d0ce5ed8f6e079d652f2bd2fef09d5"
"e0c1e9fd34dd05845b625854b441a43d604566d67dc30be073048f5cc57f54fc"
"22781d1841368f5c99fd13ef0c344ec3e7a68dedf1247916f11e9b3e210c39a6"
"cc849247d30f67ce34a439e10aaaa08002e8b83c9507de63dc1fcd8b710013cf"
"e5c8e3258c89053d6776bae8f774f82597d78629d4594f950a2507595ff1ed64"
"f7b497eb262f947edb1714970542de288f4a8abd1d11b5702c98d8670d9ccdcd"
"20840b78f0dd856f2294a10301fc8153d5680371f8b7d4deb14e115c92fbc259"
"b901498af94f708b0eb84f94992fec9d85b16ee63f97bc8b8602a699e6ccab20"
"6f6e66120c9a5b8b8519632ca8e2c0aadf186632435479fb74744b4ff046c2c3"
"6f56da97a3b09abbe2677eeb6a9b9fbadbe480c9cc9a285445125e2372ab5c36"
"a8c2acbc51f9300070019b93c61ea240be9934ebb094760c4587bded7cbe74ce"
"bca22ffd247bc68634c1eaa483ab8db1a3dbb6aafbd3f1487a5ccb3b0717575d"
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
    mv "${pkgdir}/opt/rocm-7.2.1" "${pkgdir}/opt/rocm"
    # mkdir -p "${pkgdir}/opt/rocm-7.2.1/hsa"
    # ln -s "/opt/rocm-7.2.1/include/hsa" "$pkgdir/opt/rocm-7.2.1/hsa/include"
}
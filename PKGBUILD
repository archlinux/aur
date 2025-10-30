# Release notes https://rocm.docs.amd.com/en/latest/about/release-notes.html
amdgpu_repo='https://repo.radeon.com/amdgpu/7.1/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/7.1'
opencl_lib='opt/rocm-7.1.0/opencl/lib'
rocm_lib='opt/rocm-7.1.0/lib'
hip_lib='opt/rocm-7.1.0/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd-dev
pkgdesc="ROCm extra runtime and developer packages. This package needs 14.03GB of disk space."
pkgver=7.1.0
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
"https://repo.radeon.com/rocm/apt/7.1/pool/main/h/half/half_1.12.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/h/hiprand/hiprand_3.1.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/h/hiprand-dev/hiprand-dev_3.1.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/h/hipblas/hipblas_3.1.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/h/hipblas-dev/hipblas-dev_3.1.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/h/hipblas-common-dev/hipblas-common-dev_1.3.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/h/hipfft/hipfft_1.0.21.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/h/hipfft-dev/hipfft-dev_1.0.21.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/h/hipsolver/hipsolver_3.1.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/h/hipsolver-dev/hipsolver-dev_3.1.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/h/hipsparse/hipsparse_4.1.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/h/hipsparse-dev/hipsparse-dev_4.1.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/h/hipsparselt/hipsparselt_0.2.5.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/h/hipsparselt-dev/hipsparselt-dev_0.2.5.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/h/hiptensor/hiptensor_2.0.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/h/hiptensor-dev/hiptensor-dev_2.0.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/rocfft/rocfft_1.0.35.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/rocfft-dev/rocfft-dev_1.0.35.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/rocrand/rocrand_4.1.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/rocrand-dev/rocrand-dev_4.1.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/rpp/rpp_2.1.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/rpp-dev/rpp-dev_2.1.0.70100-20~24.04_amd64.deb"
# Missing from Ubuntu release
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/rocdecode/rocdecode_1.4.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/rocdecode-dev/rocdecode-dev_1.4.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/rocjpeg/rocjpeg_1.2.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/rocjpeg-dev/rocjpeg-dev_1.2.0.70100-20~24.04_amd64.deb"
# ROCm runtime or dev
"https://repo.radeon.com/rocm/apt/7.1/pool/main/c/composablekernel-dev/composablekernel-dev_1.1.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/h/hipify-clang/hipify-clang_20.0.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/o/openmp-extras-runtime/openmp-extras-runtime_20.70.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/rocm-cmake/rocm-cmake_0.14.0.70100-20~24.04_amd64.deb"
# Runtime but big size or dependencies of a big sized package
"https://repo.radeon.com/rocm/apt/7.1/pool/main/h/hipblaslt/hipblaslt_1.1.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/h/hipblaslt-dev/hipblaslt-dev_1.1.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/m/miopen-hip/miopen-hip_3.5.1.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/m/miopen-hip-dev/miopen-hip-dev_3.5.1.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/m/migraphx/migraphx_2.14.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/m/migraphx-dev/migraphx-dev_2.14.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/m/mivisionx/mivisionx_3.4.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/m/mivisionx-dev/mivisionx-dev_3.4.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/rccl/rccl_2.27.7.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/rccl-dev/rccl-dev_2.27.7.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/rocblas/rocblas_5.1.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/rocblas-dev/rocblas-dev_5.1.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/rocsparse/rocsparse_4.1.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/rocsparse-dev/rocsparse-dev_4.1.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/rocalution/rocalution_4.0.1.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/rocalution-dev/rocalution-dev_4.0.1.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/rocsolver/rocsolver_3.31.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/rocsolver-dev/rocsolver-dev_3.31.0.70100-20~24.04_amd64.deb"
# ROCm dev
"https://repo.radeon.com/rocm/apt/7.1/pool/main/h/hipcc/hipcc_1.1.1.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/h/hip-dev/hip-dev_7.1.25424.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/h/hip-samples/hip-samples_7.1.25424.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/h/hip-doc/hip-doc_7.1.25424.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/h/hipcub-dev/hipcub-dev_4.1.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/h/hipfort-dev/hipfort-dev_0.7.1.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/o/openmp-extras-dev/openmp-extras-dev_20.70.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/rocm-llvm/rocm-llvm_20.0.0.25425.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/rocprim-dev/rocprim-dev_4.1.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/rocthrust-dev/rocthrust-dev_4.1.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/rocwmma-dev/rocwmma-dev_2.0.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/rocprofiler-sdk/rocprofiler-sdk_1.0.0-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/rocprofiler-sdk-rocpd/rocprofiler-sdk-rocpd_1.0.0-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/rocprofiler-sdk-roctx/rocprofiler-sdk-roctx_1.0.0-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/rocprofiler-compute/rocprofiler-compute_3.3.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/rocprofiler-systems/rocprofiler-systems_1.2.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/roctracer/roctracer_4.1.70100.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/roctracer-dev/roctracer-dev_4.1.70100.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/t/transferbench-dev/transferbench-dev_1.64.00.70100-20~24.04_amd64.deb"
)

sha256sums=(
"05359610697b1c125214eff18ee6b3ab4ce15dc1ea1a9dc39fbffb101e768412"
"d15d94a69954232bd6a80ff21f1a24711c3dbe39969803eae97bba39a0bcf16d"
"7fe35ffc736283558b2a11e7f7e8113666db374dfe4fd6d42025bf1cd0283dd8"
"18cc4ebba211b2380870a8606f73655961bcf846393680e0cebe66043097e5c5"
"0b9687016cb3d6719c8f2abbd4440a2a31bcb608114f485cef18fb79cac2f32e"
"ac95934d307423cd54a24b3f7a9cec53f2874b169fee2f8f981aa8817a9109ad"
"677980ae620f1b941a0f5b22eafa4a1860bd0f75980b234e290766887583c4b1"
"1c3f7a57b2e883127218d07da4597275ee33863837d3e8e7dbd0dedfd67b8b2e"
"4564d11157cc6f4f45e23e50c7660c27ced401c461699949583b98648722ada1"
"642739561c5a73d7aa2339431970c1a07c919568cb941efa499466099cb2977b"
"b84f5f3e74892cbaf3ab96824eef1c5fe6ca726ad0e1d95e528708ca8ddf8bcc"
"38d80a4eef1d92fadfbbd34208329f479b48412909f07e3d173626dd3150f42c"
"a3d03c794ce6595ea50b4b12e50e2d0da7eca66faff35875b0d2aabccbd065f2"
"7aa16e9d186d2777570bd6cabc85bb09508f7972d030c17c3b6c1ab11680d9fe"
"f168d4aee13e155470477d4c2f19832be83c0ed485b57be92c89a75c330db0ac"
"0ad79de64e83359bb8cba3ca4fd6d77c85f900f8e9a29bae38e326ef38bc0c0e"
"c95fd633f9f1ba666d892d37a70aaae6b95f203d078ce24bc2096ba67243f107"
"b15bf22e9eeea930fd24dd8b0fd7cd00373c4f4fcc61b3ab2562ffccd7070e84"
"e9a025b773fd5d35934fc4a059f7452eeec4f594ce2f20828edcc5b2e93cb270"
"4d709699c0f313a222b64c9cb18bc16bbb46551bf80b83ff1a28ac702234d3bf"
"9dca34ba4c4f27f1449e3654fab7d94b32474027f67b3efe6e3a4d17351ffe6e"
"1b3765c1bf93d30352f5d0c93726eb7494a2cfb9e5bed74200d730c05325013e"
"b656e0f49eb0ddb3fe96519a8d918deffa02d3df3b41f2837adfcc2b51030973"
"d39946e33c73e3b48325c9b152724383a0a2605c4b0f780bfccf8fe32569da31"
"ea7a023c4eb555646a4f5cd5670c89e96268eaa72119e53fea4335d42677982c"
"e75d46d4bd88d0be081352556ffb45eb708323a03ea1571a333132efee8d7e57"
"04488615f580de117838ce08672c32fba62237b0a36f3bbcfd0fdaefdfb77690"
"04608ac38a6d02a806792ead0c5b14627296c8610761f2b48e8f645b09db58a3"
"5613faa3b26ca5446e246260b2c1c595f70e33a2523d9793539f2b04b8a0baa5"
"aa0ac07f99ff70c308c9ec3551299e55c412ad8f7b2296cfc512934f10f7631e"
"bb09c7488d312e83ec693fea08f31ad1b4aa474ac5ae05b23a8cbfbe9fb41801"
"a5404ee8e232e55f064d3f1bd7b4f07d623fb52425b1e1af1d5ee86271fbfe60"
"b22848984bac040d8d8594348eee566444a40213c649c20ef0a27dfba76d1099"
"92ff3894d2b12d647f59c84809ba7cdd70799616cf93fa22d7b2f606caad878e"
"40e5aeeb6009c2e08dd7c3b10642835c3ff1aa9e321222a971ee43ba98c1d307"
"ee06776375380a5811256bbb5c5a35318ff9ef79d89704d4994397ab69511530"
"4385c30e9898919f0420f2d12943ff2a9a56b702231df48d996d2ec635d50d63"
"2e7faea9b62efeafb968f0a00ff368e0cb18dccf12c3eb5a7aaa97474fd92bf6"
"9fa0a89435c107c5c39b45080e3a4791af0ad258633accc80a2c04b09f67453f"
"5f4ad77c4e5527fb16a6662a06a1807b6af644e451776d6789b65c461eb4f84b"
"bbffb2660ccc36392d6dd30d3b6cc956c0cf1b2dce858aa8f10620238bcd9a90"
"3e3a2d19dd0b32d6d5dc728b1a399be7ec57d183b3de934a08896eeffdde4e94"
"07e2a3da47b45745586d376915ff5dbc9512b1159500afa80a3c516be2c8954a"
"2ff2973ed1c029dfe7002b28e6b2da7448d8e4e26c3e7749df2b0b71d02829ec"
"8749f6506dfad5e7fb35fd9092e62ccc60ec9ed2e7f412112286df2c510f4eb5"
"dff2b666dec7085f7d793fd6dc49917d9cc4962a740165cc8eb0493bb00a4dbf"
"1ebe9d48ed2278e8da06c56fd72e4bc60975ba2d6cdd5124480eaab2fe36a840"
"fc29ae4892e4683ba8e064794cb82cdac805a64887117f82f947a9080d6cc0d4"
"aad81b4bb5eb5da7007b3215099225de987a5b50ee53ad6479bf63e52f747246"
"e0b6ff8b3338cca4bfc7a39ba5c5e7c00b061f938ec350fe94cacb5242a0a47b"
"116fe8133934dcd0c8b97932d8fb6446f6df6231266807cb6489f761d9a15ae5"
"05040c8e2ca3983b48be97ee0d87367c0036f8d476b45e347cc021d30c0f9080"
"69e712c0653598162e77a100fd5291cc363662691a94dc38459bce23f06ac497"
"b23e95450d89f700b821c3a570cd925227f350203641338ff9c9aa2fbcb2f4fd"
"4d2e39477f7fb2e4d558f02d9dd25fcfe0504c4a06d31f22d7e987cd2fea5d2d"
"b07ff847b0e5fade5a4ef44a78c75fb054b1a38050ec74c9b9eae294469af7fd"
"5a52ae7f92e66b5d16a29c1fa06c9ff2951ed665f83ddd683cb63c5ac382494c"
"e687b3a07062782dd03f79cfd07d08b2c8dc0feb2e95bad977be7d679a50603d"
"11f86ea783df17385bb1746f58e942f5d9adeee5fbb9475923bf597db72e1819"
"abaa457cdb3bfa6b8a80b02073a316e6723000c70c4541c014b532bcc8f13359"
"dbb0b57fa47298ea7e694b63125e17399174ef01a1e62814ef4e9f0cf31a97c4"
"5fb3c752c17d6037003cd8efe0ca22f495eabfe1772d48014d4ce1738233447e"
"1a87401b37eb228b0312e723e429874d1831a16adb3395687d084a0b3d9a8b5c"
"bc30dde515e1ec09a00c4d195ceda188bb98e0d103c60a713b9d3b45a268a2ad"
"6059e87d5e212bda172e08bee185d50dbb23013322101e48bdfd7d7e7279957f"
"c92c81db9e4f96f970ee7cebd25d3f7d2e269048137406de291ec54df3df8d5b"
"97bccc35193b2009034e194e5ffaabad4dd3d8dea11094cb3e85333a9136cacc"
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
	mv "${pkgdir}/opt/rocm-7.1.0" "${pkgdir}/opt/rocm"
	# mkdir -p "${pkgdir}/opt/rocm-7.1.0/hsa"
	# ln -s "/opt/rocm-7.1.0/include/hsa" "$pkgdir/opt/rocm-7.1.0/hsa/include"
}
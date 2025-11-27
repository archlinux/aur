# Release notes https://rocm.docs.amd.com/en/latest/about/release-notes.html
amdgpu_repo='https://repo.radeon.com/amdgpu/7.1.1/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/7.1.1'
opencl_lib='opt/rocm-7.1.1/opencl/lib'
rocm_lib='opt/rocm-7.1.1/lib'
hip_lib='opt/rocm-7.1.1/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd-dev
pkgdesc="ROCm extra runtime and developer packages. This package needs 14.03GB of disk space."
pkgver=7.1.1
pkgrel=1
epoch=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('opencl-amd' 'suitesparse' 'blas' 'lapack')
provides=('composablekernel-dev' 'hip-dev' 'hip-doc' 'hip-samples' 'hipcc' 'rocm-llvm' 'rocblas' 'rocblas-dev' 'rocsolver' 'rocsolver-dev' 'half' 'hipblas' 'hipblas-dev' 'hipblas-common' 'hipblas-common-dev' 'hipblaslt' 'hipblaslt-dev' 'hiprand' 'hiprand-dev' 
'rocdecode' 'rocdecode-dev' 'rocjpeg' 'rocjpeg-dev' 'rocprim' 'rocprim-dev' 'hipcub' 'hipcub-dev' 'rocfft' 'rocfft-dev' 'hipfft' 'hipfft-dev' 'hipfort' 'hipfort-dev' 'hipify-clang' 'hipsolver' 'hipsolver-dev' 'rocsparse' 'rocsparse-dev' 'hipsparse' 'hipsparse-dev' 
'hipsparselt' 'hipsparselt-dev' 'hiptensor' 'hiptensor-dev' 'openmp-extras-dev' 'rccl' 'rccl-dev' 'rocrand' 'rocrand-dev' 'rocalution' 'rocalution-dev'	'rocm-hip-libraries' 'rocm-hip-runtime-dev' 'rocthrust' 'rocthrust-dev' 'rocprofiler-compute' 'rocprofiler-debug'
'rocprofiler-systems' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma-dev' 'rocprofiler-sdk' 'rocprofiler-sdk-roctx' 'rocprofiler-sdk-rocpd' 'rocm-developer-tools' 'rocshmem' 'rocshmem-dev' 'migraphx' 'migraphx-dev' 'miopen' 'miopen-hip' 'miopen-hip-dev' 'mivisionx' 'mivisionx-dev' 'rocm-ml-libraries'
'rocm-ml-sdk' 'rpp' 'rpp-dev')
conflicts=('composablekernel-dev' 'hip-dev' 'hip-doc' 'hip-samples' 'hipcc' 'rocm-llvm' 'rocblas' 'rocblas-dev' 'rocsolver' 'rocsolver-dev' 'hipblas' 'hipblas-dev' 'hipblas-common' 'hipblas-common-dev' 'hipblaslt' 'hipblaslt-dev' 'hiprand' 'hiprand-dev'
'rocdecode' 'rocdecode-dev' 'rocjpeg' 'rocjpeg-dev' 'rocprim' 'rocprim-dev' 'hipcub' 'hipcub-dev' 'rocfft' 'rocfft-dev' 'hipfft' 'hipfft-dev' 'hipfort' 'hipfort-dev' 'hipify-clang' 'hipsolver' 'hipsolver-dev' 'rocsparse' 'rocsparse-dev' 'hipsparse' 'hipsparse-dev'
'hipsparselt' 'hipsparselt-dev' 'hiptensor' 'hiptensor-dev' 'openmp-extras-dev' 'rccl' 'rccl-dev' 'rocrand' 'rocrand-dev' 'rocalution' 'rocalution-dev' 'rocm-hip-libraries' 'rocm-hip-runtime-dev' 'rocthrust' 'rocthrust-dev' 'rocprofiler-compute' 'rocprofiler-debug'
'rocprofiler-systems' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma-dev' 'rocprofiler-sdk' 'rocprofiler-sdk-roctx' 'rocprofiler-sdk-rocpd' 'rocm-developer-tools' 'rocshmem' 'rocshmem-dev' 'migraphx' 'migraphx-dev' 'miopen' 'miopen-hip' 'miopen-hip-dev' 'mivisionx' 'mivisionx-dev' 'rocm-ml-libraries'
'rocm-ml-sdk' 'rpp' 'rpp-dev')

source=(
# ROCm runtime
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/h/half/half_1.12.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/h/hiprand/hiprand_3.1.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/h/hiprand-dev/hiprand-dev_3.1.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/h/hipblas/hipblas_3.1.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/h/hipblas-dev/hipblas-dev_3.1.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/h/hipblas-common-dev/hipblas-common-dev_1.3.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/h/hipfft/hipfft_1.0.21.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/h/hipfft-dev/hipfft-dev_1.0.21.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/h/hipsolver/hipsolver_3.1.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/h/hipsolver-dev/hipsolver-dev_3.1.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/h/hipsparse/hipsparse_4.1.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/h/hipsparse-dev/hipsparse-dev_4.1.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/h/hipsparselt/hipsparselt_0.2.5.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/h/hipsparselt-dev/hipsparselt-dev_0.2.5.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/h/hiptensor/hiptensor_2.0.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/h/hiptensor-dev/hiptensor-dev_2.0.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rocfft/rocfft_1.0.35.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rocfft-dev/rocfft-dev_1.0.35.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rocrand/rocrand_4.1.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rocrand-dev/rocrand-dev_4.1.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rpp/rpp_2.1.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rpp-dev/rpp-dev_2.1.0.70101-38~24.04_amd64.deb"
# Missing from Ubuntu release
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rocdecode/rocdecode_1.4.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rocdecode-dev/rocdecode-dev_1.4.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rocjpeg/rocjpeg_1.2.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rocjpeg-dev/rocjpeg-dev_1.2.0.70101-38~24.04_amd64.deb"
# ROCm runtime or dev
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/c/composablekernel-dev/composablekernel-dev_1.1.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/h/hipify-clang/hipify-clang_20.0.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/o/openmp-extras-runtime/openmp-extras-runtime_20.70.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rocm-cmake/rocm-cmake_0.14.0.70101-38~24.04_amd64.deb"
# Runtime but big size or dependencies of a big sized package
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/h/hipblaslt/hipblaslt_1.1.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/h/hipblaslt-dev/hipblaslt-dev_1.1.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/m/miopen-hip/miopen-hip_3.5.1.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/m/miopen-hip-dev/miopen-hip-dev_3.5.1.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/m/migraphx/migraphx_2.14.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/m/migraphx-dev/migraphx-dev_2.14.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/m/mivisionx/mivisionx_3.4.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/m/mivisionx-dev/mivisionx-dev_3.4.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rccl/rccl_2.27.7.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rccl-dev/rccl-dev_2.27.7.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rocblas/rocblas_5.1.1.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rocblas-dev/rocblas-dev_5.1.1.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rocsparse/rocsparse_4.1.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rocsparse-dev/rocsparse-dev_4.1.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rocalution/rocalution_4.0.1.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rocalution-dev/rocalution-dev_4.0.1.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rocsolver/rocsolver_3.31.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rocsolver-dev/rocsolver-dev_3.31.0.70101-38~24.04_amd64.deb"
# ROCm dev
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/h/hipcc/hipcc_1.1.1.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/h/hip-dev/hip-dev_7.1.52802.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/h/hip-samples/hip-samples_7.1.52802.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/h/hip-doc/hip-doc_7.1.52802.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/h/hipcub-dev/hipcub-dev_4.1.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/h/hipfort-dev/hipfort-dev_0.7.1.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/o/openmp-extras-dev/openmp-extras-dev_20.70.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rocm-llvm/rocm-llvm_20.0.0.25444.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rocprim-dev/rocprim-dev_4.1.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rocthrust-dev/rocthrust-dev_4.1.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rocwmma-dev/rocwmma-dev_2.1.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rocprofiler-sdk/rocprofiler-sdk_1.0.0-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rocprofiler-sdk-rocpd/rocprofiler-sdk-rocpd_1.0.0-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rocprofiler-sdk-roctx/rocprofiler-sdk-roctx_1.0.0-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rocprofiler-compute/rocprofiler-compute_3.3.1.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rocprofiler-systems/rocprofiler-systems_1.2.1.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rocshmem-dev/rocshmem-dev_3.1.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/roctracer/roctracer_4.1.70101.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/roctracer-dev/roctracer-dev_4.1.70101.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/t/transferbench-dev/transferbench-dev_1.64.00.70101-38~24.04_amd64.deb"
)

sha256sums=(
"fb39950c8d1e2934dacbbedcbd30a7a38a5ae3534564e4b74df84e519a08980e"
"4e0c0c2b57478ecd7d7054a37e04918f0473985647fe0060594c00fc200357fe"
"86e02ce0983207cac5882a4d6a95d0316a139c1d5fe8eb3f8ea788a96d1d1d9a"
"df9bc816bff39af790299df1fa51919424d5182f84760f19934084a27bd5106d"
"01c6bbd54d12646c950a696bb59f14c6c3958e57c1bf2b42f75d812007aa39cd"
"d24ea84515293f152479043b2e2c967a5b5c6bce977dc3f15a03e4a3b91dd0db"
"a4e9ead5b49edd44b4f8968737936f8b89562606cc9167de66b9ce81a584717d"
"598429bee36568eaeb001016da3cdbf9eebd5d9aab237efb12cc28364e7ed7e9"
"313d2afd8b8ca0da2d6e7c4ca2ff2139f9f690965072aed228b276e32ece3bc7"
"ac8598e173a562360e4428287920f39cb0eee73c5a8ff99b793b247bb12d2541"
"968a1f8d7b932a0ae9aa4358aa39c9750e5c8c2f16e455e7b2c4b5fa2d1738e6"
"955fe354d4e193659b95018f7a0e481c60d9944e56386c17463f6a53df2d8f37"
"c8c061fa4ee3b2b93d4fbfbabfb78ab6be6c617821af3c2baaffb5312b552ef2"
"fa8b634825ab9a803f05a0d39ea904a05f75dd089d11598fccdb36cc0eced582"
"25e1a9aa0a6c05bce808b6b52a771fd330eeef6d7473be745883da49560541f9"
"f9c4406e23ac4f4c5f9a97feb2a025bb3ae4d7ff04db09ea22bfeafe9cb502f4"
"b50f194fc272a10c58658811f4e787c51267047dd738cdaa0d7357e07dcc25a1"
"8bf1a55554d8f42a3ed9d570bdd6eb0b1616ae5fd7b17d4ceca60ea8ee3f8f97"
"a4a33487fdc28e5afd858ac84c100e39a9d2aa8b1c085b35a8f2a0ee1170c3f5"
"0a21e3498c25fa95fdd15544bde45f37af2bacb821c5d4c333787098721fb8e3"
"bb9c7aeb0065c1790b137404ed9b8e94228991b0a4f4b3502420655167fc2037"
"6106ba1f478657badcc7a372110f93cba6339c95de132e5a9d3c7c37ce1858ad"
"ada7d1fae42872c4757d02dbd8f9721b2219a53bec4e0676d03cce655d45c529"
"fab9b3bc3fb23e35519d068025aece5c4d3ddc6cb824b2890fc2261912b8eab1"
"4ddfb5052db378e4ad98860fc4e4465268eee3036d8cf74dff149d5f19f352e4"
"af9e850110a5bee0ccd1ceb370b3a775b6180031fc585181ecd7ef2424e1d97d"
"ac008e064f6a4fba5734626292ed73d6d560eea80b430befb2c8e64b23ed5aa4"
"bbdef3cf6042f978bfdf6bfafbd4db7b26db5705f5ddb16167228d6cff62e6fb"
"f2a53381571a582d6f4a599ad5e9f0a23aac062ebf709a0eb0f2c09bcea40410"
"5a43e5ff05fdba8ab5556e572fbf88c1bd2e71b56dc83d605304fc2e6b1e5ed7"
"c235776897fd8a0b6bc24e72a953d28708e3021d2f8c26ac4bfa8cd26d9ca13a"
"631235ac21dc169692e65e040b29343590743e61377116549cde3e6881bbe065"
"d49f881013aeaf91cadc4994e3c3c0e36420870d615d173843fdd1199a15910b"
"7145df06e0de0a7086b2e0c7b8fca95ad08e346133dbad1e7556162a6e3b01b7"
"f74e3b25a7b0ee2e1bdba9e4ad596792e99915cd365ff4282cb05ec63d3cf2f4"
"e2086f330594823ec17287049c23dfbe081b7888d08c656c9083826eb74405fe"
"71b1e6ea9e8e8bd9632159034a52eda30bfc8c9b974bf7afac9fe4d899808820"
"272792c61362305d87d1196370bd574e96191a1c5cea4a45d8bfe256ce6c2de2"
"f6b64b834582a23d52a2f408e190d80936e86a56f703e94d4aac10a9f73e1f98"
"d097c8c9a16b80c1e93e70b3dd49e72da21db66cf86731e11639374ce1e41870"
"9f1c1f99009ff5d6cb5e3618373a90b070f98bdbf82b518bba0c7b953f2e237f"
"92c3131200b6520fa80b18d658015d1a9df5b8c90ab3712248f1f4a475f06441"
"7e80f7767c5e0287f4e47b03cfccbbc45e57d7da3ca1459617b6542dd47a5e01"
"28d5fbfe2666e2829827d0864e3506821fb77c3039bf2f2ad945ce6a74d6a6ad"
"027a57c2577a15440bb55768cbc1622f33d6f78f9bcae8d99e9936ace914037b"
"12f1d45db1ec63541707ab77735659bff221defbb2ad78f72fc9dde08e1f6dca"
"dc0e15e02eb2405ff2b845762287a20bea273107b498cd0d7452b5349d9d8396"
"ea2a4f4dccdfcac9e3ad1fa291c29052479a389db709c85f159b65a83cc4aafa"
"4716496386b8d77fff676b397926c9553d94c3de0dc6cee7728101da95b28cc8"
"736acec734396969e11e8813a55742de536c53324fab3a836d75aa3dbf0d9651"
"d027500ddf5e5c1783b4cd4bcf5d68199c77497e6728c922dff8b83e09ca6732"
"3161f21374af934ed6f647309a03f5f45f6e9e0d37c64d8480dfcec667ba46ce"
"63eafabdf0a86f07a94da6f665753073e362a47b59ec1d9c5cace3d313f747cc"
"ca604a026188611543498de11a0a16f1459f204f6e2ebc7f92a28aa1675d23c9"
"d39498686281e455828d2e8d4f4adb0832d116f5c500356a72ada4a82b1bf58e"
"16cda1ee9626e050e52275fced1e9d76a24897b966c33afbd45ed1ebaa42d7c1"
"f213faa34cad02340b6a0a76161f0bd7dd8c76ff6366ba85e7ebd53859352a40"
"b66c87156552d0f2d7570a47ac4e56e3280606e9f87d2ca2a080df7a8ef95d9b"
"13c5ffc6ec6bb2009958a1073245e8eaf8f711f19c95f004fb5b81f94a14c353"
"07af9318be48a76e384efd1e9a2fd9d3834dc6b2d63e10f7479af9e121978691"
"63cec0feff047f8e9c21912f604c77d9e06098c5cee2c629b46acd2ebd6171b8"
"ccf9e4c6b73c8c3cfef4a7ca917de18971a267c916c29cc521410657440d0f79"
"443725001b8b27a5212d1496f37d889b0c66940e641788e922ff414c2fa10701"
"784e875c9be06b7c28875f79f88968b2a6c327706c0af018341d2faea6bb70c6"
"0ec4cf71f4ca563948452a870e04ea696dcf33b344a302ed625d69e173f7d493"
"c096aea69766181ae867cc0671fb40de71a40e2dfae15c6e6fbffbcfedb37ab6"
"66284ee28e6d969a053024f8192e19a0aa96b220b0dd036392e7f69db51d234f"
"f2b6404b34d04d7dd6281800d8dcbc54f565744d9e60bdbe3e1a47dfcaeda4a3"
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
	mv "${pkgdir}/opt/rocm-7.1.1" "${pkgdir}/opt/rocm"
	# mkdir -p "${pkgdir}/opt/rocm-7.1.1/hsa"
	# ln -s "/opt/rocm-7.1.1/include/hsa" "$pkgdir/opt/rocm-7.1.1/hsa/include"
}
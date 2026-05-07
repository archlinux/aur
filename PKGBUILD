# Release notes https://rocm.docs.amd.com/en/latest/about/release-notes.html
amdgpu_repo='https://repo.radeon.com/amdgpu/7.2.3/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/7.2.3'
opencl_lib='opt/rocm-7.2.3/opencl/lib'
rocm_lib='opt/rocm-7.2.3/lib'
hip_lib='opt/rocm-7.2.3/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd-dev
pkgdesc="ROCm extra runtime and developer packages. This package needs 16.45GB of disk space."
pkgver=7.2.3
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
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/h/half/half_1.12.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/h/hiprand/hiprand_3.1.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/h/hiprand-dev/hiprand-dev_3.1.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/h/hipblas/hipblas_3.2.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/h/hipblas-dev/hipblas-dev_3.2.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/h/hipblas-common-dev/hipblas-common-dev_1.4.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/h/hipfft/hipfft_1.0.22.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/h/hipfft-dev/hipfft-dev_1.0.22.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/h/hipsolver/hipsolver_3.2.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/h/hipsolver-dev/hipsolver-dev_3.2.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/h/hipsparse/hipsparse_4.2.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/h/hipsparse-dev/hipsparse-dev_4.2.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/h/hipsparselt/hipsparselt_0.2.6.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/h/hipsparselt-dev/hipsparselt-dev_0.2.6.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/h/hiptensor/hiptensor_2.2.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/h/hiptensor-dev/hiptensor-dev_2.2.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rocfft/rocfft_1.0.36.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rocfft-dev/rocfft-dev_1.0.36.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rocrand/rocrand_4.2.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rocrand-dev/rocrand-dev_4.2.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rpp/rpp_2.2.1.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rpp-dev/rpp-dev_2.2.1.70203-90~24.04_amd64.deb"
# Missing from Ubuntu release
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rocal/rocal_2.5.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rocal-dev/rocal-dev_2.5.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rocdecode/rocdecode_1.7.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rocdecode-dev/rocdecode-dev_1.7.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rocpydecode/rocpydecode_0.8.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rocjpeg/rocjpeg_1.4.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rocjpeg-dev/rocjpeg-dev_1.4.0.70203-90~24.04_amd64.deb"
# ROCm runtime or dev
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/c/composablekernel-dev/composablekernel-dev_1.2.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/h/hipify-clang/hipify-clang_22.0.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/o/openmp-extras-runtime/openmp-extras-runtime_20.70.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rocm-cmake/rocm-cmake_0.14.0.70203-90~24.04_amd64.deb"
# Runtime but big size or dependencies of a big sized package
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/h/hipblaslt/hipblaslt_1.2.2.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/h/hipblaslt-dev/hipblaslt-dev_1.2.2.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/m/miopen-hip/miopen-hip_3.5.1.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/m/miopen-hip-dev/miopen-hip-dev_3.5.1.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/m/migraphx/migraphx_2.15.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/m/migraphx-dev/migraphx-dev_2.15.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/m/mivisionx/mivisionx_3.5.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/m/mivisionx-dev/mivisionx-dev_3.5.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rccl/rccl_2.27.7.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rccl-dev/rccl-dev_2.27.7.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rocblas/rocblas_5.2.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rocblas-dev/rocblas-dev_5.2.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rocsparse/rocsparse_4.2.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rocsparse-dev/rocsparse-dev_4.2.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rocalution/rocalution_4.1.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rocalution-dev/rocalution-dev_4.1.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rocsolver/rocsolver_3.32.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rocsolver-dev/rocsolver-dev_3.32.0.70203-90~24.04_amd64.deb"
# ROCm dev
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/h/hipcc/hipcc_1.1.1.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/h/hip-dev/hip-dev_7.2.53211.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/h/hip-samples/hip-samples_7.2.53211.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/h/hip-doc/hip-doc_7.2.53211.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/h/hipcub-dev/hipcub-dev_4.2.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/h/hipfort-dev/hipfort-dev_0.7.1.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/o/openmp-extras-dev/openmp-extras-dev_20.70.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rocm-llvm/rocm-llvm_22.0.0.26084.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rocprim-dev/rocprim-dev_4.2.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rocthrust-dev/rocthrust-dev_4.2.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rocwmma-dev/rocwmma-dev_2.2.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rocprofiler-sdk/rocprofiler-sdk_1.1.0-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rocprofiler-sdk-rocpd/rocprofiler-sdk-rocpd_1.1.0-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rocprofiler-sdk-roctx/rocprofiler-sdk-roctx_1.1.0-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rocprofiler-compute/rocprofiler-compute_3.4.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rocprofiler-systems/rocprofiler-systems_1.3.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rocshmem-dev/rocshmem-dev_3.2.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/roctracer/roctracer_4.1.70203.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/roctracer-dev/roctracer-dev_4.1.70203.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/t/transferbench-dev/transferbench-dev_1.64.00.70203-90~24.04_amd64.deb"
)

sha256sums=(
"6ca7948387b4c3e376ea07d28b181f68a538a3a4762ad539a73a64f698dd2a54"
"3a445ff754b526832f3aa8855dec2467e4e9af0489446711aa764c05f718f3ae"
"9411491f83a51d21228ea53de578e30dfbed9b90e107eb1488ff9b14c22bb680"
"14ababc3d76ac6600e23b58b0e9ef6e70eb0abde2ecafc1916159995740b4bb3"
"3ab20a17dce2a57190f27d038de379b086d7dd8ff8263b7182795ad97d02dc59"
"89fdf21d09d199a4ed428de287cf31367cf062bb32968b0ed85e0b0c298b5120"
"cd2f2c9bb2174a84feafc8cf40b1d68eb84933ff12a3c3388f69fc9506de6de0"
"834ff9c57e4e59d83eca8c5610277f4480269e6526c9e5321ad1866f90d8e154"
"76d722a86002f94e58481c91073e75a92bac3e9c2c313a72fc98aa3aceae780a"
"36357beb84145a448b6e29a736224e6847efa8f97a129052194b0a7ee54bda1d"
"4e96e58329b4f66aa9a78aeb6dff83d29f133c0c49a4ea5c3361daf8ef1402e2"
"a0a72c64b8880a2a126f906e036f4cd39ac4c16b74db3445b0b646b86e4a8a1f"
"f928d3fa42c78eea0031c246b07a6c4d6d0fd1099470d7d8979466aede12e2e6"
"335ed12fcf031a1c114b86241ee534b8cff1c3e4ea42c16ebcdde11b880528da"
"eb5339e7cdaa663d40b4bd1d8baa8e6390cdc98a0117f0b54a1d1afbc25f2677"
"6ade7b8ebe9dbad2c1defb106bd8fd241638bfde0d12279d1fec1a8d0f23590e"
"0b8a84c6361122eda9b14dd7977f3f5293453f20a126cf98eeae70fd76eaf022"
"e64354671a2eb9f3d235f7794cbf8d4fbe7f80234d93c67c7d4419bbc0039d08"
"34160f7007e84772f2cc26180dc30aea6f844afc5fdf4f4f0d7089edf4efa7b9"
"c8aef83dee96bc4e58ee5a0f9142ec5899b8341af45b84eb039f87e8635c4e3c"
"7652d6ac1f4d2a850e039ff6562cadea0654566a14d1489dba9c6aee90b56f52"
"a99303fdd1c17befc5e74ea1cfea92452181c02096bad70b40963dda3dbbb4f9"
"570affb99e44328dbdeab1f3897153430e55fb593a585ab48f75883e9c1e5a7c"
"9ce1a0b2cf00a16394006fdac08e97c83a8ab7cf6588a510359e2528307ab9ec"
"a4c6c8de016f8fc5f026c754371415a7f492dd1d4cbe93a06427184f88bbce8c"
"d89ead5c8c8fd6a1159d4d3257a6055ef6399d85cfb91e80d131caeb31e22e12"
"7f5dd7399fa54fffb962e9fa342b0c89a792c15aa6966bd4fc1c54d7c9b45528"
"7c9a4ad2a2c5467ec7984b473eaf0cb7127382114792a0cd2d7c2cf395a202a5"
"2418903cdc836ea083bb221f454c7869f957b83519da581575d8908a18ba18b9"
"209f173a90dc09f57b9fe4564ee01d2e2dabb3adae7aaa31d16481b5e4d287f0"
"aa6ca3c132cd9eea35dc413c492bd8df85341a16e1f6e1dc439fd6a34a4a1164"
"bc00c9a00548db742f7ef007a1d4d6efdbd5aaa234981975ad90aea1c7c1e804"
"80cde167fc3297062ddd28b1bbd1f3c1206d24aebdccb5fb03e29dd7f7ea9fd9"
"e21357408338b7fc5959854d66c46f28b7bfa6a91c2950588a6f0fae26a7b2d2"
"304d0aacdbcb27132846091b150712d2135d054d9fe432e6334abd22f1c8ad07"
"5d62dbbb3f54c7a2ae3b9fe154e73b2f1e6b9d950cf214de15b5bf23fc4fc0d3"
"72fd9b449b06c59fd653414ef07a0baeb55741f223572a4e7db52928449b0d34"
"9d689124a0cce05be89358c5dec05bf3f057550f3d1414ab76f5b56a44beb57d"
"3add44ad7b3f8adc0904994c5dd16f45e2c7015f73f2040a341a7983c751cc3a"
"64822b9c703894fbf3ccfb0e76e2da3c982d486b684863fd904c6060a9d66cf2"
"366eb8508654745388ea179809ea8e812d3f9ca32c90a610ec20e685943e2a6f"
"15122ac311fc8fb3bd00409a4239d082b7e78b74210c5afccbbe2ed90b8bbe6c"
"0e5649acff78a652ed521c242df889f6ad792662ec8caaa09ddd3772abde3fb0"
"2c0348d90534ede9561064892c01a935e772ff717734d7b47e00d239c954a47a"
"d89b8061b058ddc89631cff126aebe0774e6e14d99a8de0d7ed012c7cd6d4010"
"bf41f32f04f909c7c29a42dccbbebcf5b6774ae528f34df9e774a543b34d4710"
"d8f4ef7aef18aa62eced2a740f7151b0b2eed32a44d1fca9d0f6103da1252a58"
"8b976d378a319ae7e9680e9fb0f8cc36782acd2d9751040ccfe8fa56af26a3d0"
"f5bda16ebe1eee3e8319f00aaedde00e6b8b34d6cb0e1fb33eeca422ba0ce8e8"
"6e8f2405fedde90a082b4e0c4ac1a9c6042fe179b1297d7acc478fbbd2324914"
"3e87c14d1643a8efeac793afd0a02ef261813e53dbc32c54c06203751447b762"
"b8db89219ce377159132462b16d55e266e510e63566ff1ea77ed89dcb5f07fdb"
"b88ac87c1f06508fdaa5481be809148c95be2b12cb1cb8cc4357871c009a2e37"
"2208faa6724f7ec65fe18a812e8f4110291e1f4cbabc550e20a1aa702f0fbd20"
"f58e8741cfc870f29fadbadfe1513edc3de5e4daefa8967b566eeda49529c7c3"
"f2fa7af34e24f348cc648664d5c4ed693ad7746767bdafc4191313fb7021f88b"
"de013ad34a1d186942ff5d37e7f8c9797896986ca9247b354c6c59450654092c"
"e89e12b77bda08ba85e27bcac8ecae790fdd1c30f2557332daa5e576c5e98015"
"78573c4e4ed903b7608b1939c78809bf790f51134a0bf6912f5d3dd41d18f618"
"75271628810d7490e4d33fae58e7aeaff45affc3eebd604b4679a6618375f3f1"
"11efc24d3fa09c73a1abe6a0b88e1887949cebc953fbc9975f5c89ddc2adc072"
"312bf27b8e5812e35054503f067af34aa5309bb97c12808cf283118143c000fb"
"dd86c4ab2affaf382d2145631c8714122a9051f0ec2ad2a31da53ebc59ddea26"
"b4a8044865907d4fd8ed7a9d79e812c0d45779a45aedfa817ed5887130177335"
"04abba5e9ac746d134e0181cf1084986f4eb1d0d7b90c20de437a360a77f480e"
"ae95a8128c818adfb9b2c1d44bdcfb07d0f2a80d6bdbc3980bd4ff128f78a9b7"
"7a9c7da5819e27acca23894d258339efb0d13ed1726acd8987285c6635a3839c"
"423ea0d74d660758079a86521630e9493e288086553fe01a23facbc43d9dc531"
"567afd3a629352ee6fc205b41213698e8cc9c1229598a41eb1856d029c7abe52"
"c0fb43fbbda8eff8acba0578884ebf74c87f0435c216b941e7fdb2a522a30efb"
"fea9c72cd94820e8c6a1775dd206c45d00dd65ceb6b3130b25844b5bd4efddbe"
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
    mv "${pkgdir}/opt/rocm-7.2.3" "${pkgdir}/opt/rocm"
    # mkdir -p "${pkgdir}/opt/rocm-7.2.3/hsa"
    # ln -s "/opt/rocm-7.2.3/include/hsa" "$pkgdir/opt/rocm-7.2.3/hsa/include"
}
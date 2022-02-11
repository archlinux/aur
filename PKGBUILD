# Release notes https://docs.amd.com/bundle/ROCm_Release_Notes_v5.0/page/ROCm_Installation_Updates.html
major='21.50.50000'
minor='1376259'
rocm_major='50000'
rocm_minor='49'
amdgpu_repo='https://repo.radeon.com/amdgpu/21.50/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/5.0'
opencl_lib='opt/rocm-5.0/opencl/lib'
rocm_lib='opt/rocm-5.0/lib'
hip_lib='opt/rocm-5.0/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd-dev
pkgdesc="OpenCL SDK / HIP SDK / ROCM Compiler. This package needs at least 9GB of space."
pkgver=${major}.${minor}
pkgrel=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('opencl-amd')
provides=('rocm-llvm' 'hip-dev' 'hip-doc' 'hip-samples' 'rocblas' 'rocsolver' 'hipblas' 'hipblas-dev' 'rocprim-dev' 'hipcub-dev' 'rocfft' 'hipfft' 'hipfft-dev' 'hipify-clang'
	'rocsparse' 'hipsparse' 'hipsparse-dev' 'rocm-clang-ocl' 'miopen-hip' 'miopen-hip-dev' 'rccl' 'rccl-dev' 'rocrand' 'rocalution' 'rocalution-dev' 'rocblas-dev' 'rocfft-dev'
	'rocm-hip-libraries' 'rocm-hip-runtime-dev' 'rocrand-dev' 'rocsolver-dev' 'rocsparse-dev' 'rocthrust-dev' 'rocm-hip-sdk' 'miopentensile' 'miopentensile-dev' 'rocm-ml-libraries')

source=(
"https://repo.radeon.com/rocm/apt/5.0/pool/main/r/rocm-llvm/rocm-llvm_14.0.0.22051.50000_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/r/rocblas/rocblas_2.42.0.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/r/rocsolver/rocsolver_3.16.0.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/h/hipblas/hipblas_0.49.0.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/h/hipblas-dev/hipblas-dev_0.49.0.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/r/rocprim-dev/rocprim-dev_2.10.9.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/h/hipcub-dev/hipcub-dev_2.10.12.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/r/rocfft/rocfft_1.0.15.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/h/hipfft/hipfft_1.0.6.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/h/hipfft-dev/hipfft-dev_1.0.6.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/h/hipify-clang/hipify-clang_14.0.0.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/r/rocsparse/rocsparse_2.0.0.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/h/hipsparse/hipsparse_2.0.0.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/h/hipsparse-dev/hipsparse-dev_2.0.0.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/m/miopen-hip/miopen-hip_2.15.0.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/m/miopen-hip-dev/miopen-hip-dev_2.15.0.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/r/rccl/rccl_2.10.3.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/r/rccl-dev/rccl-dev_2.10.3.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/r/rocrand/rocrand_2.10.9.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/r/rocalution/rocalution_2.0.1.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/r/rocalution-dev/rocalution-dev_2.0.1.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/r/rocblas-dev/rocblas-dev_2.42.0.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/r/rocfft-dev/rocfft-dev_1.0.15.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/r/rocm-hip-libraries/rocm-hip-libraries_5.0.0.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/r/rocm-hip-runtime-dev/rocm-hip-runtime-dev_5.0.0.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/r/rocrand-dev/rocrand-dev_2.10.9.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/r/rocsolver-dev/rocsolver-dev_3.16.0.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/r/rocsparse-dev/rocsparse-dev_2.0.0.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/r/rocthrust-dev/rocthrust-dev_2.10.9.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/r/rocm-hip-sdk/rocm-hip-sdk_5.0.0.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/r/rocm-opencl-sdk/rocm-opencl-sdk_5.0.0.50000-49_amd64.deb"
# MLLIB
"https://repo.radeon.com/rocm/apt/5.0/pool/main/m/miopentensile/miopentensile_1.0.0.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/m/miopentensile-dev/miopentensile-dev_1.0.0.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/r/rocm-ml-libraries/rocm-ml-libraries_5.0.0.50000-49_amd64.deb"
)

sha256sums=(
"0dea68a2c3018eb9d256fd3092215636bd71f454f161dfe69e9a7466d6acbb50"
"207d139280d1af4dfc716f545eb2d9117c854fefe40cde8056a1ebdc67a6dd37"
"dd838e6bd29d94b1415ef4d3cfb4c410f183d42d3ed6900ed31c016494c2a7c1"
"15998d78bd85869b241f0e020bfaef12a897d5d23ebe3d286f7761fb5dc4984a"
"bc954f768b7bef4cd8b97bef7551071965e94d4d2443eb68210c0f85ab906ef0"
"d814aca5e1b651942da505bedc18cc91a514ea541d9ca41ad2e748222f854170"
"2e12fb6603c1085f67cff998546808c099c9c237825b0e2992ce4a951ad584a2"
"e2082dd757eec12766cb2d4978282b7c4c7860a00a31339edfebccc8c1ca5fca"
"afbd13812e437bc05ef45608efecd2ed71881cde31a0481bec739fdff2424094"
"0456dbbf679a40825ae28a1e1b2eca63a1a0d68f7a0c61442e541bc8af000d93"
"1c02ba04f59bc2cbe56e88ac1fbcea140c136d2376fa429848a49a3792a72015"
"24c05bd6d62f3de143253ea9b0fc89ff5d97b072a0bebf45489559a861e29b23"
"86bd6216f14e8dd3af7e54e827b3ba342801b5168259b2380ee25d2c551d89c8"
"1c925bfaf6315b5558bc272309bd6990eac88b6722ada680926eb05f2e9cd574"
"776824fea68031564560ff7aa830b1fa36afe468a2a25b856eef21a53f9ac017"
"db226a90504d65caca1b98acbff99dc632ec5bbe3588df745d8dc4ae54918ab9"
"c4f411f9040420f98f941c4410db226c25cef72edbf1cdee07d8c3c76af721bc"
"54c1f0a8d2252d980cb32d8347ce29b9eee3b0d27bcebfba351b11f556d94dfc"
"2e572dd5d1bd82057fdaeab39a926ff652a555bb0119203406caace8799894c1"
"e97a894b61f5967eaf77b0117fdcce936a247c686cdd8c94a338f135f2377c92"
"6655cfe8c01e8d7f4f8e941c68ee3529152d169201a9fb6cbd98af161af78c9e"
"b4e2d76bb6231b66bc8f27e7e09bc0e6d537f0d02bc57c26c2a9962c33114efa"
"f07aaa25f9c51cd75ae6dfc9669e2423199fbfc3662b0469e189b20010fd9cc0"
"1b17bdbddef80897869467729a94202a89e0834d58437ff7613b2de42f3b4834"
"5fac931da3eec230ac599154bd821ee3fcdf9311405670cb8f394c7e8bf2282e"
"d2f180627954e3ef4d0efd5440aff878f7cd9b52ee2553be332694fb642261bc"
"a5d8a34ebaa29fd4486bec5f8c6ed5732f20787ea3ac7bcdc424127c42bb023b"
"5bec02ef65882e41f76b108cc35f31b735a2fef343678313d7964cfcf2a88541"
"0d2f323a573b60e17f29334672447d7480f83818205b2bd830be728f5ddea10d"
"3b9887b5a7e7fc1e49f920489508058ddffe4aa13c6aaaac40a49d3f62ee94bf"
"571f49d1117469184d8b7aae8528d4022e0e18b5140552d2abbfb59f3895c728"
# MLLIB
"63a232048651df16c7a674d973c56c4e0d40e4d58e68ecd5129c871be7ae6772"
"2a7127fe2bfa2d82cea05d7503986b884835f514a09b09c3bbe5355207e838fa"
"54e788d91c96a4b29a4ef58e4e49b4ee7b74fd08c8b0344e933aba8201d59217"
)

#Extract .xz files
exz() {
	ar x $1
	tar xJf data.tar.xz
	rm data.tar.xz
}
#Extract .gz files
egz() {
	ar x $1
	tar xfx data.tar.gz
	rm data.tar.gz
}

package() {
	exz "${srcdir}/rocm-llvm_14.0.0.22051.50000_amd64.deb"
	egz "${srcdir}/rocblas_2.42.0.50000-49_amd64.deb"
	egz "${srcdir}/rocsolver_3.16.0.50000-49_amd64.deb"
	egz "${srcdir}/hipblas_0.49.0.50000-49_amd64.deb"
	egz "${srcdir}/hipblas-dev_0.49.0.50000-49_amd64.deb"
	egz "${srcdir}/rocprim-dev_2.10.9.50000-49_amd64.deb"
	egz "${srcdir}/hipcub-dev_2.10.12.50000-49_amd64.deb"
	egz "${srcdir}/rocfft_1.0.15.50000-49_amd64.deb"
	egz "${srcdir}/hipfft_1.0.6.50000-49_amd64.deb"
	egz "${srcdir}/hipfft-dev_1.0.6.50000-49_amd64.deb"
	egz "${srcdir}/hipify-clang_14.0.0.50000-49_amd64.deb"
	egz "${srcdir}/rocsparse_2.0.0.50000-49_amd64.deb"
	egz "${srcdir}/hipsparse_2.0.0.50000-49_amd64.deb"
	egz "${srcdir}/hipsparse-dev_2.0.0.50000-49_amd64.deb"
	egz "${srcdir}/miopen-hip_2.15.0.50000-49_amd64.deb"
	egz "${srcdir}/miopen-hip-dev_2.15.0.50000-49_amd64.deb"
	egz "${srcdir}/rccl_2.10.3.50000-49_amd64.deb"
	egz "${srcdir}/rccl-dev_2.10.3.50000-49_amd64.deb"
	egz "${srcdir}/rocrand_2.10.9.50000-49_amd64.deb"
	egz "${srcdir}/rocalution_2.0.1.50000-49_amd64.deb"
	egz "${srcdir}/rocalution-dev_2.0.1.50000-49_amd64.deb"
	egz "${srcdir}/rocblas-dev_2.42.0.50000-49_amd64.deb"
	egz "${srcdir}/rocfft-dev_1.0.15.50000-49_amd64.deb"
	egz "${srcdir}/rocm-hip-libraries_5.0.0.50000-49_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime-dev_5.0.0.50000-49_amd64.deb"
	egz "${srcdir}/rocrand-dev_2.10.9.50000-49_amd64.deb"
	egz "${srcdir}/rocsolver-dev_3.16.0.50000-49_amd64.deb"
	egz "${srcdir}/rocsparse-dev_2.0.0.50000-49_amd64.deb"
	egz "${srcdir}/rocthrust-dev_2.10.9.50000-49_amd64.deb"
	egz "${srcdir}/rocm-hip-sdk_5.0.0.50000-49_amd64.deb"
	egz "${srcdir}/miopentensile_1.0.0.50000-49_amd64.deb"
	egz "${srcdir}/miopentensile-dev_1.0.0.50000-49_amd64.deb"
	egz "${srcdir}/rocm-ml-libraries_5.0.0.50000-49_amd64.deb"
	mv "${srcdir}/opt/" "${pkgdir}/"
}
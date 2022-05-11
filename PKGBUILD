# Release notes https://docs.amd.com/bundle/ROCm-Release-Notes-v5.1/page/About_This_Document.html
amdgpu_install='22.10.2.50102'
amdgpu_version='22.10.2'
rocm_version='50102'
amdgpu_build_id='1411481'
rocm_build_id='55'
amdgpu_repo='https://repo.radeon.com/amdgpu/22.10.2/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/5.1.2'
opencl_lib='opt/rocm-5.1.2/opencl/lib'
rocm_lib='opt/rocm-5.1.2/lib'
hip_lib='opt/rocm-5.1.2/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd-dev
pkgdesc="OpenCL SDK / HIP SDK / ROCM Compiler. This package needs at least 10GB of space."
pkgver=${amdgpu_install}
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
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/r/rocm-llvm/rocm-llvm_14.0.0.22114.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/r/rocblas/rocblas_2.43.0.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/r/rocblas-dev/rocblas-dev_2.43.0.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/r/rocsolver/rocsolver_3.17.0.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/r/rocsolver-dev/rocsolver-dev_3.17.0.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/h/hipblas/hipblas_0.50.0.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/h/hipblas-dev/hipblas-dev_0.50.0.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/r/rocprim-dev/rocprim-dev_2.10.9.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/h/hipcub-dev/hipcub-dev_2.10.12.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/r/rocfft/rocfft_1.0.16.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/r/rocfft-dev/rocfft-dev_1.0.16.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/h/hipfft/hipfft_1.0.7.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/h/hipfft-dev/hipfft-dev_1.0.7.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/h/hipify-clang/hipify-clang_14.0.0.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/r/rocsparse/rocsparse_2.1.0.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/r/rocsparse-dev/rocsparse-dev_2.1.0.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/h/hipsparse/hipsparse_2.1.0.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/h/hipsparse-dev/hipsparse-dev_2.1.0.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/m/miopen-hip/miopen-hip_2.16.0.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/m/miopen-hip-dev/miopen-hip-dev_2.16.0.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/r/rccl/rccl_2.11.4.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/r/rccl-dev/rccl-dev_2.11.4.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/r/rocrand/rocrand_2.10.9.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/r/rocrand-dev/rocrand-dev_2.10.9.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/r/rocalution/rocalution_2.0.2.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/r/rocalution-dev/rocalution-dev_2.0.2.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/r/rocm-hip-libraries/rocm-hip-libraries_5.1.2.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/r/rocm-hip-runtime-dev/rocm-hip-runtime-dev_5.1.2.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/r/rocthrust-dev/rocthrust-dev_2.10.9.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/r/rocm-hip-sdk/rocm-hip-sdk_5.1.2.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/r/rocm-opencl-sdk/rocm-opencl-sdk_5.1.2.50102-55_amd64.deb"
# MLLIB
# "https://repo.radeon.com/rocm/apt/5.1.2/pool/main/m/miopentensile/miopentensile_1.0.0.50102-55_amd64.deb"
# "https://repo.radeon.com/rocm/apt/5.1.2/pool/main/m/miopentensile-dev/miopentensile-dev_1.0.0.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/r/rocm-ml-libraries/rocm-ml-libraries_5.1.2.50102-55_amd64.deb"
)

sha256sums=(
"4b00cc45849455c357b0662103c9189c0a61e96e116317128389fedf1604b7ed"
"bf245cad85f994ead9bbc055b2668a424fc3fed48695ea81a08c3880bbf9c692"
"e21339585cc31178fa65e4389e14bdec20f4c3173b493ec5e2d9a6d0bc09742b"
"0302384aab93a1720f33a121fe78d745f1e689dee017bfc50ea0d7cfc7b9f9a1"
"7b8c8254ebae58d6298d4bee9ae07260fcd25473bf8023ba448209f4f85afa0a"
"10301c11d60581a89060824c5b0318cc1c9d256c6a3a2f7b149a9ec1807833b3"
"d4a6e52f9a15165797c8893ddd2ae20acf9fd304834476d38aa1bcea34afa5bc"
"1bf5003e72d5d2575ee95a79cc21e65f04d7d6c58da9f04a71c086847653ddf2"
"3a677c9a444566ed7e7324f2d48632756d2f34c3871c247f3af67cbd9cd37a35"
"02bace7adb79790837863cd6c23880f64f2d91cf5eb583295bf46ab1ff14df2c"
"566b676ba711989b81c300b9aa4e3817a8f6242f2ae5b4051aef27f2f303be09"
"7522d53eba475ca50f4a85e27a6e1ea814f94f82a74d59102e8e832fbc1ffe1a"
"f087fd712b12cf95aec705a104edd5751834f1a2d77718555fa8661c58344629"
"f6643e0de3e25bfe3fd855a0487ba2fa68e30aa79245067df5741af210ce0215"
"67672724964a88ba9f36d604a0062207a341e386cd2f822019862b34a37e370e"
"0f521dafbaa474cf91054bef3e23393691748c541602278a7924f5b9e9edd2ed"
"d3f6f1a647ee81f4f97d68b1ab86c338ccb158eba4abf485312630cab2182d85"
"0742ca653556c110e99d295df3e4c1f68ebcd0e11c38e2651a6cb514ea7cec93"
"abe5e9f717e6796252d41751d4059184f660f5964ed781939e0becc2cfe75057"
"c712446fb7fca48bbe724670e543cf02e5ac0c8fde2adf3d5d72384c52835634"
"fac09bbdc492d596ddb2d7a829501ac70d21dac40c5da1da76c81fb0c13f4728"
"3250185a3db9af6e7ced17ab247be3c2d1dba898b3f5ed9a969b6c94da2440fb"
"dcda8592ab362867264d029463d310ade2a4d88e95c7587d7947b9fa4f7efffa"
"740ee73e83fadf986cdc022fb93efd9fbfb7ee3d2a13d1d3c2c9446a77318206"
"c286f26445da784602d51505a0d19d878d50b2cd214f6485047fae974fd73b79"
"145d58910701611434023e599398c38af74e5390b1d44d0336f775aa9c0910bf"
"4425739d86495b52007c9ee96e61ce66e1837202e287aed90c4b99136d7e6071"
"7f71e7a52d05f304f7e2f4ff655934ebccadbd39896504b35ee4caadbef707d7"
"dfdc558a686ebdd885199ce09b64364e62baaa715afa96e975c10f70dadc9e3a"
"8d77e76b9ff5e2615ed2a8895133e6d658399e5a75a09cf19827c7a5c0e88fe0"
"a9887918e806213b07ad84c56c01cc8772c076f74bf601b0448d6778c9bd5c3a"
# MLLIB
# "3ed0ef781041d4a25480dd76bab02b7ac05f5d437e823da463d5817dcea366ea"
# "93bc701c6bf31357e0bfaf51f855a319839d494719d335bc826fc91273bffb93"
"6473458382756bc56888a0035356368c09ad00deab6d95032af804c85fd6714f"
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
	exz "${srcdir}/rocm-llvm_14.0.0.22114.50102-55_amd64.deb"
	egz "${srcdir}/rocblas_2.43.0.50102-55_amd64.deb"
	egz "${srcdir}/rocsolver_3.17.0.50102-55_amd64.deb"
	egz "${srcdir}/hipblas_0.50.0.50102-55_amd64.deb"
	egz "${srcdir}/hipblas-dev_0.50.0.50102-55_amd64.deb"
	egz "${srcdir}/rocprim-dev_2.10.9.50102-55_amd64.deb"
	egz "${srcdir}/hipcub-dev_2.10.12.50102-55_amd64.deb"
	egz "${srcdir}/rocfft_1.0.16.50102-55_amd64.deb"
	egz "${srcdir}/hipfft_1.0.7.50102-55_amd64.deb"
	egz "${srcdir}/hipfft-dev_1.0.7.50102-55_amd64.deb"
	egz "${srcdir}/hipify-clang_14.0.0.50102-55_amd64.deb"
	egz "${srcdir}/rocsparse_2.1.0.50102-55_amd64.deb"
	egz "${srcdir}/hipsparse_2.1.0.50102-55_amd64.deb"
	egz "${srcdir}/hipsparse-dev_2.1.0.50102-55_amd64.deb"
	egz "${srcdir}/miopen-hip_2.16.0.50102-55_amd64.deb"
	egz "${srcdir}/miopen-hip-dev_2.16.0.50102-55_amd64.deb"
	egz "${srcdir}/rccl_2.11.4.50102-55_amd64.deb"
	egz "${srcdir}/rccl-dev_2.11.4.50102-55_amd64.deb"
	egz "${srcdir}/rocrand_2.10.9.50102-55_amd64.deb"
	egz "${srcdir}/rocalution_2.0.2.50102-55_amd64.deb"
	egz "${srcdir}/rocalution-dev_2.0.2.50102-55_amd64.deb"
	egz "${srcdir}/rocblas-dev_2.43.0.50102-55_amd64.deb"
	egz "${srcdir}/rocfft-dev_1.0.16.50102-55_amd64.deb"
	egz "${srcdir}/rocm-hip-libraries_5.1.2.50102-55_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime-dev_5.1.2.50102-55_amd64.deb"
	egz "${srcdir}/rocrand-dev_2.10.9.50102-55_amd64.deb"
	egz "${srcdir}/rocsolver-dev_3.17.0.50102-55_amd64.deb"
	egz "${srcdir}/rocsparse-dev_2.1.0.50102-55_amd64.deb"
	egz "${srcdir}/rocthrust-dev_2.10.9.50102-55_amd64.deb"
	egz "${srcdir}/rocm-hip-sdk_5.1.2.50102-55_amd64.deb"
	# egz "${srcdir}/miopentensile_1.0.0.50102-55_amd64.deb"
	# egz "${srcdir}/miopentensile-dev_1.0.0.50102-55_amd64.deb"	
	egz "${srcdir}/rocm-opencl-sdk_5.1.2.50102-55_amd64.deb"
	egz "${srcdir}/rocm-ml-libraries_5.1.2.50102-55_amd64.deb"
	mv "${srcdir}/opt/" "${pkgdir}/"
}
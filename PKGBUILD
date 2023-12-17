# Release notes https://rocm.docs.amd.com/en/latest/about/CHANGELOG.html#rocm-6-0-0
amdgpu_repo='https://repo.radeon.com/amdgpu/6.0/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/6.0'
opencl_lib='opt/rocm-6.0.0/opencl/lib'
rocm_lib='opt/rocm-6.0.0/lib'
hip_lib='opt/rocm-6.0.0/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd-dev
pkgdesc="OpenCL SDK / HIP SDK / ROCM Compiler. This package needs at least 10GB of space."
pkgver=6.0.0
pkgrel=1
epoch=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('opencl-amd')
provides=('amd-smi-lib' 'composablekernel-dev' 'rocm-llvm' 'rocblas' 'rocblas-dev' 'rocsolver' 'rocsolver-dev' 'half' 'hipblas' 'hipblas-dev' 'hipblaslt' 'hipblaslt-dev' 'hiprand' 'hiprand-dev' 'rocprim' 'rocprim-dev' 'hipcub' 'hipcub-dev' 'rocfft' 'rocfft-dev' 'hipfft' 'hipfft-dev'
	'hipfort' 'hipfort-dev' 'hipify-clang' 'hipsolver' 'hipsolver-dev' 'rocsparse' 'rocsparse-dev' 'hipsparse' 'hipsparse-dev' 'hiptensor' 'hiptensor-dev' 'openmp-extras-dev' 'rccl' 'rccl-dev' 'rocrand' 'rocrand-dev' 'rocalution' 'rocalution-dev'
	'rocm-hip-libraries' 'rocm-hip-runtime-dev' 'rocthrust' 'rocthrust-dev' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma-dev' 'rocm-developer-tools' 'miopen' 'miopen-hip' 'miopen-hip-dev' 'rocm-ml-libraries' 'rocm-ml-sdk')
conflicts=('amd-smi-lib' 'composablekernel-dev' 'rocm-llvm' 'rocblas' 'rocblas-dev' 'rocsolver' 'rocsolver-dev' 'hipblas' 'hipblas-dev' 'hipblaslt' 'hipblaslt-dev' 'hiprand' 'hiprand-dev' 'rocprim' 'rocprim-dev' 'hipcub' 'hipcub-dev' 'rocfft' 'rocfft-dev' 'hipfft' 'hipfft-dev'
	'hipfort' 'hipfort-dev' 'hipify-clang' 'hipsolver' 'hipsolver-dev' 'rocsparse' 'rocsparse-dev' 'hipsparse' 'hipsparse-dev' 'hiptensor' 'hiptensor-dev' 'openmp-extras-dev' 'rccl' 'rccl-dev' 'rocrand' 'rocrand-dev' 'rocalution' 'rocalution-dev'
	'rocm-hip-libraries' 'rocm-hip-runtime-dev' 'rocthrust' 'rocthrust-dev' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma-dev' 'rocm-developer-tools' 'miopen' 'miopen-hip' 'miopen-hip-dev' 'rocm-ml-libraries' 'rocm-ml-sdk')

source=(
"https://repo.radeon.com/rocm/apt/6.0/pool/main/a/amd-smi-lib/amd-smi-lib_23.4.2.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/c/composablekernel-dev/composablekernel-dev_1.1.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/h/half/half_1.12.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/h/hiprand/hiprand_2.10.16.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/h/hiprand-dev/hiprand-dev_2.10.16.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/h/hipcub-dev/hipcub-dev_3.0.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/h/hipblas/hipblas_2.0.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/h/hipblas-dev/hipblas-dev_2.0.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/h/hipblaslt/hipblaslt_0.6.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/h/hipblaslt-dev/hipblaslt-dev_0.6.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/h/hipfft/hipfft_1.0.12.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/h/hipfft-dev/hipfft-dev_1.0.12.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/h/hipfort-dev/hipfort-dev_0.4.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/h/hipsolver/hipsolver_2.0.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/h/hipsolver-dev/hipsolver-dev_2.0.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/h/hipify-clang/hipify-clang_17.0.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/h/hipsparse/hipsparse_3.0.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/h/hipsparse-dev/hipsparse-dev_3.0.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/h/hiptensor/hiptensor_1.1.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/h/hiptensor-dev/hiptensor-dev_1.1.0.60000-91~22.04_amd64.deb"
#"https://repo.radeon.com/rocm/apt/6.0/pool/main/h/hiptensor-samples/hiptensor-samples_1.1.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/o/openmp-extras-dev/openmp-extras-dev_17.60.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rocm-llvm/rocm-llvm_17.0.0.23483.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rocblas/rocblas_4.0.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rocblas-dev/rocblas-dev_4.0.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rocsolver/rocsolver_3.24.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rocsolver-dev/rocsolver-dev_3.24.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rocprim-dev/rocprim-dev_3.0.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rocfft/rocfft_1.0.23.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rocfft-dev/rocfft-dev_1.0.23.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rocsparse/rocsparse_3.0.2.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rocsparse-dev/rocsparse-dev_3.0.2.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rccl/rccl_2.18.3.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rccl-dev/rccl-dev_2.18.3.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rocrand/rocrand_2.10.17.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rocrand-dev/rocrand-dev_2.10.17.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rocalution/rocalution_3.0.3.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rocalution-dev/rocalution-dev_3.0.3.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rocm-hip-libraries/rocm-hip-libraries_6.0.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rocm-hip-runtime-dev/rocm-hip-runtime-dev_6.0.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rocthrust-dev/rocthrust-dev_3.0.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rocm-hip-sdk/rocm-hip-sdk_6.0.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rocm-opencl-sdk/rocm-opencl-sdk_6.0.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rocwmma-dev/rocwmma-dev_1.3.0.60000-91~22.04_amd64.deb"
# ML
"https://repo.radeon.com/rocm/apt/6.0/pool/main/m/miopen-hip/miopen-hip_3.00.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/m/miopen-hip-dev/miopen-hip-dev_3.00.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rocm-ml-libraries/rocm-ml-libraries_6.0.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rocm-ml-sdk/rocm-ml-sdk_6.0.0.60000-91~22.04_amd64.deb"
)

sha256sums=(
"a1366d8929b574ffda05cc62ee1eb9b9d972cbddd95862c9b12e5227335f12c8"
"4a0beb93b010823b232fd89189a704c8fdd4b3a1485242a553add2307c5d8c43"
"68a4637de93c98f5f71f73eb87a81de83dc028266206eccbd6d4cc29f0031ebf"
"7c671d54b4d03fd2d96541b0e14f71897d2705c608f51cb2cbcbf9b460537ed7"
"a05586f3cba8abce56fbb6ce493444f965c4c671efa0be1256a905096532b845"
"f7317aa5dca410ddf233ae1d9ef86316beef83225c4d249cf36080c323bf70b7"
"0dc4e4d300f4ff3485a44edfb76827a94d29c17688c2c176bcaf7e5696b4f944"
"5f61053b65c95aed8150b1000fb99f78f4b76e70bfaffcf7a5fcfd926fd872b1"
"7f403c30415de6c16ad60c27d059da3e1a35c09811a14681158c037fb6910f63"
"306751ffa5e2cbe046edea3044fcada8f1807a8f00bbf3a93e946a8fc708d0b2"
"950f8c3b09d1ea9a215ecf8dbc01b08444325bd249976e607f329f5acebb6656"
"78da28dceda2b9a9fb2cbf4f48e6d322cb1ab597fe749b3f65d78501780ef4e8"
"5fc928323ea069b52cbc9c44bc318510364f018d7365e04f556b5362124710f1"
"a47e16595e65c7a73cc945a0639b0c67f9933d97b17aa161a3cd2c4bf22d86dd"
"911492b550834d17e42ab7fd92cec97dcea7c9004c0173935b6863f2d4419ecf"
"ffdc1f37b9a1c980323c8067e51dd21f9e20cc5eb954ae98f3c8e4dc705bb501"
"a0fbab6a163286ae08030a3502a813a3e447fec44280f2bb1cd5a11fd78bdf20"
"4ae5d1f8a4fe11fe8abcd78a131b4460b729c6673d30e6d27ce29e4e44a126d1"
"03a6bb05ac18b8838ce6b79bfe8f29f69f93232d57c5f03662654794884ca250"
"e42441fac630518853182edc9771f61452673bdb721ba52ee2dafd9a05246c00"
#"2c2bb011e24eaf7a4604a5496c024776e2db026bfc11e8f5c8748ad355655353"
"0a85ee87e43c728c9575702feafe3f291773b919b5f669242e04d80fed7170c2"
"1a04234fea71807e7998663b264eef10fce6c920fc6c5f3a09063ee02b5b36da"
"b125eaaab6a2853c4a7f3e67941891e5a4b22a69bfdcdae44b3f8c9629d5c845"
"f6c751aa80ed47a18888babcbe85bbe3784395e703f1379869c190ceef93aedb"
"ba0389cb1def84d8624264fac1f0cdd31806431ef612fdfa457a3e34d8ffe343"
"93482bbe93061972ea8338855ffc3251eaf717d6fc4c6f027527e9a64e5a1ed0"
"06ba9bccd07ce14e3eef59ed7b2f15a35a734483bd1544e717d53ab818eed7ba"
"d7445c0ae54872461249c5020368ecd3d77fdc321e1fe86cb54a469add0e080d"
"a6cc1d8a8d53a5a0dd50261721eb9cb2ee67fa294e683fc23a0e365ae490365e"
"a9e0fd3aad0b2b17b7d5576ef4a5e385bcce53e7d2858e97bb619dbda0c92f00"
"2c678b207faa33ede8ddeae24f37ca529a4d152ad5fcb1d5accee313d225dc10"
"da4d6a10836ebbc61368cba24148444174f5fc7517d85192265f2a74f6640e58"
"5cc1450dfc65b1fe3820eab6e20203235fe8b15cd273dbaac8f135eebc69f56c"
"9a24902de78f9e8e20f6a9b4eb8b6be1c53f7fc88ed04e92b3ee6a43bf51e9d7"
"191b30c019ae3f6871bfc61a3c2d098d8de98462f9949d831174fc4cee494529"
"6c507df1c93c8bf346fad059ef9b45afeac53fae9b6a0c8acac22a7917117ff9"
"607c96d4381cbf71510a3f13329125f5a1510bc164a6c7003adaeea607e0ab3a"
"d2a5723e1e7f76763306cb934307358d356710f492163a6193807340afe13e17"
"bc88b3dc0923001856e9053b851c51273367e6cb5dc8a2c2c212cdad0d1ad69e"
"7d6005bafed983c8365173305402ab976bdb4ecdb7dfa149fdd8f46533f30837"
"6687ea5ba86eea34b6817b01d98c271541719dc1a8566c3e68580404b84f7e56"
"f5b4765a1b7d3294c73147dbe6036a062a68a95c473f452a9636e609efef110b"
"1093c4bcd785a71a8e6b6b9575e41e6e98051ea2483f090591923d5b632307d4"
# ML
"ea2e2521d4ddf602db4458f569fe0c9dd3e3f56774d5b8eb36f8e1c1bfd575e6"
"2952c5efc7cb4a52947a8be4296dc1e0145ff91ad654aa889be1a4fa6fbbc2ca"
"99f738458a5dd21596c9b753dedbf9e15eb3aae2e5666280e77ab783f8d7e00d"
"482d136ffa29cbbdbe542d2a2974f387cb5f2c3be81f9e645c642993af2d9ead"
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
	egz "${srcdir}/amd-smi-lib_23.4.2.60000-91~22.04_amd64.deb"
	exz "${srcdir}/composablekernel-dev_1.1.0.60000-91~22.04_amd64.deb"
	exz "${srcdir}/half_1.12.0.60000-91~22.04_amd64.deb"
	exz "${srcdir}/hiprand_2.10.16.60000-91~22.04_amd64.deb"
	exz "${srcdir}/hiprand-dev_2.10.16.60000-91~22.04_amd64.deb"
	exz "${srcdir}/hipblas_2.0.0.60000-91~22.04_amd64.deb"
	exz "${srcdir}/hipblas-dev_2.0.0.60000-91~22.04_amd64.deb"
	exz "${srcdir}/hipblaslt_0.6.0.60000-91~22.04_amd64.deb"
	exz "${srcdir}/hipblaslt-dev_0.6.0.60000-91~22.04_amd64.deb"
	exz "${srcdir}/hipcub-dev_3.0.0.60000-91~22.04_amd64.deb"
	exz "${srcdir}/hipfft_1.0.12.60000-91~22.04_amd64.deb"
	exz "${srcdir}/hipfft-dev_1.0.12.60000-91~22.04_amd64.deb"	
	exz "${srcdir}/hipfort-dev_0.4.0.60000-91~22.04_amd64.deb"
	exz "${srcdir}/hipsolver_2.0.0.60000-91~22.04_amd64.deb"
	exz "${srcdir}/hipsolver-dev_2.0.0.60000-91~22.04_amd64.deb"
	egz "${srcdir}/hipify-clang_17.0.0.60000-91~22.04_amd64.deb"
	exz "${srcdir}/hipsparse_3.0.0.60000-91~22.04_amd64.deb"
	exz "${srcdir}/hipsparse-dev_3.0.0.60000-91~22.04_amd64.deb"
	exz "${srcdir}/hiptensor_1.1.0.60000-91~22.04_amd64.deb"
	exz "${srcdir}/hiptensor-dev_1.1.0.60000-91~22.04_amd64.deb"
	#exz "${srcdir}/hiptensor-samples_1.1.0.60000-91~22.04_amd64.deb"
	exz "${srcdir}/miopen-hip_3.00.0.60000-91~22.04_amd64.deb"
	exz "${srcdir}/miopen-hip-dev_3.00.0.60000-91~22.04_amd64.deb"
	egz "${srcdir}/openmp-extras-dev_17.60.0.60000-91~22.04_amd64.deb"
	egz "${srcdir}/rocm-llvm_17.0.0.23483.60000-91~22.04_amd64.deb"
	exz "${srcdir}/rocblas_4.0.0.60000-91~22.04_amd64.deb"
	exz "${srcdir}/rocblas-dev_4.0.0.60000-91~22.04_amd64.deb"
	exz "${srcdir}/rocprim-dev_3.0.0.60000-91~22.04_amd64.deb"
	exz "${srcdir}/rocfft_1.0.23.60000-91~22.04_amd64.deb"
	exz "${srcdir}/rocfft-dev_1.0.23.60000-91~22.04_amd64.deb"
	exz "${srcdir}/rocsparse_3.0.2.60000-91~22.04_amd64.deb"
	exz "${srcdir}/rocsparse-dev_3.0.2.60000-91~22.04_amd64.deb"
	exz "${srcdir}/rccl_2.18.3.60000-91~22.04_amd64.deb"
	exz "${srcdir}/rccl-dev_2.18.3.60000-91~22.04_amd64.deb"
	exz "${srcdir}/rocrand_2.10.17.60000-91~22.04_amd64.deb"
	exz "${srcdir}/rocrand-dev_2.10.17.60000-91~22.04_amd64.deb"
	exz "${srcdir}/rocalution_3.0.3.60000-91~22.04_amd64.deb"
	exz "${srcdir}/rocalution-dev_3.0.3.60000-91~22.04_amd64.deb"	
	egz "${srcdir}/rocm-hip-libraries_6.0.0.60000-91~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime-dev_6.0.0.60000-91~22.04_amd64.deb"
	exz "${srcdir}/rocsolver_3.24.0.60000-91~22.04_amd64.deb"
	exz "${srcdir}/rocsolver-dev_3.24.0.60000-91~22.04_amd64.deb"	
	exz "${srcdir}/rocthrust-dev_3.0.0.60000-91~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-sdk_6.0.0.60000-91~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-sdk_6.0.0.60000-91~22.04_amd64.deb"
	exz "${srcdir}/rocwmma-dev_1.3.0.60000-91~22.04_amd64.deb"	
	egz "${srcdir}/rocm-ml-libraries_6.0.0.60000-91~22.04_amd64.deb"	
	egz "${srcdir}/rocm-ml-sdk_6.0.0.60000-91~22.04_amd64.deb"
	
	mv "${srcdir}/opt/" "${pkgdir}/"
	# mkdir -p "${pkgdir}/opt/rocm-6.0.0/hsa"
	# ln -s "/opt/rocm-6.0.0/include/hsa" "$pkgdir/opt/rocm-6.0.0/hsa/include"
}
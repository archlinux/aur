# Release notes https://docs.amd.com/bundle/ROCm-Release-Notes-v5.5.1/page/About_This_Document.html
amdgpu_repo='https://repo.radeon.com/amdgpu/5.5.1/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/5.5'
opencl_lib='opt/rocm-5.5.1/opencl/lib'
rocm_lib='opt/rocm-5.5.1/lib'
hip_lib='opt/rocm-5.5.1/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd-dev
pkgdesc="OpenCL SDK / HIP SDK / ROCM Compiler. This package needs at least 10GB of space."
pkgver=5.5.1
pkgrel=1
epoch=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('opencl-amd')
provides=('rocm-llvm' 'rocblas' 'rocblas-dev' 'rocsolver' 'rocsolver-dev' 'hipblas' 'hipblas-dev' 'rocprim' 'rocprim-dev' 'hipcub' 'hipcub-dev' 'rocfft' 'rocfft-dev' 'hipfft' 'hipfft-dev' 'hipfort' 'hipfort-dev' 
	'hipify-clang' 'hipsolver' 'hipsolver-dev' 'rocsparse' 'rocsparse-dev' 'hipsparse' 'hipsparse-dev' 'openmp-extras-dev' 'rccl' 'rccl-dev' 'rocrand' 'rocrand-dev' 'rocalution' 'rocalution-dev' 'rocm-hip-libraries' 
	'rocm-hip-runtime-dev' 'rocthrust' 'rocthrust-dev' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma-dev' 'rocm-developer-tools' 'miopen' 'miopen-hip' 'miopen-hip-dev' 'rocm-ml-libraries' 'rocm-ml-sdk')
conflicts=('rocm-llvm' 'rocblas' 'rocblas-dev' 'rocsolver' 'rocsolver-dev' 'hipblas' 'hipblas-dev' 'rocprim' 'rocprim-dev' 'hipcub' 'hipcub-dev' 'rocfft' 'rocfft-dev' 'hipfft' 'hipfft-dev' 'hipfort' 'hipfort-dev' 
	'hipify-clang' 'hipsolver' 'hipsolver-dev' 'rocsparse' 'rocsparse-dev' 'hipsparse' 'hipsparse-dev' 'openmp-extras-dev' 'rccl' 'rccl-dev' 'rocrand' 'rocrand-dev' 'rocalution' 'rocalution-dev' 'rocm-hip-libraries' 
	'rocm-hip-runtime-dev' 'rocthrust' 'rocthrust-dev' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma-dev' 'rocm-developer-tools' 'miopen' 'miopen-hip' 'miopen-hip-dev' 'rocm-ml-libraries' 'rocm-ml-sdk')

source=(
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/o/openmp-extras-dev/openmp-extras-dev_15.55.0.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rocm-llvm/rocm-llvm_16.0.0.23194.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rocblas/rocblas_2.47.0.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rocblas-dev/rocblas-dev_2.47.0.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rocsolver/rocsolver_3.21.0.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rocsolver-dev/rocsolver-dev_3.21.0.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/h/hipblas/hipblas_0.54.0.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/h/hipblas-dev/hipblas-dev_0.54.0.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rocprim-dev/rocprim-dev_2.10.9.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/h/hipcub-dev/hipcub-dev_2.10.12.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rocfft/rocfft_1.0.21.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rocfft-dev/rocfft-dev_1.0.21.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/h/hipfft/hipfft_1.0.11.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/h/hipfft-dev/hipfft-dev_1.0.11.50501-74~22.04_amd64.deb"
#"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/h/hipfort/hipfort_0.4.0.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/h/hipfort-dev/hipfort-dev_0.4.0.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/h/hipsolver/hipsolver_1.7.0.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/h/hipsolver-dev/hipsolver-dev_1.7.0.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/h/hipify-clang/hipify-clang_16.0.0.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rocsparse/rocsparse_2.5.1.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rocsparse-dev/rocsparse-dev_2.5.1.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/h/hipsparse/hipsparse_2.3.6.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/h/hipsparse-dev/hipsparse-dev_2.3.6.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rccl/rccl_2.15.5.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rccl-dev/rccl-dev_2.15.5.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rocrand/rocrand_2.10.16.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rocrand-dev/rocrand-dev_2.10.16.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rocalution/rocalution_2.1.8.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rocalution-dev/rocalution-dev_2.1.8.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rocm-hip-libraries/rocm-hip-libraries_5.5.1.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rocm-hip-runtime-dev/rocm-hip-runtime-dev_5.5.1.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rocthrust-dev/rocthrust-dev_2.10.9.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rocm-hip-sdk/rocm-hip-sdk_5.5.1.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rocm-opencl-sdk/rocm-opencl-sdk_5.5.1.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rocwmma-dev/rocwmma-dev_0.7.0.50501-74~22.04_amd64.deb"
#"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rocm-developer-tools/rocm-developer-tools_5.4.3.50501-74~22.04_amd64.deb"
# ML
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/m/miopen-hip/miopen-hip_2.19.0.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/m/miopen-hip-dev/miopen-hip-dev_2.19.0.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rocm-ml-libraries/rocm-ml-libraries_5.5.1.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rocm-ml-sdk/rocm-ml-sdk_5.5.1.50501-74~22.04_amd64.deb"
)

sha256sums=(
"d9ab747fea34bfff3eb0168aaa7e3ab35607a289247f68d54d8b4dec47e37873"
"7252b9ca29fe93fa40b53cb5c70bab3ab577e5c21559ecccd7c9654592adc55a"
"d245b36c6b80bb89388c97b705c5ad0562b442dcdc8df93ca2410e2c53e7b8b2"
"b9e50a32d5f52b77613f4d2502de6feac99b06de8e999feb8345da513ea12baf"
"e76e388f34187abb94089ccbffe36a7c5c54d984a1b4aa808127f78162b71ae0"
"cb91408bcc8cd4e4c4df0a9045b91657375910b249a25f266132545d5cc9bcf9"
"a8872c463ced529a6e2588fc8e8fb6ed4db6a3f1eaeac35f1b80de915e122004"
"c9aeb30dd5f8b5812067383fdaa437828111056dfdba0e731678dc001999510a"
"c06d8469dc1ff58268f4246ca49bca2fd82d43008a6c422f6828b32926e0dbaf"
"bb9ec6fce1812fa82a8fcb1cc1ca29295f0df4ded89cc8d17b04757465ed5cee"
"13b6efea599c5bc9f75d974719e0bfb2088d880b872209c50a980a96d15505be"
"9cf2f71642fafd6d5427e17754506d78ef63571e2a4b981de9a134bb68e32262"
"70eb976d7e5822603e0021a943cfa4418927abb520675dfa720ce8cfecbcc4d2"
"5dbbb679b6d05644b8c3bd81474ea27209287f5433529f0248e0c2ca8d9a59c0"
"91abbd44799969fd963fc693b5c4919b669135b179a5697a5b94e922143fa2c5"
#"2c2bb011e24eaf7a4604a5496c024776e2db026bfc11e8f5c8748ad355655353"
"9d58cc03810b6855428eec94430f02b69fa44efdc6e78290a7043c4538c5e755"
"0d1f93f5ff28973d31ed59e4f7edaaafc26d94ec40a26a89d8f50402cd331146"
"3dabc4f414dc6bcbb9990a489b05554f2ce2a9b0ef24d043e76a68793eb008d8"
"5f5fd2e41ce9e1bc417cd49a943caf29b09a73ccacb41f0a669a56654d907a17"
"38866086306f6a080e2010fabf6c3e0cd5d3fa520bf213bd3fe261e722d1cc14"
"c3b23983097cd62bd81d3ff6ad737dbfc87f09841b0f86230d556983bb0b6e2e"
"98404953c6700c0378a43bbd8d270c8e4eb8abb35504a2ad2fa77dbde516a811"
"2bd167e21552db3143d8a3f2277c9488ce30d13dcf221ccf17ab6f4016a10094"
"f67699c312ccb739350983f9251560dc8f8df69adeb80e43b5ca356fca8f8432"
"e1b0eb1150f969f924858a2e43f29fd163cc5dea2a23f4c296fdd06f6adcd538"
"c749cdbaaba3bb0ff07bd457e46ef3df08204a9c198415e1b15b4fe191c23d61"
"60f6127ab2175d6c8c7987061f24bcd967c3a9bc861b23c3ac56fa172a55ea3c"
"3aab7e470aab2923970cfc34a13a3e37d6e91911fc7aeceaea38bef02dcc6c8f"
"a715c295adbdfb9203906ef957ec525940ef3420139222551131a2143b6cd3b7"
"3f5c5ab2fcdbe137660c8e93b9ba65e41a18b0c57b992b7250e64a396ce2f9c7"
"a17d6ac04cff2b3c67ac258f292742959a2efa8f9717ccaf63b55fdb7fa2d735"
"fbdf19040b7ab8c977cac800b7fee268835d2b6c31d7c7aca5b8c9395bbd196b"
"09900136b946d318972cabd4e1ec71506e3388b78c62bf4920f079bb9b6dcdd1"
"190b53a3ad11e1f04d488e9de030fc03c09aac27d3240b9dc5668fc5def9e12e"
# "4bba416791003fb689db8e9ebc68c15eac2951be98c4c5b9d09c40f202748d23"
# ML
"9f4b0a5831e31380cf09be4e5f73a4195c7170e55db6d55ed8021859049f009c"
"959f3a6efd44cdcfcdcb9a9d9c5d4b45a576a87dbc443545046e757bba424d3c"
"feef4e6fe2eb9c0a9762fa9b9814dd6136bc7c7107e9a63a3235c0c8de57afab"
"f6a4acc0b2cf3f4ab35398674e7c653a3363e710599c48a8804c80e018e5e879"
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
	egz "${srcdir}/openmp-extras-dev_15.55.0.50501-74~22.04_amd64.deb"
	egz "${srcdir}/rocm-llvm_16.0.0.23194.50501-74~22.04_amd64.deb"
	exz "${srcdir}/rocblas_2.47.0.50501-74~22.04_amd64.deb"
	exz "${srcdir}/rocblas-dev_2.47.0.50501-74~22.04_amd64.deb"
	exz "${srcdir}/hipblas_0.54.0.50501-74~22.04_amd64.deb"
	exz "${srcdir}/hipblas-dev_0.54.0.50501-74~22.04_amd64.deb"
	exz "${srcdir}/rocprim-dev_2.10.9.50501-74~22.04_amd64.deb"
	exz "${srcdir}/hipcub-dev_2.10.12.50501-74~22.04_amd64.deb"
	exz "${srcdir}/rocfft_1.0.21.50501-74~22.04_amd64.deb"
	exz "${srcdir}/rocfft-dev_1.0.21.50501-74~22.04_amd64.deb"
	exz "${srcdir}/hipfft_1.0.11.50501-74~22.04_amd64.deb"
	exz "${srcdir}/hipfft-dev_1.0.11.50501-74~22.04_amd64.deb"
	#exz "${srcdir}/hipfort_0.4.0.50501-74~22.04_amd64.deb"
	exz "${srcdir}/hipfort-dev_0.4.0.50501-74~22.04_amd64.deb"
	exz "${srcdir}/hipsolver_1.7.0.50501-74~22.04_amd64.deb"
	exz "${srcdir}/hipsolver-dev_1.7.0.50501-74~22.04_amd64.deb"
	egz "${srcdir}/hipify-clang_16.0.0.50501-74~22.04_amd64.deb"
	exz "${srcdir}/rocsparse_2.5.1.50501-74~22.04_amd64.deb"
	exz "${srcdir}/rocsparse-dev_2.5.1.50501-74~22.04_amd64.deb"
	exz "${srcdir}/hipsparse_2.3.6.50501-74~22.04_amd64.deb"
	exz "${srcdir}/hipsparse-dev_2.3.6.50501-74~22.04_amd64.deb"
	exz "${srcdir}/miopen-hip_2.19.0.50501-74~22.04_amd64.deb"
	exz "${srcdir}/miopen-hip-dev_2.19.0.50501-74~22.04_amd64.deb"
	exz "${srcdir}/rccl_2.15.5.50501-74~22.04_amd64.deb"
	exz "${srcdir}/rccl-dev_2.15.5.50501-74~22.04_amd64.deb"
	exz "${srcdir}/rocrand_2.10.16.50501-74~22.04_amd64.deb"
	exz "${srcdir}/rocrand-dev_2.10.16.50501-74~22.04_amd64.deb"
	exz "${srcdir}/rocalution_2.1.8.50501-74~22.04_amd64.deb"
	exz "${srcdir}/rocalution-dev_2.1.8.50501-74~22.04_amd64.deb"	
	egz "${srcdir}/rocm-hip-libraries_5.5.1.50501-74~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime-dev_5.5.1.50501-74~22.04_amd64.deb"	
	exz "${srcdir}/rocsolver_3.21.0.50501-74~22.04_amd64.deb"
	exz "${srcdir}/rocsolver-dev_3.21.0.50501-74~22.04_amd64.deb"	
	exz "${srcdir}/rocthrust-dev_2.10.9.50501-74~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-sdk_5.5.1.50501-74~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-sdk_5.5.1.50501-74~22.04_amd64.deb"
	exz "${srcdir}/rocwmma-dev_0.7.0.50501-74~22.04_amd64.deb"
	# egz "${srcdir}/rocm-developer-tools_5.4.3.50501-74~22.04_amd64.deb"
	egz "${srcdir}/rocm-ml-libraries_5.5.1.50501-74~22.04_amd64.deb"	
	egz "${srcdir}/rocm-ml-sdk_5.5.1.50501-74~22.04_amd64.deb"
	
	mv "${srcdir}/opt/" "${pkgdir}/"
	# mkdir -p "${pkgdir}/opt/rocm-5.5.1/hsa"
	# ln -s "/opt/rocm-5.5.1/include/hsa" "$pkgdir/opt/rocm-5.5.1/hsa/include"
}
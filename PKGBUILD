# Maintainer: George Sofianos <george at sofianos dot dev>

# Release notes https://rocm.docs.amd.com/en/7.10.0-preview/about/release-notes.html
pkgname=rocm-gfx1150-bin
pkgdesc="ROCm Core SDK and TheRock Build System - Ryzen AI"
pkgver=7.10.0pre
pkgrel=1
epoch=0
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('libdrm' 'ocl-icd' 'gcc-libs' 'numactl' 'suitesparse' 'blas' 'lapack')
provides=('opencl-driver' 'rocm' 'rocm-core' 'comgr' 'rocm-hip' 'hip' 'hsa-rocr' 'hsa-rocr-dev' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 'rocm-hip-runtime' 'rocm-ocl-icd' 'rocm-opencl-icd-loader' 'rocm-opencl' 'rocm-opencl-dev' 'rocm-opencl-runtime' 'rocm-dbgapi' 'rocm-debug-agent' 'rocm-gdb'
	 'rocprofiler' 'rocprofiler-dev' 'rocprofiler-plugins' 'rocprofiler-register' 'roctracer' 'roctracer-dev' 'hsa-amd-aqlprofile' 'rocm-openmp' 'openmp-extras-runtime' 'rocm-cmake' 'rocm-smi-lib' 'amdsmi' 'amd-smi-lib' 'composablekernel-dev' 'hip-dev' 'hip-doc' 'hip-samples' 'hipcc' 'rocm-llvm' 'rocblas' 'rocblas-dev' 'rocsolver' 'rocsolver-dev' 'half' 'hipblas' 'hipblas-dev' 'hipblas-common' 'hipblas-common-dev' 'hipblaslt' 'hipblaslt-dev' 'hiprand' 'hiprand-dev' 
'rocdecode' 'rocdecode-dev' 'rocjpeg' 'rocjpeg-dev' 'rocprim' 'rocprim-dev' 'hipcub' 'hipcub-dev' 'rocfft' 'rocfft-dev' 'hipfft' 'hipfft-dev' 'hipfort' 'hipfort-dev' 'hipify-clang' 'hipsolver' 'hipsolver-dev' 'rocsparse' 'rocsparse-dev' 'hipsparse' 'hipsparse-dev' 'hipsparselt' 'hipsparselt-dev' 'hiptensor' 'hiptensor-dev' 'openmp-extras-dev' 'rccl' 'rccl-dev' 'rocrand' 'rocrand-dev' 'rocalution' 'rocalution-dev'	'rocm-hip-libraries' 'rocm-hip-runtime-dev' 'rocthrust' 'rocthrust-dev' 'rocprofiler-compute' 'rocprofiler-debug'
'rocprofiler-systems' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma-dev' 'rocprofiler-sdk' 'rocprofiler-sdk-roctx' 'rocprofiler-sdk-rocpd' 'rocm-developer-tools' 'rocshmem' 'rocshmem-dev' 'migraphx' 'migraphx-dev' 'miopen' 'miopen-hip' 'miopen-hip-dev' 'mivisionx' 'mivisionx-dev' 'rocm-ml-libraries'
'rocm-ml-sdk' 'rpp' 'rpp-dev')
conflicts=('opencl-amd' 'opencl-amd-dev' 'rocm-gfx110X-bin' 'rocm-opencl-runtime' 'rocm' 'rocm-core' 'comgr' 'rocm-hip' 'hip' 'hsa-rocr' 'hsa-rocr-dev' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 'rocm-hip-runtime' 'rocm-ocl-icd' 'rocm-opencl-icd-loader' 'rocm-opencl' 'rocm-opencl-dev' 'rocm-opencl-runtime' 'rocm-dbgapi' 'rocm-debug-agent' 'rocm-gdb'
	 'rocprofiler' 'rocprofiler-dev' 'rocprofiler-plugins' 'rocprofiler-register' 'roctracer' 'roctracer-dev' 'hsa-amd-aqlprofile' 'rocm-openmp' 'openmp-extras-runtime' 'rocm-cmake' 'rocm-smi-lib' 'amdsmi' 'amd-smi-lib' 'composablekernel-dev' 'hip-dev' 'hip-doc' 'hip-samples' 'hipcc' 'rocm-llvm' 'rocblas' 'rocblas-dev' 'rocsolver' 'rocsolver-dev' 'hipblas' 'hipblas-dev' 'hipblas-common' 'hipblas-common-dev' 'hipblaslt' 'hipblaslt-dev' 'hiprand' 'hiprand-dev'
'rocdecode' 'rocdecode-dev' 'rocjpeg' 'rocjpeg-dev' 'rocprim' 'rocprim-dev' 'hipcub' 'hipcub-dev' 'rocfft' 'rocfft-dev' 'hipfft' 'hipfft-dev' 'hipfort' 'hipfort-dev' 'hipify-clang' 'hipsolver' 'hipsolver-dev' 'rocsparse' 'rocsparse-dev' 'hipsparse' 'hipsparse-dev' 'hipsparselt' 'hipsparselt-dev' 'hiptensor' 'hiptensor-dev' 'openmp-extras-dev' 'rccl' 'rccl-dev' 'rocrand' 'rocrand-dev' 'rocalution' 'rocalution-dev' 'rocm-hip-libraries' 'rocm-hip-runtime-dev' 'rocthrust' 'rocthrust-dev' 'rocprofiler-compute' 'rocprofiler-debug'
'rocprofiler-systems' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma-dev' 'rocprofiler-sdk' 'rocprofiler-sdk-roctx' 'rocprofiler-sdk-rocpd' 'rocm-developer-tools' 'rocshmem' 'rocshmem-dev' 'migraphx' 'migraphx-dev' 'miopen' 'miopen-hip' 'miopen-hip-dev' 'mivisionx' 'mivisionx-dev' 'rocm-ml-libraries'
'rocm-ml-sdk' 'rpp' 'rpp-dev')
optdepends=('clinfo')

source=(
"https://repo.amd.com/rocm/tarball/therock-dist-linux-gfx1150-7.10.0.tar.gz"
)

sha256sums=(
"14ff3c2124c45bdb5b03668456b32d2c0584c1cd6fb6997aa7fc14861110235a"
)

package() {

	mkdir -p "${srcdir}/opt/rocm"
	tar xf therock-dist-linux-gfx1150-7.10.0.tar.gz -C ${srcdir}/opt/rocm

	mv "${srcdir}/opt/" "${pkgdir}/"
	#mv "${pkgdir}/opt/rocm-7.1.1" "${pkgdir}/opt/rocm"	

	#mkdir -p "${pkgdir}/opt/amdgpu/share/libdrm"
	#cd "${pkgdir}/opt/amdgpu/share/libdrm"
	#ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids		

	mkdir -p "${pkgdir}/etc/OpenCL/vendors"
	echo libamdocl64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"

	mkdir -p "${pkgdir}/etc/ld.so.conf.d"
	echo /opt/rocm/lib >> "$pkgdir/etc/ld.so.conf.d/rocm-bin.conf"
	echo /opt/rocm/hip/lib >> "$pkgdir/etc/ld.so.conf.d/rocm-bin.conf"

	mkdir -p "${pkgdir}/etc/profile.d"
	echo export PATH="\${PATH}:/opt/rocm/bin:/opt/rocm/hip/bin" > "$pkgdir/etc/profile.d/rocm-bin.sh"
}

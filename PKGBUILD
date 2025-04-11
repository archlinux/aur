# Release notes https://rocm.docs.amd.com/en/latest/about/release-notes.html
amdgpu_repo='https://repo.radeon.com/amdgpu/6.4/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/6.3.2'
opencl_lib='opt/rocm-6.4.0/opencl/lib'
rocm_lib='opt/rocm-6.4.0/lib'
hip_lib='opt/rocm-6.4.0/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd-dev
pkgdesc="OpenCL SDK / HIP SDK / ROCM Compiler. This package needs at least 20GB of disk space."
pkgver=6.4.0
pkgrel=1
epoch=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('opencl-amd' 'suitesparse' 'blas' 'lapack')
provides=('composablekernel-dev' 'rocm-llvm' 'rocblas' 'rocblas-dev' 'rocsolver' 'rocsolver-dev' 'half' 'hipblas' 'hipblas-dev' 'hipblas-common-dev' 'hipblaslt' 'hipblaslt-dev' 'hiprand' 'hiprand-dev' 'rocprim' 'rocprim-dev' 'hipcub' 'hipcub-dev' 'rocfft' 'rocfft-dev' 'hipfft' 'hipfft-dev'
	'hipfort' 'hipfort-dev' 'hipify-clang' 'hipsolver' 'hipsolver-dev' 'rocsparse' 'rocsparse-dev' 'hipsparse' 'hipsparse-dev' 'hipsparselt' 'hipsparselt-dev' 'hiptensor' 'hiptensor-dev' 'openmp-extras-dev' 'rccl' 'rccl-dev' 'rocrand' 'rocrand-dev' 'rocalution' 'rocalution-dev'
	'rocm-hip-libraries' 'rocm-hip-runtime-dev' 'rocthrust' 'rocthrust-dev' 'rocprofiler-compute' 'rocprofiler-systems' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma-dev' 'rocprofiler-sdk' 'rocprofiler-sdk-roctx' 'rocm-developer-tools' 'migraphx' 'migraphx-dev' 'miopen' 'miopen-hip' 'miopen-hip-dev' 'mivisionx' 'mivisionx-dev' 'rocm-ml-libraries' 'rocm-ml-sdk' 'rpp' 'rpp-dev')
conflicts=('composablekernel-dev' 'rocm-llvm' 'rocblas' 'rocblas-dev' 'rocsolver' 'rocsolver-dev' 'hipblas' 'hipblas-dev' 'hipblas-common-dev' 'hipblaslt' 'hipblaslt-dev' 'hiprand' 'hiprand-dev' 'rocprim' 'rocprim-dev' 'hipcub' 'hipcub-dev' 'rocfft' 'rocfft-dev' 'hipfft' 'hipfft-dev'
	'hipfort' 'hipfort-dev' 'hipify-clang' 'hipsolver' 'hipsolver-dev' 'rocsparse' 'rocsparse-dev' 'hipsparse' 'hipsparse-dev' 'hipsparselt' 'hipsparselt-dev' 'hiptensor' 'hiptensor-dev' 'openmp-extras-dev' 'rccl' 'rccl-dev' 'rocrand' 'rocrand-dev' 'rocalution' 'rocalution-dev'
	'rocm-hip-libraries' 'rocm-hip-runtime-dev' 'rocthrust' 'rocthrust-dev' 'rocprofiler-compute' 'rocprofiler-systems' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma-dev' 'rocprofiler-sdk' 'rocprofiler-sdk-roctx' 'rocm-developer-tools' 'migraphx' 'migraphx-dev' 'miopen' 'miopen-hip' 'miopen-hip-dev' 'mivisionx' 'mivisionx-dev' 'rocm-ml-libraries' 'rocm-ml-sdk' 'rpp' 'rpp-dev')

source=(
"https://repo.radeon.com/rocm/apt/6.4/pool/main/c/composablekernel-dev/composablekernel-dev_1.1.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/h/half/half_1.12.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/h/hiprand/hiprand_2.12.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/h/hiprand-dev/hiprand-dev_2.12.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/h/hipcub-dev/hipcub-dev_3.4.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/h/hipblas/hipblas_2.4.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/h/hipblas-dev/hipblas-dev_2.4.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/h/hipblas-common-dev/hipblas-common-dev_1.0.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/h/hipblaslt/hipblaslt_0.12.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/h/hipblaslt-dev/hipblaslt-dev_0.12.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/h/hipfft/hipfft_1.0.18.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/h/hipfft-dev/hipfft-dev_1.0.18.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/h/hipfort-dev/hipfort-dev_0.6.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/h/hipsolver/hipsolver_2.4.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/h/hipsolver-dev/hipsolver-dev_2.4.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/h/hipify-clang/hipify-clang_19.0.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/h/hipsparse/hipsparse_3.2.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/h/hipsparse-dev/hipsparse-dev_3.2.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/h/hipsparselt/hipsparselt_0.2.3.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/h/hipsparselt-dev/hipsparselt-dev_0.2.3.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/h/hiptensor/hiptensor_1.5.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/h/hiptensor-dev/hiptensor-dev_1.5.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/o/openmp-extras-dev/openmp-extras-dev_18.63.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocm-llvm/rocm-llvm_19.0.0.25133.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocblas/rocblas_4.4.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocblas-dev/rocblas-dev_4.4.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocsolver/rocsolver_3.28.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocsolver-dev/rocsolver-dev_3.28.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocprim-dev/rocprim-dev_3.4.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocfft/rocfft_1.0.32.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocfft-dev/rocfft-dev_1.0.32.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocsparse/rocsparse_3.4.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocsparse-dev/rocsparse-dev_3.4.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rccl/rccl_2.22.3.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rccl-dev/rccl-dev_2.22.3.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocrand/rocrand_3.3.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocrand-dev/rocrand-dev_3.3.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocalution/rocalution_3.2.2.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocalution-dev/rocalution-dev_3.2.2.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocm-hip-runtime-dev/rocm-hip-runtime-dev_6.4.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocthrust-dev/rocthrust-dev_3.3.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocm-opencl-sdk/rocm-opencl-sdk_6.4.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocwmma-dev/rocwmma-dev_1.7.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocprofiler-sdk/rocprofiler-sdk_0.6.0-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocprofiler-sdk-roctx/rocprofiler-sdk-roctx_0.6.0-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocprofiler-compute/rocprofiler-compute_3.1.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocprofiler-systems/rocprofiler-systems_1.0.0.60400-47~24.04_amd64.deb"
# Machine learning and computer vision
"https://repo.radeon.com/rocm/apt/6.4/pool/main/m/migraphx/migraphx_2.12.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/m/migraphx-dev/migraphx-dev_2.12.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/m/miopen-hip/miopen-hip_3.4.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/m/miopen-hip-dev/miopen-hip-dev_3.4.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/m/mivisionx/mivisionx_3.2.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/m/mivisionx-dev/mivisionx-dev_3.2.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rpp/rpp_1.9.10.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rpp-dev/rpp-dev_1.9.10.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/t/transferbench-dev/transferbench-dev_1.57.0.60400-47~24.04_amd64.deb"
)

sha256sums=(
"4d86572df11b725801a780eb3a0b30dc6dd6d27ebd87d8297be0fe898decda9a"
"4a8b4d55dbfa2a1b927497bdf3573989ddbbac7daaffdbd0b60f9bcd92120edb"
"260bd53c0122f5b04e5e42c5accb8f6fe3b940a75345e67de6de271b3bb4bb4c"
"fc98d0e70b64d1d37d35b6c675ab3ca9c78c9031702337b53c619b111784d0fb"
"aac23da170a401c97d2ff534dcb54fc4cdd6aa21818c5d0347de2f9648a795dd"
"c16fab857ce02704171983c0f778fe5c064b9108b60b4bf672aa020e416c1c96"
"d500e6c7c3cfc2bd76d537f674a96f8b7685f5a20a68de2661053e0b1adea49e"
"d0bb813c24ba5135f95c084f8e66e0cf7da928e54875827ef8d78e589ebb63b6"
"3ebd596ffa7d018df6dd3a63e387e9897e297c740eceaee16200a5da1b07b8a8"
"2f530310e16bc9ca4862feaada74dddc9a897d188298af3b2b83f071d58430a1"
"405577b47a56787271f62bc09e0d36aec2e0d8d7e65bccc824d78c3be85dce3a"
"d239f961a34b2b4061b6500b2c69787a44c0c387db8c36bb5e89fdae5adea20d"
"a9d2ab1646d73b23d10026d47d35982a345bc78179c1523d32d315e22823b2a7"
"3cf44e1bec74cc9cd4464d89072f3d45b698f214cde6745fd719a055d17a9ec9"
"a6f585d6102e6d31b6bb4ddfa37b8f63c6eb0bc2f8f8207b7247b078ff7adaa4"
"a25a06178dd8fd1c77443872e0f40045c0ca58e2b957a2e0e4fc8aa2def095df"
"ba66f0484a2be6ff65be8e2e4e347f3890fc9341e9825d43d68b6addd30d7969"
"4e1a98d1da168fee280f110c6fbd4544f2a879e119059c36c0bf183eba16e14e"
"5709f7d24815da0b3194b3804cd8be196b324b7fd9bff075f2df0fe795c1d096"
"2a7b3ef489940d4ffda8610bb4cde5655c832698ba16fbd60c7c1d2c8081459a"
"c687f0570d927141c04eca99ed2d9bc3e80b7c7a22e80b9c3e8a9371d7b7a63d"
"251d4d079bb7454155b932944259ba5c1782bca12666a5b996915e310f973704"
"ce371baf9674cb804455845f3b897e60ee305f5ed028731ba3830e84f146f546"
"8754404731b042e7c07fdcd52a132953d2ad9b85a5dc3c6f6a70dcec418997fd"
"ab7de2b6201cbebf0321275fe1014ea2490bb1cb476d559cdd57c4c1ad277205"
"f0a8652d2a5a51c1aa5d4f2e8045c6e869e3946bfc3f72ee172b8a9cec99d241"
"ef970cdda23e871a8de7a90f99151438d6398ccc493711dfc173e1acf9fb642d"
"a631351f2dc432d95d8c9f79cc1c1878a01a7841f9ec1bd619166c71a97048f8"
"ff98e4707524372786383911f03bef1af92de1aa73e5a0416ce00aee7fa32207"
"7992c21b41f0490355c31f179013d196c9a24c9ce3693f9d7fd94fc1a8544890"
"3abf01796b2575a1ea0d6d3145774085fc56cd2654721e5dbec201168687be69"
"9ddb20c888866de8c993aa4a3388d504f7611aa519e51864aaa088eb23453b7b"
"c92db4036ff70529a46e8c6e2fe6f8930caad9d6b8e87d3fb7aec65d53da2178"
"9e8fcbe962e14e28a47a28d6ab5696fef45f22639e2ca4ac97003f26d4a49a3d"
"710c0db0199d460775d2089b7b18eb099de21d6169a0732cc537d0c54d9e85dc"
"809857623961b9e4da711b60c7615afe689cc630233cc1a0c52d82da922ae09e"
"d00c0af8ded1fba5e570f09144fd03af4c71c0b7c1c341b8220d753cace5d19c"
"0e4807910e5969a23e96d6e2172588503a23228f571fcd2129592d21ebec364e"
"bcf69941b5a2fcacbae9c6a36161b3e8e2e2682adbe038e117be66e9af05b14e"
"c5dd1fe7cbffe34b97b2f7363918cdad53e8c4d9176a5f3263f152e2def682cd"
"64922c57d7af840f791605631ee20d5d21bcdcc45ce7ad37a6dca5c208c243d1"
"294168b6747dcef18f54582e671bbb1132f8569fa0dea7c89150fd96af973501"
"b55bedcc58988b37ce905f258894cbba80d03280e6bb07713930588680344bb0"
"1250c0fe43e7b62bbc7cae001a28baef276ba80711edadbaa63a4a0809907e46"
"1235f86bf2d7329538860ec82dadc96a29236d2d8b28ab54de82eeae50e5fe8f"
"a4a84c570a8739eec13e2cfb6c2e34d1a2916017a579fd493c5ae9aac16cf99b"
"2dffcb33a0bab73eb30468c27ad7ad8586958959c59e45a940d71d926209d781"
# Machine learning and computer vision
"e11d506a5e8261cb3ee5e1a84a0c7b443527d73bf2ee8c022342d9e9c2b76d07"
"1f221dba885c9d416a51d8243f16986a87bc875dbaf473824e0113f66e5e7d75"
"7c77f979e03a05f7dfe133bbc048f46abe48ba7c1ceb0927e03d753ab8b9b8fd"
"12333e71d9077a19be45b3c52fe4aa292ad0819edb63bed1c61e476f7d4f6f1d"
"2e783b11ea31b8a13635709c5a73391f4acdf7d975c18d3f22fd6c96b061726f"
"6567f21868e5e065591518d8ff286fe8de33c08dae152e1f2af2e60a0fb3956b"
"2141c9ac39c3d7f8a9e65fcdadee2953f67f271ffb76d1a01f13eba8a8cb9357"
"b7f776c5cbec9d4d5c0e78cdd7cc6383887ffa1616aba3ddf30d14b7a59c64f6"
"067c5d17b879d8c3e1034caf1b26a15f20e3e7cf2f787ae577e96ed873828b46"
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
	mv "${pkgdir}/opt/rocm-6.4.0" "${pkgdir}/opt/rocm"
	# mkdir -p "${pkgdir}/opt/rocm-6.4.0/hsa"
	# ln -s "/opt/rocm-6.4.0/include/hsa" "$pkgdir/opt/rocm-6.4.0/hsa/include"
}
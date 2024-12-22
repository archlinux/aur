# Release notes https://rocm.docs.amd.com/en/latest/about/release-notes.html
amdgpu_repo='https://repo.radeon.com/amdgpu/6.3.1/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/6.3.1'
opencl_lib='opt/rocm-6.3.1/opencl/lib'
rocm_lib='opt/rocm-6.3.1/lib'
hip_lib='opt/rocm-6.3.1/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd-dev
pkgdesc="OpenCL SDK / HIP SDK / ROCM Compiler. This package needs at least 20GB of disk space."
pkgver=6.3.1
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
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/c/composablekernel-dev/composablekernel-dev_1.1.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/h/half/half_1.12.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/h/hiprand/hiprand_2.11.1.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/h/hiprand-dev/hiprand-dev_2.11.1.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/h/hipcub-dev/hipcub-dev_3.3.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/h/hipblas/hipblas_2.3.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/h/hipblas-dev/hipblas-dev_2.3.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/h/hipblas-common-dev/hipblas-common-dev_1.0.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/h/hipblaslt/hipblaslt_0.10.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/h/hipblaslt-dev/hipblaslt-dev_0.10.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/h/hipfft/hipfft_1.0.17.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/h/hipfft-dev/hipfft-dev_1.0.17.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/h/hipfort-dev/hipfort-dev_0.5.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/h/hipsolver/hipsolver_2.3.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/h/hipsolver-dev/hipsolver-dev_2.3.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/h/hipify-clang/hipify-clang_18.0.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/h/hipsparse/hipsparse_3.1.2.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/h/hipsparse-dev/hipsparse-dev_3.1.2.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/h/hipsparselt/hipsparselt_0.2.2.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/h/hipsparselt-dev/hipsparselt-dev_0.2.2.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/h/hiptensor/hiptensor_1.4.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/h/hiptensor-dev/hiptensor-dev_1.4.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/o/openmp-extras-dev/openmp-extras-dev_18.63.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocm-llvm/rocm-llvm_18.0.0.24491.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocblas/rocblas_4.3.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocblas-dev/rocblas-dev_4.3.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocsolver/rocsolver_3.27.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocsolver-dev/rocsolver-dev_3.27.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocprim-dev/rocprim-dev_3.3.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocfft/rocfft_1.0.31.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocfft-dev/rocfft-dev_1.0.31.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocsparse/rocsparse_3.3.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocsparse-dev/rocsparse-dev_3.3.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rccl/rccl_2.21.5.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rccl-dev/rccl-dev_2.21.5.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocrand/rocrand_3.2.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocrand-dev/rocrand-dev_3.2.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocalution/rocalution_3.2.1.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocalution-dev/rocalution-dev_3.2.1.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocm-hip-runtime-dev/rocm-hip-runtime-dev_6.3.1.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocthrust-dev/rocthrust-dev_3.3.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocm-opencl-sdk/rocm-opencl-sdk_6.3.1.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocwmma-dev/rocwmma-dev_1.6.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocprofiler-sdk/rocprofiler-sdk_0.5.0-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocprofiler-sdk-roctx/rocprofiler-sdk-roctx_0.5.0-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocprofiler-compute/rocprofiler-compute_3.0.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocprofiler-systems/rocprofiler-systems_0.1.0.60301-48~24.04_amd64.deb"
# Machine learning and computer vision
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/m/migraphx/migraphx_2.11.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/m/migraphx-dev/migraphx-dev_2.11.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/m/miopen-hip/miopen-hip_3.3.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/m/miopen-hip-dev/miopen-hip-dev_3.3.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/m/mivisionx/mivisionx_3.1.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/m/mivisionx-dev/mivisionx-dev_3.1.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rpp/rpp_1.9.1.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rpp-dev/rpp-dev_1.9.1.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/t/transferbench-dev/transferbench-dev_1.52.0.60301-48~24.04_amd64.deb"
)

sha256sums=(
"efa95080639ac87e2ce6257ff4cc8e1395cc71bdcc6a28c14aec5036f734b653"
"3d82dc3ff96a7251358211a2f83cfb4d0a4e2ad58407afa2bb085bfc127deb8f"
"b526608b92511d8405343461c9edd290a9cafedf53cd23770d54730da04fedc1"
"4df9e612538c584f654c259a97abfec55148fb7af1ed4f4d75046ebe819c56ec"
"982459322b149f29f2c6751bdb8b41b7c77485b1085e44164f8f27209ca02f45"
"e0b4470df282288b994820e483e57a302512823360cd5f84ba9e76d3a31ae711"
"cf44e99a03a0dec72a30d8cca23ea15f13c6daac0d2a019753ab201edfcbf857"
"d128897cb44b903cfab503c0d6fcaf0a37adb95f9d41851cd73591f44e2bb383"
"4fb5561a9a2bb5dd0de2689377a4ffde972bb04c94f999fa1316be01e322bdc4"
"8c42a00e9fa873d68a8c1098af3f1160a1f6c11820c7d5bb5d3b29c80f53fc92"
"b8146ff8422de33acfe9337e08e41931be2770f3017da6b8197d697f74791863"
"d376a64216c52f223bc7392a4122713dc9fecabb3aa5b353f7600005ad9ec788"
"2143860a672a39cefa84e5a5668b5534a7efc330cc4714606e86859bf34e7396"
"c8fe5325e211544693a5a5321afbfa7bf64f8c468da44f8e1d805f4615972c38"
"b1c6a945dce2a0917c39f78c6c339debe07bb2114d72ed866a538f9b394c0e7b"
"056f05c0dcd310dddc9f43a687e21c40a5551230d07dbf3777c6381856bc57db"
"01593b842411dad4b3884d9d510d7860ef018ab087ea3aae2dce51416249e8a9"
"dbb376eaf8c791853c4724746242b54d56a5a572c4cb5c235dd19a710492edb8"
"d3cbd09617bdd6fad665128e8dcd62abf278abb0e2d9095febdefa71c97ac6fc"
"489eb28c2d619a419e825401c8356d6d4604406144319d138af37638dc2efac2"
"63e23d0e2b67cc26759e65d8125361b83e0f75e4a6c6f12b1393815934214ca8"
"cb6c996f3f31a096e0dd7900e0a80276877b53c3de0103f4117201d9800c6a82"
"c07be8b95085a088fdddc014984ede95cac244af7bfc2853100e1737593d5943"
"7b456b787a44d8f590b1efbc4a4f704ae5624d72c67d3293031f1ca24a8eeac4"
"cbbb0a2e3b669c94633be5691ba5a54ce0f20ddc68214011cbc848f6ce3cc58e"
"1396b2b6c101e1d3f81de7946e7f087a7d3b67bff6181ae82aa2576ae920c2fb"
"9f641bd4944bbe8c709f34efc384fa7f0bceb2bde9ca42e9abfffd53ca79b89d"
"9e047a4e6d48344f35aa5f6b2b5e03b841af30be80d3a7cf6d9e644f7aa51b57"
"42738499c38c22e43712400b099799cb632a7aa7e46ffa3736296ab17e863d76"
"6080ce4979c38066c6aa406b80426b7d48016236f930a6c26ec9f1d2013b4243"
"ba9e77b863041deaf0eaf46a4f5ff50f0b4871d146a8052b4a3fb230a8daef52"
"c8e4c71114e3beb1db5acda65a0e38b86d75d6cc97708b289920b5f89dd2626f"
"2b2e5107016c009d6dee2509680a2a285fb5cea692aa17a9e9ddd9a410e0b1ac"
"cffe3f9bf26e3993d52fb73c95b0993042b3d6d932f18e002ce0356f5916fc41"
"22f6032eb9128f88568f2d64d347692757d9b622547599d26813ab208c6302c9"
"5c9f1e48795e5729727a965534555d8f341bd233f96812b4350699eb51ba7331"
"53cbc3d00263c98aca68177602f22263f9310f76af94bdd5a16126b54d64922d"
"345f6d5281470a1a9c25fd66d269d90755124448f773fdc9ab6f3a7a7caf877d"
"de83c2a0f5725a9b8d54cc4d943608da6452c037c112e4b636fecaedd5b66d7b"
"32fdee6eddfd2e4364dcb94dfd6dfc833f4a440f89758370f8b59f758b3a6390"
"39b2d97a692753ccbf719e65b311827a724f872ce66655cd2a50a444ca07c100"
"e8d73f6d976594463bf99c69e213ef8cf9cdb0073e55e0dc813b84129859c108"
"8ae26f92cdbc13deb8a24e62ae992366d96802627079e97fd29308b4f8cf5eb7"
"0fbb3ef1144545603ede901f336546bbf9ad92828d65e40b4b957d6c1c49c23a"
"b09e18b777d0679f05694afae58b64ea28c0c2b07fb50c026f5569a81bb74f2a"
"89a702e9c5a279ce6adf8baf729dc2a35a4ad2608ca383ecb4b2d732b298f3fe"
"791c0376a5ad9356648a999ff270819b85c542e9b4b14fe9431c5582452cc4ba"
# Machine learning and computer vision
"13a72e0489d71c8087c7258eb88cd30cb49b2c312260d1c6aef83b01ae1cc907"
"782da82cd0a26fbd4e146034bd160937471498d9f489ead865e181138f311756"
"dc46540dd17e24e4bbc16631fc7979135888a7d4fa73e6edf15e4da475e8e2be"
"956233487c2f428b4b0b905da4a7e471094b4af9faf68317835a3ab681dc5967"
"b217cedd3d42da8480f67e5b3ca6f1d650dd699b115daff5bf780d11508e0e59"
"05b13ff3d64364c722d10380c3cc5fef1205004bc429d2034a8a0dc08b10d08a"
"ac0b0c7765fc3b70d044541387cb090fbb52ba2946ab0684e384b9ca41e83d1d"
"40017991fea11b00fd36bb365a3efaf645fa40c9997187af88426726139bfb7b"
"c7407bd339594d2ac5ae6b309b1e48469bb9d9ca57be0ac4186151f5257529b6"
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
	mv "${pkgdir}/opt/rocm-6.3.1" "${pkgdir}/opt/rocm"
	# mkdir -p "${pkgdir}/opt/rocm-6.3.1/hsa"
	# ln -s "/opt/rocm-6.3.1/include/hsa" "$pkgdir/opt/rocm-6.3.1/hsa/include"
}
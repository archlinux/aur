# Release notes https://rocm.docs.amd.com/en/latest/CHANGELOG.html#rocm-5-7-1
amdgpu_repo='https://repo.radeon.com/amdgpu/5.7.1/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/5.7.1'
opencl_lib='opt/rocm-5.7.1/opencl/lib'
rocm_lib='opt/rocm-5.7.1/lib'
hip_lib='opt/rocm-5.7.1/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd-dev
pkgdesc="OpenCL SDK / HIP SDK / ROCM Compiler. This package needs at least 10GB of space."
pkgver=5.7.1
pkgrel=1
epoch=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('opencl-amd')
provides=('rocm-llvm' 'rocblas' 'rocblas-dev' 'rocsolver' 'rocsolver-dev' 'hipblas' 'hipblas-dev' 'hipblaslt' 'hipblaslt-dev' 'rocprim' 'rocprim-dev' 'hipcub' 'hipcub-dev' 'rocfft' 'rocfft-dev' 'hipfft' 'hipfft-dev'
	'hipfort' 'hipfort-dev' 'hipify-clang' 'hipsolver' 'hipsolver-dev' 'rocsparse' 'rocsparse-dev' 'hipsparse' 'hipsparse-dev' 'hiptensor' 'openmp-extras-dev' 'rccl' 'rccl-dev' 'rocrand' 'rocrand-dev' 'rocalution' 'rocalution-dev'
	'rocm-hip-libraries' 'rocm-hip-runtime-dev' 'rocthrust' 'rocthrust-dev' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma-dev' 'rocm-developer-tools' 'miopen' 'miopen-hip' 'miopen-hip-dev' 'rocm-ml-libraries' 'rocm-ml-sdk')
conflicts=('rocm-llvm' 'rocblas' 'rocblas-dev' 'rocsolver' 'rocsolver-dev' 'hipblas' 'hipblas-dev' 'hipblaslt' 'hipblaslt-dev' 'rocprim' 'rocprim-dev' 'hipcub' 'hipcub-dev' 'rocfft' 'rocfft-dev' 'hipfft' 'hipfft-dev'
	'hipfort' 'hipfort-dev' 'hipify-clang' 'hipsolver' 'hipsolver-dev' 'rocsparse' 'rocsparse-dev' 'hipsparse' 'hipsparse-dev' 'hiptensor' 'openmp-extras-dev' 'rccl' 'rccl-dev' 'rocrand' 'rocrand-dev' 'rocalution' 'rocalution-dev'
	'rocm-hip-libraries' 'rocm-hip-runtime-dev' 'rocthrust' 'rocthrust-dev' 'rocm-hip-sdk' 'rocm-opencl-sdk' 'rocwmma-dev' 'rocm-developer-tools' 'miopen' 'miopen-hip' 'miopen-hip-dev' 'rocm-ml-libraries' 'rocm-ml-sdk')

source=(
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/o/openmp-extras-dev/openmp-extras-dev_17.57.0.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rocm-llvm/rocm-llvm_17.0.0.23382.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rocblas/rocblas_3.1.0.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rocblas-dev/rocblas-dev_3.1.0.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rocsolver/rocsolver_3.23.0.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rocsolver-dev/rocsolver-dev_3.23.0.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/h/hipblas/hipblas_1.1.0.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/h/hipblas-dev/hipblas-dev_1.1.0.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/h/hipblaslt/hipblaslt_0.3.0.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/h/hipblaslt-dev/hipblaslt-dev_0.3.0.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rocprim-dev/rocprim-dev_2.13.1.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/h/hipcub-dev/hipcub-dev_2.13.1.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rocfft/rocfft_1.0.23.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rocfft-dev/rocfft-dev_1.0.23.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/h/hipfft/hipfft_1.0.12.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/h/hipfft-dev/hipfft-dev_1.0.12.50701-98~22.04_amd64.deb"
#"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/h/hipfort/hipfort_0.4.0.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/h/hipfort-dev/hipfort-dev_0.4.0.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/h/hipsolver/hipsolver_1.8.2.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/h/hipsolver-dev/hipsolver-dev_1.8.2.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/h/hipify-clang/hipify-clang_17.0.0.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rocsparse/rocsparse_2.5.4.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rocsparse-dev/rocsparse-dev_2.5.4.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/h/hipsparse/hipsparse_2.3.8.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/h/hipsparse-dev/hipsparse-dev_2.3.8.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/h/hiptensor/hiptensor_1.0.0.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/h/hiptensor-dev/hiptensor-dev_1.0.0.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/h/hiptensor-samples/hiptensor-samples_1.0.0.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rccl/rccl_2.17.1.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rccl-dev/rccl-dev_2.17.1.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rocrand/rocrand_2.10.17.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rocrand-dev/rocrand-dev_2.10.17.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rocalution/rocalution_2.1.11.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rocalution-dev/rocalution-dev_2.1.11.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rocm-hip-libraries/rocm-hip-libraries_5.7.1.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rocm-hip-runtime-dev/rocm-hip-runtime-dev_5.7.1.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rocthrust-dev/rocthrust-dev_2.18.0.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rocm-hip-sdk/rocm-hip-sdk_5.7.1.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rocm-opencl-sdk/rocm-opencl-sdk_5.7.1.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rocwmma-dev/rocwmma-dev_1.2.0.50701-98~22.04_amd64.deb"
#"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rocm-developer-tools/rocm-developer-tools_5.4.3.50701-98~22.04_amd64.deb"
# ML
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/m/miopen-hip/miopen-hip_2.20.0.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/m/miopen-hip-dev/miopen-hip-dev_2.20.0.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rocm-ml-libraries/rocm-ml-libraries_5.7.1.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rocm-ml-sdk/rocm-ml-sdk_5.7.1.50701-98~22.04_amd64.deb"
)

sha256sums=(
"c25d546cd7f110c5d3f7483fce2795e3723b7e5caedb8cdd6a2bacf96226701d"
"3ed558ead8ad340d1283850bb8f5a749c508118cf040a00ecfe25aa02b3e3ede"
"04ca4350d352876addfc1990d4cdae205a1b85e9e45576ea53806dfa57ed5306"
"e9e4daaa7bb733cbc8422a556d5f892169c88282f01da4553d25d7d78f092ffa"
"5478f6fa90e395c545ce751cfa0ae04afb68b1b880d9c4125f585a50c3cb5c04"
"95a16f51a57eb6f7d35356747b681d582982aab989296c0eed881867a359495f"
"3d8dbb86c80868971f64e6b85063f37c0c9fb72f88a68f681f2dae5deec4ede1"
"f0dcfbec9dc5055e3763e8a0f653265b109f36b99f83f3da1fdeed3710901469"
"bda0d614781761e93aec03749c2b29deb37e4839976a2f719c3c7fa1c19e7518"
"401658257a027cc6e69d326cbf73324d87d83be2cd24c0b21eade0025d8b21f7"
"5f02a4ab24e5172d38f71179b17392403344b274b83a834078b6ffe44fc3a8d8"
"8ad4317c62e435a4aff52f4a949435000bc53bf36dad7e1096821a0299ac7054"
"cbac749906223b64841c0679d7cd0bbb1c75348d3a20a9af62017ebef9e5662a"
"5f83c48343d6536a119aabf26486814b95dd00dcb6c570fd8edcc279eca02b58"
"a52abd09a22a141767186e54d25b8887cf58eb624d4d337b57b31c334701e2a8"
"61aa2a30a102dd0c70556c6a0259d7562c44a640fe2509b29d9000bb30d94a54"
#"2c2bb011e24eaf7a4604a5496c024776e2db026bfc11e8f5c8748ad355655353"
"54d6c50c6ebc63cb30a497ac0f92cad5eac6033b733d9c4b768b76930de6c58f"
"f5262124fe520f634d311173aca14801883dd125500296f212a44dcf1e26719e"
"96b0a7a7be2b4d7e48c6f8138dbdc7b2570fa3cea18f3066a53ec5c0653fd275"
"e92015378e88358c6dcfaaa0afed801bea4b63b868fa16b6a7fc5d8fa490660c"
"b75bdec7cd227359ac0c30d1aae88ae85336f539f6532bd03f47873f6a5d3c08"
"4e238fd1e8b5a957bd648bd7ccc9a011591c0a875152db7fd370e1185891cc52"
"24637362623189d40a81d0d916c586e528969092c4dbdda1e37f9fac23226a1c"
"6a9eb5bfb45ea6b4a1a296fbcb9d957da9e7f4034522014be37cdeae5f809fac"
"48fc178ec5bac13ee69858fc2d97a0e72537e1c12c80b38c478b712f0f9fddee"
"7d481c5b86fe14661e256746574e9dc8ae3c9dd7ae96de7386d7fa91b724cb9a"
"9d445277b543db46dbd44a56bc4dd978e05d6c2d4d2d2862a163f31d2a39b7bf"
"66521c5fedf1388b0301cdca6e48bc21f2e1d5f442d9872032d53e454c7e9695"
"54bc795b7133ea48f6223d19e9f8e5edc91b7f584ca4a9493578ef9ebfb61b79"
"af2ba03ff431a29f29c7a557e957b78729da250d9b5bcddc3687e74834107f7e"
"3b8fa3b656d7b48c409d333a1966091f73e28caceb7786043058745cdb15fcf2"
"d923619ba2001ea04b9426c0a17bd7ec0eace3dbc0469a0088619405a4fe12a4"
"3c5f66df4787084fcfe2a9f8809a6b9fa5b69ae3089027d1fc58b17310c8a189"
"5a28fb993a3a41d35e3049e2a8fe4941cac34c2217963d7b32f5a4f3ab129434"
"44c4c8db3429bbdc86e467076589da2ca4597e88b961dd4416030c35574e67e1"
"ebb6f83776b688eb7c097511f2936eaa67e71678669726a43e85c91ebd8a4eef"
"8db754629eb40d9a0cc19e6a61611740f5e4915ef5091438e927fbd9cbb1d906"
"f2418ecadbe6988475926f27025e969b8c7d7f2525735b47fcffc2bc390694e3"
"59a15553d56d964197fd4122c7a3ff29078ea6df883ee6ccd91a914b4246fc51"
# "4bba416791003fb689db8e9ebc68c15eac2951be98c4c5b9d09c40f202748d23"
# ML
"66496bb410057717cd4cad7ad3f0dc0b7e526c2b27893b3041690996b8b4b970"
"404e1dfa58eda322a4bbbd38e14da001d33d7eabd2cc4b24d8c2a8d32c23e530"
"0c1138ecc4d28b14630e959b9ed75ddba220ea2f5491fbbe6a5cf1bea11c9cef"
"ca9ef47bcb430ee71a74d4242ed8d316eb2ed69d2b2d765e7a57b5617ded6210"
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
	egz "${srcdir}/openmp-extras-dev_17.57.0.50701-98~22.04_amd64.deb"
	egz "${srcdir}/rocm-llvm_17.0.0.23382.50701-98~22.04_amd64.deb"
	exz "${srcdir}/rocblas_3.1.0.50701-98~22.04_amd64.deb"
	exz "${srcdir}/rocblas-dev_3.1.0.50701-98~22.04_amd64.deb"
	exz "${srcdir}/hipblas_1.1.0.50701-98~22.04_amd64.deb"
	exz "${srcdir}/hipblas-dev_1.1.0.50701-98~22.04_amd64.deb"
	exz "${srcdir}/hipblaslt_0.3.0.50701-98~22.04_amd64.deb"
	exz "${srcdir}/hipblaslt-dev_0.3.0.50701-98~22.04_amd64.deb"
	exz "${srcdir}/rocprim-dev_2.13.1.50701-98~22.04_amd64.deb"
	exz "${srcdir}/hipcub-dev_2.13.1.50701-98~22.04_amd64.deb"
	exz "${srcdir}/rocfft_1.0.23.50701-98~22.04_amd64.deb"
	exz "${srcdir}/rocfft-dev_1.0.23.50701-98~22.04_amd64.deb"
	exz "${srcdir}/hipfft_1.0.12.50701-98~22.04_amd64.deb"
	exz "${srcdir}/hipfft-dev_1.0.12.50701-98~22.04_amd64.deb"
	#exz "${srcdir}/hipfort_0.4.0.50701-98~22.04_amd64.deb"
	exz "${srcdir}/hipfort-dev_0.4.0.50701-98~22.04_amd64.deb"
	exz "${srcdir}/hipsolver_1.8.2.50701-98~22.04_amd64.deb"
	exz "${srcdir}/hipsolver-dev_1.8.2.50701-98~22.04_amd64.deb"
	egz "${srcdir}/hipify-clang_17.0.0.50701-98~22.04_amd64.deb"
	exz "${srcdir}/rocsparse_2.5.4.50701-98~22.04_amd64.deb"
	exz "${srcdir}/rocsparse-dev_2.5.4.50701-98~22.04_amd64.deb"
	exz "${srcdir}/hipsparse_2.3.8.50701-98~22.04_amd64.deb"
	exz "${srcdir}/hipsparse-dev_2.3.8.50701-98~22.04_amd64.deb"
	exz "${srcdir}/hiptensor_1.0.0.50701-98~22.04_amd64.deb"
	exz "${srcdir}/hiptensor-dev_1.0.0.50701-98~22.04_amd64.deb"
	exz "${srcdir}/hiptensor-samples_1.0.0.50701-98~22.04_amd64.deb"
	exz "${srcdir}/miopen-hip_2.20.0.50701-98~22.04_amd64.deb"
	exz "${srcdir}/miopen-hip-dev_2.20.0.50701-98~22.04_amd64.deb"
	exz "${srcdir}/rccl_2.17.1.50701-98~22.04_amd64.deb"
	exz "${srcdir}/rccl-dev_2.17.1.50701-98~22.04_amd64.deb"
	exz "${srcdir}/rocrand_2.10.17.50701-98~22.04_amd64.deb"
	exz "${srcdir}/rocrand-dev_2.10.17.50701-98~22.04_amd64.deb"
	exz "${srcdir}/rocalution_2.1.11.50701-98~22.04_amd64.deb"
	exz "${srcdir}/rocalution-dev_2.1.11.50701-98~22.04_amd64.deb"	
	egz "${srcdir}/rocm-hip-libraries_5.7.1.50701-98~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime-dev_5.7.1.50701-98~22.04_amd64.deb"	
	exz "${srcdir}/rocsolver_3.23.0.50701-98~22.04_amd64.deb"
	exz "${srcdir}/rocsolver-dev_3.23.0.50701-98~22.04_amd64.deb"	
	exz "${srcdir}/rocthrust-dev_2.18.0.50701-98~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-sdk_5.7.1.50701-98~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-sdk_5.7.1.50701-98~22.04_amd64.deb"
	exz "${srcdir}/rocwmma-dev_1.2.0.50701-98~22.04_amd64.deb"
	# egz "${srcdir}/rocm-developer-tools_5.4.3.50701-98~22.04_amd64.deb"
	egz "${srcdir}/rocm-ml-libraries_5.7.1.50701-98~22.04_amd64.deb"	
	egz "${srcdir}/rocm-ml-sdk_5.7.1.50701-98~22.04_amd64.deb"
	
	mv "${srcdir}/opt/" "${pkgdir}/"
	# mkdir -p "${pkgdir}/opt/rocm-5.7.1/hsa"
	# ln -s "/opt/rocm-5.7.1/include/hsa" "$pkgdir/opt/rocm-5.7.1/hsa/include"
}
# Maintainer: jerry73204 <jerry73204@gmail.com>
pkgname=cuda-11.1
pkgver=11.1.1
_driverver=455.32.00
_reqdriverver=455.32
pkgrel=1
pkgdesc="NVIDIA's GPU programming toolkit"
arch=('x86_64')
url="https://developer.nvidia.com/cuda-zone"
license=('custom:NVIDIA')
depends=('gcc-libs'  'gcc' 'opencl-nvidia' 'nvidia-utils')
replaces=('cuda-toolkit' 'cuda-sdk')
provides=('cuda-toolkit' 'cuda-sdk')
optdepends=('gdb: for cuda-gdb'
            'java-runtime=8: for nsight and nvvp')
options=(!strip staticlibs)
install=cuda.install
source=(http://developer.download.nvidia.com/compute/cuda/${pkgver}/local_installers/cuda_${pkgver}_${_driverver}_linux.run
        cuda.sh
        cuda.conf
        cuda-findgllib_mk.diff
        *.pc)
sha512sums=('3da629e6f63548d06050a77d6ad2dbf314db33b2bf4e7d1659f039b3d9ad2ad3f87a6e506ec54db9ca2d21ac7b5ec576748082684bbab3b6642c03d2793d73a9'
            '79aa6fbeff13a2bcef5791c2288d4b072dfe7b17593261ee79302dc6c77ae368e73f5cac9ce38893fc0068e4895f5cde475faf507fac058fb697c8da3198587f'
            '714d973bc79446f73bebe85306b3566fe25b554bcbcba2fcbe76709a3eca71fb5d183ab4da2d3b5e9326cb9cd8d13a93f6d4a005ea5a41f7ef8e6c6e81e06b5e'
            '41d6b6cad934f135eafde610d1cbd862033977fd4416a4b6abaa47709a70bab7fcf6f8377c21329084fb9db13f2a8c8c20e93c15292d7d4a6448d70a33b23f1b'
            'a4b3b03682801a98a1d8c1d14c084fd35efd384d92d497e230e3a28e0bd97b1fa48a93ccb2150f892f0b4154ca4ea2d66f5484a6a59b5c9b49963de42ecf1736'
            'd69d3ec0e270648f55d8c3e420f89d056b120eca5b25e9e7fc1cca799d1a252909ee31ff399c137223eca57cdf82b856221a251b6ff1daf5d6f75c1a582b1e32'
            'e463a596d34cc7d7e42c32e8a72b327aedb8707902dda8767f2c22a6a7e6dda7fcd297c0036b004ce4f1677408084acb6f4ed683cd6c79558ba8bb4e1a83867f'
            '2fc1a136ecbd7535a46c7c63e1218525230e44d15f461fdb461b727eb12799ebe66d46d57cacda9b7b55bbfed572c1c9a9c5c5f73de6e28da1a1deda7b7eaffd'
            'd91acc6e7f56f36a4b67ee06f39d87928bc49e7463077f9dc95716151df1a9a6f259ebf01dc860eacf2d5faf2feb4411b6ca8cef50cd5af823875aa5ad54d098'
            '7bda70d783180d3dafea9f0117e0c396d4aedda3da02fea6c7382139b030c9111e044c454152526cca271d49883240782ba94fe89b098a41d9b451425dc4870d'
            '408b553d5187e31086e10d236f2c8090045da0fae351c8b170d01aead88ea5f8a0b4ec50e2c5ccbb989167768bec58cb7ae051b7b87c00c59794879844d7679e'
            '5fb9837e7830a02bd6e1fae0cd959bc35474801ab2836e385678ce893d760ff6b9f47e728707a755f842758cf2fe55c2f7bb04d3941b80a5fd1d4b4ba7a4d428'
            'd47d8bd10cf1183e9ab3ae59b669e8a8d7cc9127dbb07c4bafbc8b853b285676217e329e1cc49a277d0b9b5623c2e6066b087a66951d2e7fa8007f10aa4c074b'
            '6728716dbe10553e876cb6a2c556bf9309197eb53c9d31fa1525843383ef531ca7a0913130507064fc24c59057b5f82f45705a23df43d77c5882bf53b087ea4b'
            '653a29a874fde27defeb06cc4e3c69d9d129d9b9c04f15d2958629eaf03521d361c08fd41abee95378ae72f951f07c15d32e7d5563170829a0c90defebe95a0b'
            '26c8ad1ff52ae51ee250b71b8427a2b89bd3d64e42c5fe2f55732bffb36e19d2946008e5058cd30d76b8129621aa5440b11601b10afc95f112bb8addfc0aeb0c'
            'a801a5fb9e963bbd796b050b514b412a6babab26e0cdbd61b7ea55071944723489b4305bebedc8828428756939cebe6bd936bfffed5a6fff8bf39629a8df5cce'
            'a5fd4fb8fa75d276c154fd48657aeeb689b39bc29cf0efc9c6e0bda741de36d740095007cda9849345c322162513530953ab5598c2dad03ac8c2c0c9395ff79a'
            '40fbed6b5d62ac90afc0732e6713e34a35c8883b9b30ae76616ff689addb64553fd4b9d09ff360964e01ab2afaa3d3055b2a46725fb937fb117a28c0e5392a1a'
            'b17ba99efdc2bb8b83b3811ffb43515e663461185c659902bd3111f08f05a196a3919c463102b2d8bd0dea69cba8fa0a6ccc4a86c0b2584459218e1292074a13'
            '4aa2bab32131bc3a81d5ba8412b10b6b30cebf5a0e1525e56bd7cddf20da8d306ba48165d6a6356eb9c1f705c4b3d58e1bf33c1d07c872c741739e70a7cb20ef'
            'af4fc1d293978bba254d3db6c941b4b7be2ce9b61d82ddaf1e30e19407f6bf10caa22c4406739179cdb12ebc5396013ea291554edea8d56c1661493804309f87'
            '367151febaabe4eda8df64a10bbc43e29e5a5236dc4bc064a3a8d12c69818bedbaef156fddf08c99f0eca5bdae20b5a3a0f7e2401efedebf096ea143ef2d09fa'
            'b0ab2a5dac5fa1c7d2687a0f2f25de271b2638198744a27d492a02651afd4f676ac814252990d476a21f0b0c489d2487b5af766f32839c4d6ab2f91b2bb8ad04'
            '328b3103a23d5de04efa7adc16d2cb8c23ab6617e0d83072e2ea0269f9af994125ae7e64e372697774fa1bfa9d3ec761d16ea489e51222d8babeca0fde95d239'
            '4db458ff7db77303423fe38290c98caa1c4bb131d4c863d17880beac6e433998e4f85343b15e7166e3f7d9be41fdacae6ea66516db3b98d6371a16dac266539f'
            'df4fdc00e02ed8bd15cdda0a7dd375d36ff98c5df6188164caec530ae0d0ad8d632a6f29dbcebe7cad0edf2c579bd3594acb8d09fd81a6a3ba85e2cbc26101cd'
            '3cb8c30f3936a464dbc214ee820941694e741de767c2636a5ce94cf5ea84d33a6265fff5777fb6a9f7328e076cc4c12e71624b3eb024bc0069d917f506a22750'
            'c2c0a15c1a1c4fe51c2be1eaf4ff790042b9d42b5959d02522ed7ad18b4c5880dd7d9cdfe88a6d1850b34ce7a22599fadc0e11ca94b595210c9150e44b5e8e66'
            'ede3cfcaaa655e73e47bd3475d94d33933c6e7c89c7dc7c98d9491e066ab4cf504e12ed4f1eab9edaeb358154bd86a43d359304675efa4fd4a67d01c97986f3b'
            '4405d88a132f3cf4e6c506962860503537a3c946fbd5f1c29c52bb6e6b45b13d14333bc772c62589337875200b23b0af17c9e5ce188d2f4018f488ea75501054'
            '16003e7e6307d39a95fe246a7d079e9a3d827bd03fd5f03bdd2051a5033a1f93d9c8531073ef587808a9d0c75d20e3d79417a90b14102bc872d32c2c7a5ebdcb')


prepare() {
  sh cuda_${pkgver}_${_driverver}_linux.run --target "${srcdir}" --noexec

  # Fix up samples tht use findgllib_mk
  for f in builds/cuda_samples/*/*/findgllib.mk; do
    patch $f cuda-findgllib_mk.diff
  done
}

package() {
  _target_dir="${pkgdir}/opt/cuda-11.1"
  cd "${srcdir}/builds"

  rm -r NVIDIA*.run bin
  mkdir -p "${_target_dir}/extras"
  mv cuda_samples "${_target_dir}/samples"
  mv integration nsight_compute nsight_systems EULA.txt "${_target_dir}"
  mv cuda_sanitizer_api/compute-sanitizer "${_target_dir}/extras/compute-sanitizer"
  rmdir cuda_sanitizer_api
  for lib in *; do
    cp -r $lib/* "${_target_dir}/"
  done

  # Define compilers for CUDA to use.
  # This allows us to use older versions of GCC if we have to.
  ln -s /usr/bin/gcc "${_target_dir}/bin/gcc"
  ln -s /usr/bin/g++ "${_target_dir}/bin/g++"

  # Install profile and ld.so.config files
  install -Dm755 "${srcdir}/cuda.sh" "${pkgdir}/etc/profile.d/cuda-11.1.sh"
  install -Dm644 "${srcdir}/cuda.conf" "${pkgdir}/etc/ld.so.conf.d/cuda-11.1.conf"

  # Install pkgconfig files
  mkdir -p "$pkgdir"/usr/lib/pkgconfig
  for file in "${srcdir}"/*.pc; do
    file_name="$(basename $file)"
    cp "$file" "${pkgdir}"/usr/lib/pkgconfig/"${file_name%.pc}-11.1.pc"
  done

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s /opt/cuda-11.1/doc/pdf/EULA.pdf "${pkgdir}/usr/share/licenses/${pkgname}/EULA.pdf"

  # Allow newer compilers to work. This is not officially supported in the Arch package but
  # if users want to try, let them try.
  # See https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#system-requirements
  # for official requirements
  sed -i "/.*unsupported GNU version.*/d" "${_target_dir}"/targets/x86_64-linux/include/crt/host_config.h
  sed -i "/.*unsupported clang version.*/d" "${_target_dir}"/targets/x86_64-linux/include/crt/host_config.h

  # Fix Makefile paths to CUDA
  for f in $(find "$_target_dir" -name Makefile); do
    sed -i "s|/usr/local/cuda|/opt/cuda-11.1|g" "$f"
  done

  # NVIDIA has trouble with counting and numbering 
  # as well as the elusive concept of a SONAME so...
  ln -s /opt/cuda-11.1/targets/x86_64-linux/lib/libcudart.so.11.1.74 "${_target_dir}/targets/x86_64-linux/lib/libcudart.so.11.1"
}

# vim:set ts=2 sw=2 et:

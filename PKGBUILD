# Maintainer: jerry73204 <jerry73204@gmail.com>
pkgname=cuda-11.1
pkgver=11.1.1
_driverver=455.32.00
_reqdriverver=455.32
pkgrel=4
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
        cuda-findgllib_mk.diff
        *.pc)
sha512sums=('3da629e6f63548d06050a77d6ad2dbf314db33b2bf4e7d1659f039b3d9ad2ad3f87a6e506ec54db9ca2d21ac7b5ec576748082684bbab3b6642c03d2793d73a9'
            '41d6b6cad934f135eafde610d1cbd862033977fd4416a4b6abaa47709a70bab7fcf6f8377c21329084fb9db13f2a8c8c20e93c15292d7d4a6448d70a33b23f1b'
            '7d4faa928b53e15e733131f23e59bde3ed7bb1c4ab2c6bd883d57386a4d503ac290431b6cd3dbb39aff29f8ea456e75e11ab6e7b373ddc6ebf6e4ee2dcb72ff6'
            '620f229646f25c1d1d0c70cb7ffd5c1a11ff266e449c6decf3f1c2015ca8fb4aa5f50b23d5f2f1859d23eff1da0201771e77f3f96e4b2de4684a3237f4c4b49c'
            'a18ea0b10d9c5079b5b5de0220c4b9782d3c04c6def2543a2be4bd007cc08a3a8fe1b4898b5430af62d4a0354a3da88128b8fac411f25e79cf5decaa8b4f2c21'
            '90860ceb0a5a81ecac3b9c8d244c9ebe6c459b8941854538aa4b8c199ecada1281497684f68d3108b2f4ebfb40c41f433d37b78bbf0d5e3afe69185102847301'
            'e33b60950559a9cb8a6cf2684750b275b68324f7dfa73c945b772d921e531860dde7c0cbcb0ea9a774e6bd4178d5e4a6ab8ebd3f4d636facfbac1386f42d9c79'
            '05836cc2a05174f601dab2b9abed169781b565ebe9484b94f81cce60971c94b9fd2ff35ab0af2bb683f98d8a71db68be2323e5e9c98227cb84b08789d3e17eac'
            '0bfad90d931f2e72be1e6a7710d82a1e62ed9922e1f2bed0e943594879f10bd00ed1e5ff8948daea12d0ae86a0cb2563cc72b404fe9c35707bafd2f335ccb472'
            'c4aee400ac36dbe03a7a59a39e7e90758ecbe40376091143419861e20cfdf71315e7435d21203622c54181c6fa85a505f98005f1ca15623eb9d8e7df65930b2c'
            '9ad63842eb36553d3638bfe6c0300aa3cdfedfee2b95bc2a2dd6f98f3ccf04f4570f122cc38813a17c265d8e9bc2493da8fb1470b4810f62faae12ff28d641ba'
            '4226e6b7ca9985b43493d4dce2e13dd8e36768f9a95a45abd5f12f42238787b0ada077f6a7c91ebb8ed20c37f68295f1fed468c2033e1473657b3560397234e6'
            '0645070ddc67c62825c77d0ef56847aa6ee94a77bd0b823935c2ded9665f932180c6be7fdd125789898dcc67d5fc251d2bbaa91778db95290bf4879b458ba4bd'
            '701ec89ccfca8181bae97a6e22cc02713b3c89c77b564d67a8076c82a1f59d56b6349d9cce93da69aa5e609e7b2114be5544d94ea511b28d95be4af3433eb6dd'
            'c27d547a6c799d759b8efabc6891470b1fa29e1ec4e54a33e2e10c45089a23f0d04a12e696b454479b24c3e7f9873469747019be947fb832e2fc055f7b044629'
            'ebacb064ba789aa4a2960ffbf62286215c2c66dd22b685d0b2df14585e5abf65546fb51277c9a60ace2da42a4878bd1c3df853aa7e9e75eeb6abde45198ab4e7'
            '430529ec5aaac958d46672d02294d20218226396a9fb431bfea7ee6d6f4bac311d854459af52eb2cb2b75eb15efcc4198738e3420508448e15734de62132a0e3'
            'eb9b06eda829f6406d3bce2e0181a0100faa3e69ae9859805137e34bc4753ba781af7ee5a2b2e0150bb912fc38b6594a42e9ef13a1e48a53dc20c81a12231fc4'
            'cf3041c1a8accc8e777b1a9235604df2cbd0122ab18b3285e66dfe9577da6166962221f92fff23a19c41bd9923d08e00781c309fa5ac495ae3c3bc350c85330e'
            'c409cc862f4b5b9a3186d65eaa695239dd3a35bb899b97c2d2904563f85b002fcec97cf5709d0d9f38d3a705455d85bf0e2d57470629e7913e3a854a7e785b90'
            'a8b4e03e84f5c9f8cb9760818f01c7cb3c4904a49ae3187e29ff001fbfe22373dea3046a7979920a1a7a77333af6f1aea32b9f490e3886050372647584767c18'
            'b67f031ab710753225036565b7bc3499b257cbfe7b3df568721bebc27bca8dc56340647aa7a173063485c585badcbca1e66d936f31e51c56e3e320ea215234b5'
            '27237ed840b183d4fad5bbdc58b688c81def5d195ad663d4e7d9fff9fb867bf19e316a4c7797af3bc3c8377d94cfb178f943a8ecd9c7241838f4d0ff0b5e79c9'
            '4fcf96b32e03e45b9e2210e15f8e3c0be8f95447f8657c0a2d078f15d24dd63d2e2112d3e5f70fb9db90870a36bc37d33de2e4a12bbf95d2fb8367e6347c0d4f'
            '8ad6b12769dbb2e8c86d44a5e85586230df7d90e234ea885297e764f86bd7a1a99d6f513c4c3ccfbf3d358caa81d55383517bd4a43e7f0611ff234da5db0502e'
            'ff64128e2f562456a18d4194c148a20dbed0c06dfc64ab17608dba10a695fd8f68303e10c78f08320997df9275f934d58b43e29ee41ef76e92f66ee8eaccadf4'
            '88422ab0692c32fc4ca800bdcb2611e60c01f5eb9b8a9a1ef3ee593024fe071e7b9bd18ac2caa66763922ad27514078986a2c6c681d510159c1632ba0d080b3e'
            'eb831cb8c1d39f74c00e25c16254279429d99c98a33b48a29ee675123c042fd752a74d2d7b4d8fabb9df4c906b8cf3c5724c161ce0bd1c048fd05bcb1611f54f'
            '785ada0d8cf5f4c031782d3d602d6d818d7c17e576d667edeb3c4c23956d7564ba63f5fd9d19e1c18562862d28efdf5284f5207cc789a9dc8ff515aba0eb0d50'
            '833ecceca15a80b0078de7fa387c41605d86f866584ff6284a273d1b940de1e22ba4873634a827b9211d0527469c6e44a2810f250e4884245e3122f2d18ae701')


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
  # install -Dm755 "${srcdir}/cuda.sh" "${pkgdir}/etc/profile.d/cuda-11.1.sh"
  # install -Dm644 "${srcdir}/cuda.conf" "${pkgdir}/etc/ld.so.conf.d/cuda-11.1.conf"

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

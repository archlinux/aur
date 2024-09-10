# Maintainer: Karl Ludwig Brennan <karlludwigbrennan@outlook.com>
# Contributer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributer: Konstantin Gizdov <arch@kge.pw>

pkgname=(cuda12.0-versioned cuda12.0-versioned-tools)
pkgbase=cuda12.0-versioned
pkgver=12.0.1
_driverver=525.85.12
_cuda_dir=/opt/cuda/cuda-12.0
pkgrel=1
pkgdesc="NVIDIA's GPU programming toolkit, version 12.0"
arch=('x86_64')
url="https://developer.nvidia.com/cuda-zone"
license=('custom:NVIDIA')
depends=('cuda-versioned-common' 'gcc12-libs' 'gcc12' 'opencl-nvidia' 'nvidia-utils' 'python')
options=(!strip staticlibs)
install=cuda-versioned.install
source=(https://developer.download.nvidia.com/compute/cuda/${pkgver}/local_installers/cuda_${pkgver}_${_driverver}_linux.run
        accinj64.pc
        cublas.pc
        cuda.pc
        cudart.pc
        cufft.pc
        cufftw.pc
        cuinj64.pc
        curand.pc
        cusolver.pc
        cusparse.pc
        nppc.pc
        nppial.pc
        nppicc.pc
        nppicom.pc
        nppidei.pc
        nppif.pc
        nppig.pc
        nppim.pc
        nppi.pc
        nppist.pc
        nppisu.pc
        nppitc.pc
        npps.pc
        nvgraph.pc
        nvidia-ml.pc
        nvjpeg.pc
        nvrtc.pc
        nvToolsExt.pc)
sha512sums=('edd73c6e989e8469d73a8a8c4c927aa0654c1c299eff77c8b30dafd5da6e4e368626cec48978785f8e94fe8d1b7b73f1df6d5d03a80a6f58a07fa2d1f15c7f86'
            'b8b945efa06467c5ebd654045f82d9790c9a49eadfd36e59e5ef30ecf5dbcf5be9d5d1ba4b4a7f30a06858ea3c4309c4697f6032540f89975a0d690394d364fd'
            'f68a9da2e65c5f033b47e01a3a77e3e916d665490581d5f220625a3b182df7ede11048134feb4190c937de78a9d7d86e8addd5731d848b3ac105d651cb934a7c'
            '59743ad5d9b4e7ac90bf52bc2930c539eddf66aa195ddf639bfd67d4c124d62588348d2d04bc1d78d78b784efb4fd53f7e49f02375e781dd1d62677e271a039f'
            '84274b71b782300f3cce80910ef7deca01e0ba53e08d505f9a98c53ed4f09a63fb6cc91a946764ea5403d805d321e6d9d5066dba637bfcd16fc0e3139cf7153e'
            '3bb7991af48f5453172aba9ac9a6bb597090aa7266a7ead14780e743b9f808a798e85bc7a041a1f5a4a5cd78050b51f77241753754e9f5ed7d550ff25fb2970e'
            '5523a36f94d12a3ffeb9a55dbd513cc0b25c9666f418f9f16d46495a1fd655d68b74e0bacbcf859c0196901613eaaad4335ee09cd3b3e1fbc7c3578768ed3a95'
            '205639ebe568c5df8207cb7373525806ca640da3ca83b8a78cfcf9fb981c521bc5e14fe5c4ecd73bd87a50e4e261c826d96c68a641df1620459cee478f3a965b'
            '2bd1f18e36ce5f27c74425b8a53cb2ae6104723b9a35db466c46a8b72559e0316285e94c4490937403ae2c6e24a3b79ad962d39bc9784f627ff6b6c571b4e5f4'
            '6f38c1b1d0cf0e60c7b1e9dc76946abb11bc791226642359293e255973503b217604592c70e05f348096694d7ff70f4228860e0ea1cf549b3cb6150961e9685d'
            '7ddc486f9363559455637b88a638cb161cf9165c4e9f73acf02d9522bf85fff1c485d286e26d509ff009e01a0922bfadb0433c28f16727d7b0058dd0a79894c3'
            '83f6d6d679cde9c53a4689be61f632480fe7a9b57f2af89579942c4f6035277d7adc11dbac38e2c2fe37ba0d48facb63c77ab608f168d175fccb5978b0d7a779'
            '52dd1e471ca5588e106c7afd314f201af21ec2ea4b39c2e8871fbe0db348631a831287df7c0afb3aab51e7de67e5af11436d589df696550edb711dc82eab0726'
            '600f014a75eed186f610e16c751ac270eb663c82654b89ef70eb625edba82912c53194dbe3202ff7ddc987388d8ee03b7508d96929285d20d040e4d220220bf5'
            '712a10b1c2373a913329175b76b221c3b7bc22010c7493704b65da05cb314b7d997397ad31b852a5e12ba56619dee42064efd77a352fdcd29bf7fbff9814da40'
            'b19e949eec4b3b01926c246074a89a458dee8c7c59a676425688078f963221eee7f8703fd378d92d46bb5ce512ee3e60a695c84172946630d05f966d7bf3dfbc'
            '5762429bd3633ae22578bf0ffe877dd676fbaf19162fb8879c6f6b835259161f0a67b12c2b296b376ba9818a552ec5090b37fdf4a812262941887301e84e86d0'
            'f2e0e907ca9b32639bf807cf8003c339f5eb3559c0c9074457c31a9156ec9dd0304f46de90c13d5a3e8e98d567163bd22e75aa6b0b97151703621afdfa52dbb8'
            '06cfe4f68ab5630c237bb3889f8a40b07eae4a1e896737b20c05b91f590e0ac1ca7849d2a57970eb244effd8a7616d267ace198e838c7e472e14c1a2bfed3032'
            'ca06d2275aca69932c3ca5e8f4020180ca43aa4dcdd4b310f9ef20ff6c1e5eaeffbcdde64b632860a38b3b755351f900ee60f1548695eb6a60f6e906b8b51154'
            'f1c80532b5808bf3a13a46de5f5339285f834c77d6117c689c40f725b7c4d63bc49d0b6976f29e8f50bd0fb30fe9236a7a262e5af94e539b222ad0c2daa4ca41'
            '34cf24fa50ef8aa51cd3591ec41692e994f3f22a545082ddf2200413802bbdfe23575b7db630ed610c0f280ded942d8cfa8330b56ffd02cf0d5b8ee4e74f0ddb'
            '50815a9088dde615ec5de3733f5ae47a780d06db662a95659c3ff183bd93403dd996b420f3a279a36c1ccd95ede403d6ca3e86579bed90f9be092a498f74afd9'
            '7846148bfbed4ce94f5e55c6dd1183b303475f7c657f429a8a8fc3e2e9ba4efd1db1a92c9b5251ab2e2b6a34e394ff85c4ba958a4bf6922e1e108a9c74a5a195'
            '507789da2a6938ecec6ad7c77304530fa6c32970b89cd03c5e276ced3e43c83750cdcedea5fe254b02818d8d8f739ea26cb1614ea3ce30c10d6046fd1a50ca93'
            '8b13b2b81d8a8e742051fa0d9cfd94efeb1bd9e55a373b331ea8c565b1ebad7b6d3013af82c217667e107be2a0910d45587a5a4bd55f6176d990d6c43171a528'
            '5e3b14a19fa001af81c137bbdc66a7d50d7606053697b388ef61b50ea34c8223e21edb75228caf1bc7d295049eae94791897178c6bca75a889833584ea57dc78'
            'bc9bd3dc0e40ed232c5d465dd41f09741d1eb5a642fc902749c5e03c3397321ad058b19013a10c8a0ae8303764a7578911d9bc91e7f8c45aa40fb00a1a084c95'
            '12f6fa55a17d61738ec679fdd0303033e5099fa1dbedb165372c78e68edb35f8a6143c72e8d4aee907d7f170bbb7828ca185e78cb632dc17a13dbefa08ad1491')

prepare() {
  sh cuda_${pkgver}_${_driverver}_linux.run --target "${srcdir}" --noexec
}

build() {
  local _prepdir="${srcdir}/prep"

  cd "${srcdir}/builds"

  rm -r NVIDIA*.run bin
  mkdir -p "${_prepdir}${_cuda_dir}/extras"
  mv integration nsight_compute nsight_systems EULA.txt "${_prepdir}${_cuda_dir}"
  mv cuda_demo_suite/extras/demo_suite "${_prepdir}${_cuda_dir}/extras/demo_suite"
  mv cuda_sanitizer_api/compute-sanitizer "${_prepdir}${_cuda_dir}/extras/compute-sanitizer"
  rmdir cuda_sanitizer_api
  for lib in *; do
    if [[ "$lib" =~ .*"version.json".* ]]; then
      continue
    fi
    cp -r $lib/* "${_prepdir}${_cuda_dir}/"
  done

  # Delete some unnecessary files
  rm -r "${_prepdir}"${_cuda_dir}/bin/cuda-uninstaller

  # Define compilers for CUDA to use.
  # This allows us to use older versions of GCC if we have to.
  ln -s /usr/bin/gcc-12 "${_prepdir}${_cuda_dir}/bin/gcc"
  ln -s /usr/bin/g++-12 "${_prepdir}${_cuda_dir}/bin/g++"

  # Install profile and ld.so.config files [handled by cuda-versioned-common]
  #install -Dm755 "${srcdir}/cuda.sh" "${_prepdir}/etc/profile.d/cuda.sh"
  #install -Dm644 "${srcdir}/cuda.conf" "${_prepdir}/etc/ld.so.conf.d/cuda.conf"

  # Install pkgconfig files
  mkdir -p "${_prepdir}${_cuda_dir}/pkg-config"
  cp "${srcdir}"/*.pc "${_prepdir}${_cuda_dir}/pkg-config"

  mkdir -p "${_prepdir}/usr/share/licenses/${pkgname}"
  ln -s ${_cuda_dir}/EULA.txt "${_prepdir}/usr/share/licenses/${pkgname}/EULA.txt"
  ln -s ${_cuda_dir}/README "${_prepdir}/usr/share/licenses/${pkgname}/README"

  # Add a symlink lib->lib64 as some libraries might expect that (FS#76951)
  ln -s lib64 "${_prepdir}${_cuda_dir}/lib"

  # Allow newer compilers to work. This is not officially supported in the Arch package but
  # if users want to try, let them try.
  # See https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#system-requirements
  # for official requirements
  sed -i "/.*unsupported GNU version.*/d" "${_prepdir}"${_cuda_dir}/targets/x86_64-linux/include/crt/host_config.h
  sed -i "/.*unsupported clang version.*/d" "${_prepdir}"${_cuda_dir}/targets/x86_64-linux/include/crt/host_config.h

  # Fix Makefile paths to CUDA
  for f in $(find "$_prepdir"${_cuda_dir} -name Makefile); do
    sed -i "s|/usr/local/cuda|${_cuda_dir}|g" "$f"
  done
}

package_cuda12.0-versioned() {
#  replaces=('cuda-toolkit' 'cuda-sdk' 'cuda-static')
  provides=('cuda' 'cuda-toolkit' 'cuda-sdk' 'libcudart.so' 'libcublas.so' 'libcusolver.so' 'libcusparse.so')
  optdepends=('gdb: for cuda-gdb'
              'glu: required for some profiling tools in CUPTI')

  local _prepdir="${srcdir}/prep"

  cd "${_prepdir}"
  cp -al * "${pkgdir}"

  # remove broken links
  rm "${pkgdir}"${_cuda_dir}/include/include
  rm "${pkgdir}"${_cuda_dir}/lib64/lib64

  rm -r "${pkgdir}"${_cuda_dir}/{bin/nvvp,bin/computeprof,libnvvp,nsight*}
}

package_cuda12.0-versioned-tools() {
  pkgdesc="NVIDIA's GPU programming toolkit (extra tools: nvvp, nsight), version 12.0"
  provides=('cuda-tools')
  depends=('cuda12.0-versioned' 'java-runtime=8' 'nss')
  optdepends=('perl: required by some NVVP plugins')

  local _prepdir="${srcdir}/prep"

  mkdir -p "${pkgdir}${_cuda_dir}/bin"
  mv "${_prepdir}"${_cuda_dir}/nsight* "${pkgdir}${_cuda_dir}"
  mv "${_prepdir}"${_cuda_dir}/bin/nvvp "${pkgdir}${_cuda_dir}/bin/nvvp"
  mv "${_prepdir}"${_cuda_dir}/bin/computeprof "${pkgdir}${_cuda_dir}/bin/computeprof"
  mv "${_prepdir}"${_cuda_dir}/libnvvp "${pkgdir}${_cuda_dir}"

  # licenses
  mkdir -p "${pkgdir}/usr/share/licenses"
  ln -s /usr/share/licenses/${pkgbase} "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:

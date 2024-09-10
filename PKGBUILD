# Maintainer: Karl Ludwig Brennan <karlludwigbrennan@outlook.com>
# Contributer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributer: Konstantin Gizdov <arch@kge.pw>

pkgname=(cuda11.4-versioned cuda11.4-versioned-tools)
pkgbase=cuda11.4-versioned
pkgver=11.4.4
_driverver=470.82.01
_cuda_dir=/opt/cuda/cuda-11.4
pkgrel=1
pkgdesc="NVIDIA's GPU programming toolkit, version 11.4"
arch=('x86_64')
url="https://developer.nvidia.com/cuda-zone"
license=('custom:NVIDIA')
depends=('cuda-versioned-common' 'gcc10-libs' 'gcc10' 'opencl-nvidia' 'nvidia-utils' 'python')
options=(!strip staticlibs)
install=cuda-versioned.install
source=(https://developer.download.nvidia.com/compute/cuda/${pkgver}/local_installers/cuda_${pkgver}_${_driverver}_linux.run
        cuda-findgllib_mk.diff
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
sha512sums=('eabba741e569541514f5c0bb780edf4dcedb229899af3a60f8437a1c9d63ef4c9f39f672227c02999fdcdc127476caaf545590669fa49b170a090a49e7161436'
            '41d6b6cad934f135eafde610d1cbd862033977fd4416a4b6abaa47709a70bab7fcf6f8377c21329084fb9db13f2a8c8c20e93c15292d7d4a6448d70a33b23f1b'
            'c09194ac815768cb1cbefc3cce237f59ebfb6eb97618fd0bbe8eccfc133b4b3d378bd5065273428aa7b25e330735bcc3efaaa57dfec172fed50641a921ff4717'
            'c1b0841b8a57bb1703715beedf1e67fb0d3ba71c535e7a9391fc1ed9c04d2b5355a0da871c8031cf34b66c77bd52a1a12852a2e31d72033b3e72247b8f486b27'
            '60efa230dde73564416d37570e4159fd6de89893dcfa87fe2db8bfa2cb3a9a869c06c919573130aa25c61d497cc2596707939089f3d5bd18d36216c1828724f6'
            'ef788a088ad4dc773b2a0cae09ed61652a79661cb21896fe2c5b9b5d1c7153b395514d57cbcd4e87f3884fc03298eae923ae5f94717f9e538944961caec18a3f'
            '30c0a94d53ac25d9611d26d33886868508a77461f9b779d85d83e574d1ec1228b0c85d51eafdd54a547a1aca480b49301b4525fa85c4e56db18ccd0cf56ee1f3'
            '18cac2359894fbc7f4d12f608bf6477981eb6289bf8b18943600ab1532de04b12ec99546d56046b390e258d2c35e42c4006376b0f8fa2521ef67c44381a32ab9'
            'f13d2e6690086887660947a92b2677e3a6be767d0abe2986cfac7007fafc75a5e1c2be1561061172cd3670a167dd954d76b1d0dfd975e54a64df1aa1f1c1c2c2'
            'b0d7276ecf662af0c25c44e9687e32676efd02f8136ffeea49af7aac43b3b365026bef6917a13cb17714d976b828009997343e35dafd815b8dc2fe970037f0b3'
            'b953322c48e1064d7c3eff3e66c9b79ccab4b8a3c0e074a82119e63bb0e8b2879388b5c2df4aca854c0f2cd985d9d61492d222e121d765c8f05528a652eba9f3'
            '469c25f44fdce2463505bcd650105ef0fc24ceca97c4710fab90e561b2ec421aa120732585210b6dbbd4b5f7df8e9cf9d63f5b6c1839899ff16d278d546a9ad1'
            'f9906932cdf38b803eb1c76a5b3ab925671a8072db7378e03ec7517b9b2c3a4aeac933fc6f1eb143301d02b28d7e22135d987cd62875312423938637ac28c7e2'
            '613122c3999b40445ec13623e5139aa929fa3923bfb982dc775587ece5eaac620284e9a7209335050764bbcd9b133135eff95d7ab3e89eae86aabd0dbf17c26f'
            '34dfb78d584260a82bede6451d574264fd177cb5a34adc99e3b35e3e37f9a5fde4df14d344c7329e644752007d5083cb1c84cd377706a2e14f391f13d97953d1'
            '8ea27d1fc23c7c72e436ee44f2807cd07b87c48f19f213a9cc2b30f1107b8ad01ab9aabf8f9ea5e450cecb5c31ccec4b75348a95b1efde95c9181a06f75cb4bd'
            'a49d4dbbb34cb2b43977a83fbf3dbadea61a2be41a6db0966649535a0a6073ad5a374ed0b36b97a6d1a0923c4e0e3cc384207400c3aae23294d987c23fd87c1a'
            '1d1109179e21694e90b4e7de0a190cda64cd8f9fd7300ab76861b67ecfaaa761aa66f92ca1f5dfc0195b7081ea46c658e510556bcda09ba2a25e837ed68a0a0f'
            'd2e617e034ddf960589b9d54a380b6fa819cc62d73da603e55463d1aeeb4b7bd839162563c0e7acdeeedf9afb27af6cc73da470e8f1c94914bd58433ee90081a'
            'a967dd3164c225445cbdacff7e5c37e494eef1491ba2216f3e0256061857154a2a59b89e45ba802a2d4b60a3480fb95bae6c09f3df13d07e2f49fe50e18758a1'
            '9f1e77a50ce1205cccb3430b4f6a65121a5caab73cd7d1f00e6b4ed21a8b18a1a73ea99a1d7dc50954bbede3d76bbc2849abbb12b563556ef8591a1a5912f7e1'
            '57804f9ed7c8ef1300b2d85f705eeaa803d545ab9ae4f29967841eaf5de455d5ef0645648ee155e901a4acf78d01b78c7f0eb7f4c65e78840267757f0364b6de'
            'd0b6361ca632b8a205c86b56d63c0ca4c729339bf94e3028f544607d153557c7794dc950212fe7fec4a168cc439ea74a0d4ab84d86e8dd9699875094f9b42a54'
            '2c437c446bbd585aafdf9667769cac43fc3b1c97ec09cb07007ed7f79a4e0dfe85383158f6e61b4d65eb2a8735b125c40e046ac153faf7556cffa4a2ba861a9d'
            '0b12c2685e23ed08ad6bc53b5e13317193e01b55f5a09cb9d24d3c20549c0f1c0cde0b9b089d7ca8400e7ca55177bb06bf8317a3116fa051296e77df88604640'
            '50522d748daa70b6ea041a9b602da518596ef1d316c39da4b1bf90dfa450da5b34b94e281518684af6c4a869a5a4d57de4256c521e2133d42b5ad6c6b5d4b93c'
            'cec9220d16c02cd4dab7cd82d56fd05d0b281e4c43184545e0c4a1ea1858296f048d5892cfa8c7f4acbc7b34b1f8124956e12223ee16373b16907788beda25d8'
            'f53829e302ef44286c35f8510a8f2feaab7c0610c29fd456dbffd423f7769ec639cc5334151885a32f2dd464b16f8b23592c018478984b595e252c9746cbea09'
            '723f4fc5724b6875caab3b2f7843979a3f90325e78d3a85edc154503fa43cf16d3ceed250ca68e80194bf1d3e2fa084728e1a683a8a8a9a5d42ee07fe314841e'
            '18f023b97ba3a31062017e601ac0de99f80cef5e331c05510caf3d7424c5ed4059655c51d42ba568f8b94bdb1ea5adf9597fd032872b307a9a14127bdad035d1')

prepare() {
  sh cuda_${pkgver}_${_driverver}_linux.run --target "${srcdir}" --noexec

  # Fix up samples tht use findgllib_mk
  for f in builds/cuda_samples/*/*/findgllib.mk; do
    patch $f cuda-findgllib_mk.diff
  done
}

build() {
  local _prepdir="${srcdir}/prep"

  cd "${srcdir}/builds"

  rm -r NVIDIA*.run bin
  mkdir -p "${_prepdir}${_cuda_dir}/extras"
  mv cuda_samples "${_prepdir}${_cuda_dir}/samples"
  mv integration nsight_compute nsight_systems EULA.txt "${_prepdir}${_cuda_dir}"
  mv cuda_sanitizer_api/compute-sanitizer "${_prepdir}${_cuda_dir}/extras/compute-sanitizer"
  rmdir cuda_sanitizer_api
  for lib in *; do
    if [[ "$lib" =~ .*"version.json".* ]]; then
      continue
    fi
    cp -r $lib/* "${_prepdir}${_cuda_dir}/"
  done

  # Delete some unnecessary files
  rm -r "${_prepdir}"${_cuda_dir}/{bin/cuda-uninstaller,samples/bin/cuda-uninstaller}

  # Define compilers for CUDA to use.
  # This allows us to use older versions of GCC if we have to.
  ln -s /usr/bin/gcc-10 "${_prepdir}${_cuda_dir}/bin/gcc"
  ln -s /usr/bin/g++-10 "${_prepdir}${_cuda_dir}/bin/g++"

  # Install profile and ld.so.config files [handled by cuda-versioned-common]
  #install -Dm755 "${srcdir}/cuda.sh" "${_prepdir}/etc/profile.d/cuda.sh"
  #install -Dm644 "${srcdir}/cuda.conf" "${_prepdir}/etc/ld.so.conf.d/cuda.conf"

  # Install pkgconfig files
  mkdir -p "${_prepdir}${_cuda_dir}/pkg-config"
  cp "${srcdir}"/*.pc "${_prepdir}${_cuda_dir}/pkg-config"

  mkdir -p "${_prepdir}/usr/share/licenses/${pkgname}"
  ln -s ${_cuda_dir}/EULA.txt "${_prepdir}/usr/share/licenses/${pkgname}/EULA.txt"
  ln -s ${_cuda_dir}/README "${_prepdir}/usr/share/licenses/${pkgname}/README"

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

package_cuda11.4-versioned() {
#  replaces=('cuda-toolkit' 'cuda-sdk' 'cuda-static')
  provides=('cuda' 'cuda-toolkit' 'cuda-sdk' 'libcudart.so' 'libcublas.so' 'libcusolver.so' 'libcusparse.so')
  optdepends=('gdb: for cuda-gdb'
              'glu: required for some profiling tools in CUPTI')

  local _prepdir="${srcdir}/prep"

  cd "${_prepdir}"
  cp -al * "${pkgdir}"

  rm -r "${pkgdir}"${_cuda_dir}/{bin/nvvp,bin/computeprof,libnvvp,nsight*,samples}
}

package_cuda11.4-versioned-tools() {
  pkgdesc="NVIDIA's GPU programming toolkit (extra tools: nvvp, nsight, samples) (version 11.4)"
  provides=('cuda-tools')
  depends=('cuda11.4-versioned' 'java-runtime=8' 'nss')
  optdepends=('glu: required for some CUDA samples'
              'freeglut: required for some CUDA samples'
              'perl: required by some NVVP plugins')

  local _prepdir="${srcdir}/prep"

  mkdir -p "${pkgdir}${_cuda_dir}/bin"
  mv "${_prepdir}"${_cuda_dir}/nsight* "${pkgdir}${_cuda_dir}"
  mv "${_prepdir}"${_cuda_dir}/bin/nvvp "${pkgdir}${_cuda_dir}/bin/nvvp"
  mv "${_prepdir}"${_cuda_dir}/bin/computeprof "${pkgdir}${_cuda_dir}/bin/computeprof"
  mv "${_prepdir}"${_cuda_dir}/{libnvvp,samples} "${pkgdir}${_cuda_dir}"

  # licenses
  mkdir -p "${pkgdir}/usr/share/licenses"
  ln -s /usr/share/licenses/cuda "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:

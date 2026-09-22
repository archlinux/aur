# Maintainer: Dmytro Priadko <yesthymajesty at gmail dot com>
# Contributor: Stephan Düsterhaupt <me at stephanduesterhaupt dot de>
# Contributor: Ivo Noack <ivo at insonic dot de>

pkgname=cuda-12.6
pkgver=12.6.3
_driverver=560.35.05
_reqdriverver=560.35
pkgrel=1
pkgdesc="NVIDIA's GPU programming toolkit"
arch=('x86_64')
url="https://developer.nvidia.com/cuda-zone"
license=('custom:NVIDIA')
depends=('gcc-libs'  'gcc' 'opencl-nvidia' 'nvidia-utils')
conflicts=('cuda' 'cudnn')
replaces=('cuda-toolkit' 'cuda-sdk')
provides=('cuda-toolkit' 'cuda-sdk' 'cuda=12.6')
optdepends=('gdb: for cuda-gdb'
            'java-runtime=8: for nsight and nvvp')
options=(!strip staticlibs)
install=cuda.install
source=(http://developer.download.nvidia.com/compute/cuda/${pkgver}/local_installers/cuda_${pkgver}_${_driverver}_linux.run
        cuda.sh
        cuda.conf
        cuda-findgllib_mk.diff
        *.pc)
sha512sums=('a93d9d812d3a3f5823622e2274d1d6dbe17a298b33463fdf9f6d211d38766eab76608f9d545e312b2be2b86b3c59fcd92c37c54b38b0e8206191563d00546d62'
            '79aa6fbeff13a2bcef5791c2288d4b072dfe7b17593261ee79302dc6c77ae368e73f5cac9ce38893fc0068e4895f5cde475faf507fac058fb697c8da3198587f'
            '714d973bc79446f73bebe85306b3566fe25b554bcbcba2fcbe76709a3eca71fb5d183ab4da2d3b5e9326cb9cd8d13a93f6d4a005ea5a41f7ef8e6c6e81e06b5e'
            '41d6b6cad934f135eafde610d1cbd862033977fd4416a4b6abaa47709a70bab7fcf6f8377c21329084fb9db13f2a8c8c20e93c15292d7d4a6448d70a33b23f1b'
            '7caa3dcd299b605f5af1058015a399c5725eb927b7c6e77948e86ee69ad1559224cb01588fd02f55a5960a883c65fee5c20fa7be43337411c16ab31355f1670b'
            'e3c337a6304ce8e375f36d610318a6a84dafeb36e6e1d5b06311d921c72cc24ae0af1fd10cd72df23f02ffc1e1184458023769dfde57902dda64ede3b502894e'
            '1e637ed070d640b244406aed3fb944d8d4e655c8a6cd0c57bbdd65077d777bb0d6fbb4bcd39d8b07482b2e84a95e7a835fce1d8f227835070ca06749445b7c8b'
            '67dd52572a4bc2db9ad629f92577d207a89407f9664cab6bfea0031dd4114e26b9f2d972ee70ae8f9fc78739565f2472be3a5021dce98fd6d734391001dbdb8f'
            '1379fb4ed0f5934c3acb2273999640ad87a8461c65bc6d5def8514b02985e051f5f9510de0bde3435f2f8df4dcb62eba39256b786d4878e7086f78f03f71e111'
            'cdf2e27e29c8b1809a7bbeb5974091afdaf3031b731136c1661188f3ad9f21459a3b6792c0f83af187352a0863955daa5a47307b5a571556dec3a208afb41209'
            '91387963e7f921870deb17ff30f321155ca18021b5a9b35610b39eab194422d80ac7b71b0be34ee74df754af67cd252d6c3dd09eeddb0888810b978538a7fbeb'
            '8fda94545e4660524a624d1b2d988b44e5dd624b2fc628076c07d923863bdb5dd9fe008c89288fb0493859b4fd08630bb710ed843d6eb23964940efc284d978f'
            '9730bc1932f97192f65dc7ce08556086f32f79e117712386bbc0a6932604b64a8c77239952f9cce180700d1b78c233d4ba4d4688d08d4b8b7644ac3bffff9de2'
            'ddf19fad421a97d5a18152dd0dfd90dec8d41506ca22cffd01c175405e366b8b31088440d58499fce42ea1ab80b061cf4fcbe8ffe5b07426d0ae64b78df93ad7'
            'b06f0ad310cc3169d81fba147a6521eae1f671607c40c05b72a4b260fdbe58bc281a24a60505e51b15539502814546bc861b290bfa685a55f1910ef47acb3490'
            '622388413cc236d057ba3905f4410e9faeabc892810be09f55787cbeab6ad00ae7a70f48ef63a5c468e16c7d5c5efc167c45a40ed9988483084de852b6909646'
            '72159af0ac0807b36aea5f59f70e1a78d2c1e0383e57655ed7f57fbd5cd8dab5674a86a93d736ef2b91e981078e255328f4ebbcc7d855495c706979e4c1514d5'
            '817acfa0a7327412a925d0a6f779ea5955f4b062aca4096e9b60c8d96d7ef27fc9c25040f58814998a02a36fc11895fe4c15759a1842c60602bade44a490dc58'
            '652f33ce5196522ef85dec6e839678ef545a7f79bf3e7fba5c58eb9cac9c1531d2942b1481940fc68416b9bf67fcb7e82690e3d05772b7f6c4df3a8750e9082a'
            'e2768a681746ebe1d77e92bc3576181db28de5f74e097c156cf7fe997e91b48100dde871857dab3ca002dd7f24172148a73a513bfbb1aea4a187942cc8f7e64f'
            'ce0c181760f5395d0d55163a67eb270c329ea3f68570417da86e193a3196f26b8c08b793aee074b54bb028c2e61b6ce07b78e0c8fcb14eb10e86e5b5e8d33991'
            '37a46adef50380247d41d5ffff9719c0e5d25a509846a4cf257cad9f210ff7876add365f516da77e7b04268f335bcdba62f1e2852206c08effd76bc8f4e73326'
            '98e8abe7e5dd433479a5b82df8c3d5fa63c3ef4873058e55efa05c0cfde8eef0677f3fbd0ab9e6024dcc5c68b024652fdb1ce45f2a87ee51689953e6f4096f27'
            '042aa31802c2a187df12b4297e5ffee4f13927e9d204d5ac00c7b9e42103ad7d7eb405b9111c84553b5053530814c924799ad2fd9bcfe72e88c785c954875eb5'
            'f19d25f0ff2e71680d31d6188fac9777e76940965e08cd5969e0bec548c1005a80385c6aa9b61c2c1460a7cb28244726f222097caaeb8e3609a3c780dc0b1e48'
            '57392678d6af3fb3539dd7d4710a327f0403d2bdac26f9760c34fa0dab7ec0daa9629155e20229975b837d9cf207ba74b9ac89007347c7b778ea0c595dafab0f'
            '1f3510020655709ce2f18a67dc1569ed08d16d68fe164d912290050b6d0387439d7c912b512838633cfea9a4cb6a554637fca7d0035c5bc2b954fb415d3596bc'
            '94c2590fd96730fa6395213778f0907b55263ac37bb9dab0c538984a6c030d193252decc6d44caf80c3513ff44b03041df241f1a87469689c513b85aa859a634'
            'cff372343aa2dd1855f10dc98584c64e845e7e57f05a8b87e428d6c4570d75722625dd05876c2768be8c299ad3c27b41bf55aff5d39d6c1c3b5b38eaec6512c0'
            '6c12e5759bab781a0408f2796bea87744960a49915b833c2ac92b83188671e1e5823a4dfecdf210e11229e2c3a1e84f8250fcb6bb32040d198768efc643af9d7'
            '3fbcdfabf81de1c4618b17cd6ca9bdf431c067d780b31e3187664102d3b2bc00f3b1e20bfb9a15244fa95b00224897ad7da9e34bc45355296a10aa5511f26159'
            '83b425f263c8d17335edb4c5ff678594d1975314a485cfa21dffda6582b72ab0cb36c88619a282a8d903ae18a1d1682541fef6f2931ff12471f0dec01bff6c8d')

prepare() {
  sh cuda_${pkgver}_${_driverver}_linux.run --target "${srcdir}" --noexec

  # Fix up samples tht use findgllib_mk
  #for f in builds/cuda_samples/*/*/findgllib.mk; do
  #  patch $f cuda-findgllib_mk.diff
  #done
}

package() {
  cd "${srcdir}/builds"

  rm -r NVIDIA*.run bin
  mkdir -p "${pkgdir}/opt/cuda/extras"
  #mv cuda_samples "${pkgdir}/opt/cuda/samples"
  mv integration nsight_compute nsight_systems EULA.txt "${pkgdir}/opt/cuda"
  # mv cuda_sanitizer_api/compute-sanitizer "${pkgdir}/opt/cuda/extras/compute-sanitizer"
  # rmdir cuda_sanitizer_api
  for lib in *; do
    if [ -d "$lib" ]; then
      cp -r $lib/* "${pkgdir}/opt/cuda/"
    fi
  done

  # Define compilers for CUDA to use.
  # This allows us to use older versions of GCC if we have to.
  ln -s /usr/bin/gcc "${pkgdir}/opt/cuda/bin/gcc"
  ln -s /usr/bin/g++ "${pkgdir}/opt/cuda/bin/g++"

  # Install profile and ld.so.config files
  install -Dm755 "${srcdir}/cuda.sh" "${pkgdir}/etc/profile.d/cuda.sh"
  install -Dm644 "${srcdir}/cuda.conf" "${pkgdir}/etc/ld.so.conf.d/cuda.conf"

  # Install pkgconfig files
  mkdir -p "$pkgdir"/usr/lib/pkgconfig
  cp "${srcdir}"/*.pc "${pkgdir}"/usr/lib/pkgconfig

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s /opt/cuda/doc/pdf/EULA.pdf "${pkgdir}/usr/share/licenses/${pkgname}/EULA.pdf"

  # Allow newer compilers to work. This is not officially supported in the Arch package but
  # if users want to try, let them try.
  # See https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#system-requirements
  # for official requirements
  sed -i "/.*unsupported GNU version.*/d" "${pkgdir}"/opt/cuda/targets/${CARCH}-linux/include/crt/host_config.h
  sed -i "/.*unsupported clang version.*/d" "${pkgdir}"/opt/cuda/targets/${CARCH}-linux/include/crt/host_config.h

  # Fix Makefile paths to CUDA
  for f in $(find "$pkgdir"/opt/cuda -name Makefile); do
    sed -i "s|/usr/local/cuda|/opt/cuda|g" "$f"
  done

  # As this was ported from the cuda arch package version 11.1 I'm not sure what to do with it
  # didn't had any issues so far on my experiments

  # NVIDIA has trouble with counting and numbering 
  # as well as the elusive concept of a SONAME so...
  # ln -s /opt/cuda/targets/x86_64-linux/lib/libcudart.so.11.1.74 "${pkgdir}/opt/cuda/targets/x86_64-linux/lib/libcudart.so.11.1"
}

# vim:set ts=2 sw=2 et:

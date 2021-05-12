# Maintainer: Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Daniel Bermond <dbermond@archlinux.org>

pkgname=mingw-w64-amf-headers
pkgver=1.4.18
pkgrel=1
pkgdesc='Header files for AMD Advanced Media Framework (mingw-w64)'
arch=(any)
url=https://github.com/GPUOpen-LibrariesAndSDKs/AMF/
license=(MIT)
depends=(amf-headers)
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

package() {
  for _arch in ${_architectures}; do
      install -dm 755 "${pkgdir}"/usr/${_arch}/include
      ln -s /usr/include/AMF "${pkgdir}"/usr/${_arch}/include/AMF
  done
}

# vim: ts=2 sw=2 et:

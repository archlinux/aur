# Maintainer: yuri_k7 <riyu12383@gmail.com>
pkgname=smpeg0
pkgver=0.4.5
pkgrel=1
pkgdesc="SDL MPEG Player Library - Legacy version 0.4.5"
arch=(x86_64)
url=https://icculus.org/smpeg/
license=(LGPL)
depends=(sdl)
optdepends=('glu: to use glmovie')
provides=(smpeg0)
source=('https://archive.archlinux.org/packages/s/smpeg/smpeg-0.4.5-5-x86_64.pkg.tar.zst')
sha256sums=('a25ef96ff199930e3be79b186f66bc5768909aaabf273d3b301a85f7ddb295b5')
prepare(){
  rm "${srcdir}/usr/bin/plaympeg"
  rm "${srcdir}/usr/share/man/man1/plaympeg.1.gz"
}
package(){
  install -dm755 "${srcdir}/usr/bin" "${pkgdir}/usr/bin/"
  install -dm755 "${srcdir}/usr/include/" "${pkgdir}/usr/include/"
  install -dm755 "${srcdir}/usr/lib" "${pkgdir}/usr/lib/"
  install -dm755 "${srcdir}/usr/share" "${pkgdir}/usr/share/"
  cp -R "${srcdir}/usr" "${pkgdir}"
}

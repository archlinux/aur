# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=youtube-dl
pkgver=2012.12.11
pkgrel=1
pkgdesc="A small command-line program to download videos from YouTube.com and a few more sites"
arch=('any')
url="http://rg3.github.com/youtube-dl/"
license=('custom')
depends=('python')
source=(${pkgname}-${pkgver}::https://github.com/downloads/rg3/youtube-dl/youtube-dl)
sha1sums=('aa45f8e32c637a2342674f32d1ca9e8f70bf695c')

package() {
  cd "${srcdir}"
  install -D -m755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/youtube-dl"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  echo "Public Domain" > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

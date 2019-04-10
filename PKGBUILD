# Maintainer: Sam Whited <sam@samwhited.com>

_fnt_name=nixie-one
pkgname=ttf-${_fnt_name}
pkgver=1.0.0
pkgrel=1
pkgdesc="A mixture of neon tubes, signage, and a typewriter."
arch=('any')
url="http://jovanny.ru/"
license=('custom:OFL')
source=('http://jovanny.ru/files/fonts/nixie.zip')
sha256sums=('aa2db7b12190fbec270fb29a604ae2f185a0b126ba78c943d4694b83d274b729')

package() {
  install -d ${pkgdir}/usr/share/fonts/TTF
  install -Dm644 ${srcdir}/Nixie/NixieOne.ttf ${pkgdir}/usr/share/fonts/TTF/

	install -Dm644 "${srcdir}/Nixie/FREE FONT LICENSE.txt" ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}

# Maintainer: acedron <acedrons@yahoo.co.jp>

pkgname=hoku-project
pkgver=1.0.3
pkgrel=1
pkgdesc="A basic Japanese TTS."
arch=('any')
url="https://github.com/acedron/${pkgname}"
license=('GPL')
depends=('python3' 'sox' 'alsa-utils')
source=("${pkgname}-${pkgver}.tar.xz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
md5sums=('SKIP')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  make install PREFIX="${pkgdir}/usr"
}

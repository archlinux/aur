# Maintainer: NOGISAKA Sadata <ngsksdt@gmail.com>

pkgname=echo-meme
pkgver=1.1.0
pkgrel=1
pkgdesc='Print your message as a part of various Japanese internet memes.'
arch=('any')
url='https://github.com/greymd/echo-meme'
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/greymd/${pkgname}/archive/v${pkgver}.tar.gz")

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  ./install.sh "${pkgdir}/usr"
}

# vim: set et sw=2 sts=2:
sha256sums=('7f013cb66e38bfacac0f213409afc9e263c43a0f89d220f73c81bbbe80a99a35')

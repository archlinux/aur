# Maintainer: VCalV
_pkgname=myna
pkgname="otf-${_pkgname}"
pkgver=1.0.0
pkgrel=1
pkgdesc="Monospace typeface designed for symbol-rich programming"
arch=('any')
url="https://github.com/sayyadirfanali/Myna"
license=('OFL-1.1')
depends=()
source=("https://github.com/sayyadirfanali/Myna/releases/download/v${pkgver}/Myna.otf")
sha512sums=('3421629c250396f6daf675239fd2c435ada499f79144754a31609f186f5601bbd30576b2ffd2e0f208b08c6521fa999a4dc55f81c49a3e8218e20439daafae3f')

package() {
  install -Dm644 "${srcdir}/Myna.otf" "${pkgdir}/usr/share/fonts/OTF/Myna.otf"
}

# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=paclog
pkgver=1.1
pkgrel=1
pkgdesc='List recent commits for Arch Linux packages'
url='https://github.com/protist/paclog'
arch=('any')
license=('GPL3')
depends=('w3m')
source=("https://github.com/protist/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('84652ad0f1715b836d05358de4296fec222d1360526356682dbd53d1adc04892')

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 ${pkgname} "$pkgdir/usr/bin/${pkgname}"
}

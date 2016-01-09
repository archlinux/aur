# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=paclog
pkgver=1.0
pkgrel=1
pkgdesc='List recent commits for Arch Linux packages'
url='https://github.com/protist/paclog'
arch=('any')
license=('GPL3')
depends=('w3m')
source=("https://github.com/protist/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('b7225fcc157aaa7a3bea42fd92a97eac0edaa14eedfd222d4dc4ffb5c7756f8c')

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 ${pkgname} "$pkgdir/usr/bin/${pkgname}"
}

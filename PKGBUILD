# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=paclog
pkgver=1.1.1
pkgrel=1
pkgdesc='List recent commits for Arch Linux packages'
url='https://github.com/protist/paclog'
arch=('any')
license=('GPL3')
depends=('w3m')
source=("https://github.com/protist/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('eb4473a44e9521dfcae5fc3de66f45b8b2e054bc6291abb8735f9543185ea8d7')

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 ${pkgname} "$pkgdir/usr/bin/${pkgname}"
}

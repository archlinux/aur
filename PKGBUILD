# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=mutt-vid
pkgver=1.0
pkgrel=1
pkgdesc='Manage multiple sender accounts in mutt'
url='https://github.com/protist/mutt-vid'
arch=('any')
license=('GPL3')
depends=('mutt')
source=("https://github.com/protist/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('defcbf56b6fe071aa4dc4975ab24aefb4cedb0b55573f42f0322ff3e5102637d')

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 ${pkgname} "$pkgdir/usr/bin/${pkgname}"
}

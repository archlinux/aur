# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=mutt-vid
pkgver=1.1
pkgrel=1
pkgdesc='Manage multiple sender accounts in mutt'
url='https://github.com/protist/mutt-vid'
arch=('any')
license=('GPL3')
depends=('mutt')
source=("https://github.com/protist/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('99aa654f10b9c1d6602bd85a5ee999db245d5e490b0cac6fd415f37c8da05ed1')

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 ${pkgname} "$pkgdir/usr/bin/${pkgname}"
}

# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=mutt-vid
pkgver=1.2.0
pkgrel=1
pkgdesc='Manage multiple sender accounts in mutt'
url='https://gitlab.com/protist/mutt-vid'
arch=('any')
license=('GPL-3.0-only')
optdepends=('mutt: either mutt or neomutt'
            'neomutt: either neomutt or mutt')
source=("https://gitlab.com/protist/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('8ea5fbbf82a40b62c2b6f8e8c78adcacfbdc22197a44b2f3d15c4e11998815d4')

package() {
  cd "$pkgname-v$pkgver"

  install -Dm755 ${pkgname} "$pkgdir/usr/bin/${pkgname}"
}

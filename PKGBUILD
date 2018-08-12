# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=mutt-vid
pkgver=1.1
pkgrel=3
pkgdesc='Manage multiple sender accounts in mutt'
url='https://gitlab.com/protist/mutt-vid'
arch=('any')
license=('GPL3')
optdepends=('mutt: either mutt or neomutt'
            'neomutt: either neomutt or mutt')
source=("https://gitlab.com/protist/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('4cac8c3b2e6b7820215ef028285e450f1ad20ae1a4ad63d988a14ae9e8433827')

package() {
  cd "$pkgname-v$pkgver"

  install -Dm755 ${pkgname} "$pkgdir/usr/bin/${pkgname}"
}

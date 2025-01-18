# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=mutt-vid
pkgver=1.1.1
pkgrel=1
pkgdesc='Manage multiple sender accounts in mutt'
url='https://gitlab.com/protist/mutt-vid'
arch=('any')
license=('GPL-3.0-only')
optdepends=('mutt: either mutt or neomutt'
            'neomutt: either neomutt or mutt')
source=("https://gitlab.com/protist/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('0db59af35cf511a5d75fd386242b2db61f332f1772b0d98cc4e39e2568e59b31')

package() {
  cd "$pkgname-v$pkgver"

  install -Dm755 ${pkgname} "$pkgdir/usr/bin/${pkgname}"
}

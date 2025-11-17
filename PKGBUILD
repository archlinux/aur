# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=mutt-vid
pkgver=1.3.0
pkgrel=3
pkgdesc='Manage multiple sender accounts in mutt'
url='https://gitlab.com/protist/mutt-vid'
arch=('any')
license=('GPL-3.0-only')
optdepends=('mutt: either mutt or neomutt'
            'neomutt: either neomutt or mutt')
source=("https://gitlab.com/protist/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('7ae4549f887b2c29a05652a3fbf4b6ea7f0bd9f65ef018f2cde2cb902cded97c')

package() {
  cd "$pkgname-v$pkgver"

  install -Dm755 ${pkgname} "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 -t "$pkgdir/usr/lib/systemd/user" systemd/*
}

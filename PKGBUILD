# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=mutt-vid
pkgver=1.3.1
pkgrel=1
pkgdesc='Manage multiple sender accounts in mutt'
url='https://gitlab.com/protist/mutt-vid'
arch=('any')
license=('GPL-3.0-only')
optdepends=('mutt: either mutt or neomutt'
            'neomutt: either neomutt or mutt')
source=("https://gitlab.com/protist/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('f9c8d8a86e3af3479da895f945dbbe1ed4be45d71bb9f763ea3a1c5a84415c03')

package() {
  cd "$pkgname-v$pkgver"

  install -Dm755 ${pkgname} "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 -t "$pkgdir/usr/lib/systemd/user" systemd/*
}

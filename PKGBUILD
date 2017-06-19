# Maintainer: pancho horrillo <pancho at pancho dot name>
# Contributor: Daniel M. Capella <polyzen at archlinux dot info>

pkgname=firefox-pentadactyl-signed
pkgver=7309
pkgrel=1
pkgdesc='Firefox for Vim and Links addicts (signed fork)'
url=http://5digits.org/pentadactyl
arch=('any')
license=('MIT')
source=("https://github.com/willsALMANJ/pentadactyl-signed/releases/download/$pkgver/pentadactyl-signed-$pkgver.xpi")
noextract=("${source##*/}")
sha512sums=('6ba274632d971893322ba281761c937559139a2a41174069793e2d897df049acfb7112a632ea916439925f839b74ae04ea6e0754cfb92b54cba8558d0248b16d')

package() {
  install -Dm644 ${source##*/} "$pkgdir"/usr/lib/firefox/browser/extensions/pentadactyl-signed@willsalmanj.github.com.xpi
}

# vim:set ts=2 sw=2 et:

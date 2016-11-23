# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-pentadactyl-signed
pkgver=7300
pkgrel=1
pkgdesc='Firefox for Vim and Links addicts (signed fork)'
url=http://5digits.org/pentadactyl
arch=('any')
license=('MIT')
depends=('firefox')
source=("https://github.com/willsALMANJ/pentadactyl-signed/releases/download/$pkgver/pentadactyl-signed-$pkgver.xpi")
noextract=("${source##*/}")
sha512sums=('637113e07b1214d14a23c784eae27b59eba814be31ac97d23120498d4bba0d26de8ab5cb478084df43bc4b69800ed0ef9ee1a30e0a2d8fc368ca2f6d3911542a')

package() {
  install -Dm644 ${source##*/} "$pkgdir"/usr/lib/firefox/browser/extensions/pentadactyl-signed@willsalmanj.github.com.xpi
}

# vim:set ts=2 sw=2 et:

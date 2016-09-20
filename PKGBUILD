# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-pentadactyl-signed
pkgver=7294
pkgrel=1
pkgdesc='Firefox for Vim and Links addicts (signed fork)'
url=http://5digits.org/pentadactyl
arch=('any')
license=('MIT')
depends=('firefox')
source=("https://github.com/willsALMANJ/pentadactyl-signed/releases/download/$pkgver/pentadactyl-signed-$pkgver.xpi")
noextract=("${source##*/}")
sha256sums=('5f7d19141d59c5dcd059ac585af2ae6f716b4c7603b3be82d9971c3d82679612')

package() {
  install -Dm755 ${source##*/} "$pkgdir"/usr/lib/firefox/browser/extensions/pentadactyl-signed@willsalmanj.github.com.xpi
}

# vim:set ts=2 sw=2 et:

# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-pentadactyl-signed
pkgver=7287
pkgrel=1
pkgdesc='Firefox for Vim and Links addicts (signed fork)'
url=http://5digits.org/pentadactyl
arch=('any')
license=('MIT')
depends=('firefox')
source=("https://github.com/willsALMANJ/pentadactyl-signed/releases/download/$pkgver/pentadactyl-signed-$pkgver.xpi")
noextract=("${source##*/}")
sha256sums=('224f783c2ef12bb0ad4981849134004824fab2ad68d429fbb30229df74242497')

package() {
  install -Dm755 ${source##*/} "$pkgdir"/usr/lib/firefox/browser/extensions/pentadactyl-signed@willsalmanj.github.com.xpi
}

# vim:set ts=2 sw=2 et:

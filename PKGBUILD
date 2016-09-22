# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-pentadactyl-signed
pkgver=7296
pkgrel=1
pkgdesc='Firefox for Vim and Links addicts (signed fork)'
url=http://5digits.org/pentadactyl
arch=('any')
license=('MIT')
depends=('firefox')
source=("https://github.com/willsALMANJ/pentadactyl-signed/releases/download/$pkgver/pentadactyl-signed-$pkgver.xpi")
noextract=("${source##*/}")
sha512sums=('14982ac40b0e6e7c6487298ea4d76390e96e1611c1f09800b43778835ae0f9b65f4d5890c045040a8e0f38c1e1ec1b7549702c96aada832359b16b90c7218a43')

package() {
  install -Dm755 ${source##*/} "$pkgdir"/usr/lib/firefox/browser/extensions/pentadactyl-signed@willsalmanj.github.com.xpi
}

# vim:set ts=2 sw=2 et:

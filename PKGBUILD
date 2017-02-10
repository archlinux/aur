# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-pentadactyl-signed
pkgver=7306
pkgrel=1
pkgdesc='Firefox for Vim and Links addicts (signed fork)'
url=http://5digits.org/pentadactyl
arch=('any')
license=('MIT')
source=("https://github.com/willsALMANJ/pentadactyl-signed/releases/download/$pkgver/pentadactyl-signed-$pkgver.xpi")
noextract=("${source##*/}")
sha512sums=('a630799f0e878cb3839d9840b6439038720c9e82a5bd927aaa6c15e471ec6ff6e200f114b9124102bdd13c1ba8b130b9752dca6081d72a26c0f92d9bced691ed')

package() {
  install -Dm644 ${source##*/} "$pkgdir"/usr/lib/firefox/browser/extensions/pentadactyl-signed@willsalmanj.github.com.xpi
}

# vim:set ts=2 sw=2 et:

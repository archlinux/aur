# Maintainer: pancho horrillo <pancho at pancho dot name>
# Contributor: Daniel M. Capella <polyzen at archlinux dot info>

pkgname=firefox-pentadactyl-signed
pkgver=7308
_pkgver=7308a
pkgrel=1
pkgdesc='Firefox for Vim and Links addicts (signed fork)'
url=http://5digits.org/pentadactyl
arch=('any')
license=('MIT')
source=("https://github.com/willsALMANJ/pentadactyl-signed/releases/download/$_pkgver/pentadactyl-signed-$pkgver.xpi")
noextract=("${source##*/}")
sha512sums=('0ad559f5263d6bd135412ff7cc25261329ae7cdc492c2fb30c427aef8284ae9af3005819a3ea6f1338908c70d2b2571896ed2acddee0d894d2febf9f273b78c8')

package() {
  install -Dm644 ${source##*/} "$pkgdir"/usr/lib/firefox/browser/extensions/pentadactyl-signed@willsalmanj.github.com.xpi
}

# vim:set ts=2 sw=2 et:

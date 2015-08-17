# Maintainer: crescentrose <tko dot netko at gmail dot com>

pkgname=fortune-mod-bisnap
pkgver=20150817
pkgrel=1
pkgdesc="A collection of quotes from bisnap's Twitch channel for use with fortune."
url="https://github.com/crescentrose/fortune-mod-bisnap"
arch=('any')
license=('custom:none')
makedepends=('git')
depends=('fortune-mod')
groups=('fortune-mods')

build () {
	git clone https://github.com/crescentrose/fortune-mod-bisnap.git .
}

package () {
  install -D -m644 bisnap $pkgdir/usr/share/fortune/bisnap
  install -D -m644 bisnap.dat $pkgdir/usr/share/fortune/bisnap.dat
}

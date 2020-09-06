# Maintainer: Simon Mangel <simon dot mangel dot sm at gmail dot com>

_pkgname=Arc-Dark-OSX
pkgname=arc-dark-osx-openbox-theme-git
pkgver=2.3b5d1f2
pkgrel=1
pkgdesc="Arc-Dark based theme inspired by OSX for Openbox"
arch=('any')
url="https://github.com/Dr-Noob/Arc-Dark-OSX"
license=('unknown')
depends=('openbox')
source=("git+https://github.com/Dr-Noob/Arc-Dark-OSX.git")
md5sums=('SKIP')

package () {
	cd "$srcdir"

	mkdir -p "$pkgdir"/usr/share/theme
	cp -Rp "$_pkgname" "$pkgdir"/usr/share/themes
	chmod 644 "$pkgdir"/usr/share/themes/"$_pkgname"/openbox-3/*
}

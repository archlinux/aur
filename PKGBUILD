# Maintainer: Frefreak <frefreak.zxy at gmail dot com>

_pkgname=pandoc
pkgname="${_pkgname}-dummy"
pkgver=1.19.2.1
pkgrel=79
pkgdesc='make archlinux believes you have pandoc installed'
arch=('i686' 'x86_64')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

package() {
	which pandoc > /dev/null  2>&1 && exit 0
	echo "pandoc not found in PATH"
}

# Maintainer: Frefreak <frefreak.zxy at gmail dot com>

_pkgname=pandoc
pkgname="${_pkgname}-dummy"
pkgver=0.0.1
pkgrel=1
pkgdesc='make archlinux believes you have pandoc installed'
url='https://github.com/jgm/pandoc'
license=('GPL')
arch=('any')
depends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")

build() {
	:
}

package() {
	which pandoc > /dev/null  2>&1 && exit 0
	echo "pandoc not found in PATH"
}

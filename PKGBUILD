# Maintainer: Stick <nstickney@pm.me>
# shellcheck disable=2034

pkgname=ttf-ms33558
pkgver=1
pkgrel=1
pkgdesc='US military standard font for aircraft instrument dials'
url='https://www.wfonts.com/font/ms-33558'
arch=('any')
license=('none')
source=('https://www.wfonts.com/download/data/2016/05/15/ms-33558/ms-33558.zip')
sha256sums=('bcd599495b7b80ef2e12f3be4feafd6a87d0e3d323fb946c49beb74edf0fc7a3')

package() {
	# shellcheck disable=2154
	install -D -m0644 "${srcdir}"/MS33558.ttf "${pkgdir}"/usr/share/fonts/TTF/MS33558.ttf
}


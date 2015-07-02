# Maintainer: 3ED <krzysztof1987@gmail.com>

pkgname=xcursor-semi-transparent
pkgver=2008.01.30
pkgrel=1
pkgdesc="Semi-transparent Cursors Theme"
arch=('any')
url="http://gnome-look.org/content/show.php/Semi-transparent+Cursors?content=74499"
license=('GPL')
source=(http://gnome-look.org/CONTENT/content-files/74499-semi-transparent.tar.gz)
md5sums=('1c78eb5aa97153432b9ee19f5fe65e92')

build() {
	/bin/true
}

package() {
	mkdir -p "${pkgdir}/usr/share/icons"
	cp -R "${srcdir}/semi-transparent" "${pkgdir}/usr/share/icons/"
  chmod -R a=rX,u+w "${pkgdir}/"
}

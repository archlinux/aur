# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: dibblethewrecker <dibblethewrecker.at.jiwe.org>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=ico2xpm
pkgver=1.3
pkgrel=2
pkgdesc="A utility which converts Windows icons into X pixmaps"
arch=('x86_64')
url="http://ico2xpm.sourceforge.net/"
license=('GPL')
source=(http://downloads.sourceforge.net/ico2xpm/$pkgver/ico2xpm-${pkgver/./_}-src.tar.gz)
md5sums=('fbae5631281cb6b48ca31f78bbbcba85')

build() {
	cd "$srcdir"/${pkgname}-${pkgver}
	make
}

package() {
	cd "$srcdir"/${pkgname}-${pkgver}
	install -Dm755 ${pkgname} "$pkgdir"/usr/bin/${pkgname}
}

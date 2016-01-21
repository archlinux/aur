# $Id: PKGBUILD,v1.0 2015/04/21 12:34:00 wh Exp $
# Maintainer: nisk1 <esqueleto_bajo[it_looks_like_a_snail]outlook[dot]com>

pkgname=soma
pkgver=2.10.6
pkgrel=1
pkgdesc="Soma - a dialog internet radio player"
url="http://www.dawoodfall.net/slackbuilds/noversion/soma"
arch=('any')
license=('GPL')
depends=(dialog mplayer)
source=("http://www.dawoodfall.net/files/slackbuilds/noversion/soma/${pkgname}-${pkgver}.tar.gz")
md5sums=('dd0c934c00244e93e30f23a606436b24')

package() {
	cd $srcdir/$pkgname-$pkgver/
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/etc/soma

	install -m 755 soma ${pkgdir}/usr/bin/soma
	install -m 644 options.conf ${pkgdir}/etc/soma/
	install -m 644 stations.conf ${pkgdir}/etc/soma/
	install -m 644 dialogrc ${pkgdir}/etc/soma/
}


# Maintainer: Max Roder <maxroder@web.de>

pkgname='wpscrack'
pkgver='0.0.1'
pkgrel='2'
pkgdesc='Prove of concept tool to brute force WPS - external registrar PIN of wlan access points'
url='http://sviehb.wordpress.com'
arch=('any')
license=('unknown')
depends=('pycrypto' 'scapy')
source=('http://dl.dropbox.com/u/22108808/wpscrack.zip')
sha256sums=('c29cb3104e790bb0169652784254f29f17f504a84b027947774b5e5ef511c02a')

package() {
	cd ${srcdir}

	sed -i 's/python/python2/g' wpscrack.py

	install -Dm644 README ${pkgdir}/usr/share/doc/${pkgname}/README
	install -Dm755 wpscrack.py ${pkgdir}/usr/bin/wpscrack
}

# vim:set ts=2 sw=2 et:

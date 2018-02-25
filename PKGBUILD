# Maintainer: jdn06 <jdn06.jdn06@outlook.fr>

pkgname=iramuteq-bin
pkgver=0.7.alpha2
pkgver_=0.7-alpha2
pkgrel=2
pkgdesc="Statistical analysis of text"
arch=('any')
url="http://www.iramuteq.org/"
license=('GPL')
depends=('python2' 'wxpython' 'python2-xlrd' 'r')
source=("https://kent.dl.sourceforge.net/project/iramuteq/iramuteq-$pkgver_/iramuteq_0.7-alpha2-2_all.deb")
sha256sums=('2cf74bf357ee1719ed73ad20b885b26a810874fa5e80dc587aae918f4eb553ea')

package() {
	tar xf data.tar.xz -C "${pkgdir}"
	sed -i 's/python /python2 /g' ${pkgdir}/usr/bin/iramuteq
    }

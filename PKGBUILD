# Maintainer: Nobody <nobody@noone.com>
pkgname=eod-client-x86_64
pkgver=13.8.3
pkgrel=1
pkgdesc="Exceed on Demand Client from OpenText (x86_64)."
arch=('x86_64')
license=('custom')
groups=()
url="http://connectivity.opentext.de/products/linux--und-unix-plattformen.aspx"
source=("http://mimage.opentext.com/patches/connectivity/eod8/_ed0wn15/e0dc1n7/linux/eodclient8-${pkgver}-linux-x64.tar.gz")
md5sums=('9145373848fc88cf35012e173aa18192')

package()
{
	cd ${srcdir}/Exceed_onDemand_Client_8
	mkdir -p ${pkgdir}/opt/eod
	mkdir -p ${pkgdir}/usr/bin
	cp -r * ${pkgdir}/opt/eod/.
	ln -s /opt/eod/eodxc ${pkgdir}/usr/bin/eodxc
}


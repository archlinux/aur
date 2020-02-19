# Contributor: Daniel Milde <daniel@milde.cz>

pkgname=pyvmmonitor
pkgver=1.1.2
pkgrel=1
_hash64=qdz3f2vs31a42z6
_hash32=9smdc57z9yshc3a
pkgdesc="Profiler with a simple goal: being the best way to profile a Python program."
arch=(i686 x86_64)
url="http://www.pyvmmonitor.com/"
license=('custom')
depends=('python-yappi')
source_i686=(http://www.mediafire.com/download/$_hash32/${pkgname}_${pkgver}_linux.x86.tar.gz)
source_x86_64=(http://www.mediafire.com/download/$_hash64/${pkgname}_${pkgver}_linux.x86_64.tar.gz)
md5sums_i686=('09e154b06fad5d33bb85b0658eac95d9')
md5sums_x86_64=('bc1c554c74d5f7639a8540f1e26bc1c5')


package() {
	cd $srcdir
	
	install -d $pkgdir/opt
	install -d $pkgdir/usr
	install -d $pkgdir/usr/bin
	
	cp -R $pkgname $pkgdir/opt
	ln -s /opt/pyvmmonitor/pyvmmonitor-ui $pkgdir/usr/bin/pyvmmonitor-ui
}

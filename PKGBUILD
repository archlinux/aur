# Maintainer: Daniel Milde <daniel@milde.cz>

pkgname=pyvmmonitor
pkgver=1.0.1
pkgrel=1
pkgdesc="Profiler with a simple goal: being the best way to profile a Python program."
arch=(x86_64)
url="http://www.pyvmmonitor.com/"
license=('custom')
depends=('python-yappi')
source=(https://bbc5a801c67991bd078f7f789065e318bdf9d509.googledrive.com/host/0BwwQN8QrgsRpOGpyc2syWkVYVkE/PyVmMonitor%20${pkgver}/${pkgname}_${pkgver}_linux.x86_64.tar.gz)
md5sums=('1bc94a63fd858c2de32ad87466cd6997')

package() {
	cd $srcdir
	
	install -d $pkgdir/opt
	install -d $pkgdir/usr
	install -d $pkgdir/usr/bin
	
	cp -R $pkgname $pkgdir/opt
	ln -s /opt/pyvmmonitor/pyvmmonitor-ui $pkgdir/usr/bin/pyvmmonitor-ui
}

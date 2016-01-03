# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Former Maintainer: sundar_ima <feedback.multibootusb@gmail.com>
# Maintainer: Angel_Caido <geussepe at gmail dot com>>

pkgname=multibootusb
pkgver=7.5.0
pkgrel=1
pkgdesc="Boot multiple live Linux distros from a usb flash drive."
arch=('any')
url="http://multibootusb.org"
license=('GPL')
depends=('python2-pyqt4' 'mtools' 'util-linux' 'parted')
sha512sums=('b5a01dd81d90abd45b8443d922704432e84ceb58ad67c8cfe289064230f721baec420244000533d82e5c66db29767054556d8f8f2606918a8b3e51e24199a867')
#makepkgopt = strip
#makepkgopt = docs
#makepkgopt = libtool
#makepkgopt = emptydirs
#makepkgopt = zipman
#makepkgopt = purge
#makepkgopt = !upx
source=("http://iweb.dl.sourceforge.net/project/$pkgname/${pkgver}/Source/$pkgname-${pkgver}.tar.gz")

package () {
    cd "$srcdir/$pkgname-$pkgver"
	python2.7 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=4 sw=4 et:
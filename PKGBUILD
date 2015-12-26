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
sha512sums=('a89ff59923173f4eebf1e87a288982773b0621dbbb4ebfe80d81afb08d9d9ea5ba88c766a632308da89dee042a5c61df543c2969985b8f0393cd6de5db03286d')
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
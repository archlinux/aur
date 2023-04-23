# Maintainer: a13xie <rostik.medved@gmail.com>
pkgname=('libproidplus-gui')
pkgver=2.3.3
pkgrel=1
_filename="libproidplus-gui-${pkgver}-0.x86_64"
pkgdesc="Library for ProID+ SmartCards"
arch=('x86_64')
url="https://proid.cz/"
license=('custom:EULA')
source=("local://${_filename}.rpm.zip")
sha256sums=('df5ba87e1c96be56c25f29351e1de61ea63fe4cf06f53caf32673f5d0dd3a3fe')

package () {
	bsdtar -C "$pkgdir" -xf "$srcdir/${_filename}.rpm"
	mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
}

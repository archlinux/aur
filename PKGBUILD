# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=flrig-docs
_pkgname=flrig
__pkgname=FLRig
pkgver=1.3
pkgrel=1
pkgdesc="Documentation/help when using FLRIG w/out i-net access"
arch=('any')
url="http://www.w1hkj.com/flrig-help/index.htm"
license=('GPL')
optdepends=('flrig' 'epdfview')
source=(http://w1hkj.com/${_pkgname}-help/${__pkgname}_Users_Manual.pdf)
#http://www.w1hkj.com/flrig-help/FLRig_Users_Manual.pdf

package() {
	cd $srcdir

	install -Dm644 ${__pkgname}_Users_Manual.pdf $pkgdir/usr/share/${_pkgname}/docs/${_pkgname}.pdf
}
md5sums=('ba340a636213058db85e4cf4e40929f5')
sha256sums=('c8f1c39269f8c3e3692dbf78f93519a330e3c482d721f5d2ca4faabeec298aa4')

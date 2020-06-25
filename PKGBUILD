# Submitted by: Norbert Pfeiler <norbert.pfeiler+aur ät gmail.com>
# Maintainer: Oliver Weissbarth <mail ät oweissbarth.de>

pkgname=checkupdates+aur
pkgver=1
pkgrel=2
pkgdesc='combines checkupdates and checkupdates-aur with separator as argument'
arch=('any')
license=('LGPL3')
depends=('checkupdates-aur')
source=("checkupdates+aur.bash")
sha512sums=('84a9e643085c144945cb016017cc6e35609abc9a283f6636175ebb6eb61944e1c6fa31608181a4cd53d486cb99e4f8e6096372ba5c804db283d4fa1f295c7268')

package() {
	install -D -m755 "$srcdir/checkupdates+aur.bash" "$pkgdir/usr/bin/checkupdates+aur"
}

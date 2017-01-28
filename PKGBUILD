# Maintainer: Norbert Pfeiler <norbert.pfeiler+aur ät gmail.com>

pkgname=checkupdates+aur
pkgver=1
pkgrel=1
pkgdesc='combines checkupdates and checkupdates-aur with separator as argument'
arch=('any')
license=('LGPL3')
depends=('checkupdates-aur')
source=("checkupdates+aur.bash")
sha512sums=('c2fbcb0845e8f1b77d1414fc28c4f38693ef5460025cd317ddbd4940724b2b1045c8deed3d73233af49bda83864aa8e5915956712efe70355e3ffcefc605e837')

package() {
	install -D -m755 "$srcdir/checkupdates+aur.bash" "$pkgdir/usr/bin/checkupdates+aur"
}

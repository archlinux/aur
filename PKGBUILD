# Submitted by: Norbert Pfeiler <norbert.pfeiler+aur ät gmail.com>
# Maintainer: Oliver Weissbarth <mail ät oweissbarth.de>

pkgname=checkupdates+aur
pkgver=1
pkgrel=3
pkgdesc='combines checkupdates and checkupdates-aur with separator as argument'
arch=('any')
license=('LGPL3')
depends=('pacman-contrib' 'checkupdates-aur')
source=("checkupdates+aur.bash")
sha512sums=('5bc4733b1d49b4a6a3e439bd2176eab139f26540057e4bda82a7176713b728eeaa67bfe8dffcfc26ed73cf72b0eb6e52f38f44b3890df5bf9e0628a63bf1cac8')

package() {
	install -D -m755 "$srcdir/checkupdates+aur.bash" "$pkgdir/usr/bin/checkupdates+aur"
}

# Maintainer: Norbert Pfeiler <norbert.pfeiler+aur ät gmail.com>

pkgname=checkupdates+aur
pkgver=1
pkgrel=2
pkgdesc='combines checkupdates and checkupdates-aur with separator as argument'
arch=('any')
license=('LGPL3')
depends=('checkupdates-aur')
source=("checkupdates+aur.bash")
sha512sums=('353363969ac84d6b597eb9f2f487616a8852114ac0ce4710d26a10e8690f2a64df263323d64990dea96df56ae0be2b50ad0dfe181bd595ae11346b795990cf7b')

package() {
	install -D -m755 "$srcdir/checkupdates+aur.bash" "$pkgdir/usr/bin/checkupdates+aur"
}

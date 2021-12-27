# Maintainer : Barfin
# Packager :  Alem swaj <alemswaj@tutanota.com>
# Pevious Maintainer: Jack Lupino 
pkgname=lelivrescolaire
pkgver='2.2.1'
pkgrel=1
pkgdesc="Lelivrescolaire.fr Éditions : application innovante pour consulter vos manuels scolaires de la 6e à la Terminale !"
arch=('x86_64')
url="lelivrescolaire.fr"
license=('MIT')
depends=(gtk3 libnotify libnss_nis libxss libxtst xdg-utils python-atspi libappindicator-gtk3 libsecret)
source=("https://ci.lls.fr/build/latest/linux/Lelivrescolaire.fr.deb")
md5sums=('SKIP')

prepare() {
	bsdtar -xf $srcdir/data.tar.xz
}

package() {
	cp -a usr/ "$pkgdir"/usr/
	cp -a opt/ "$pkgdir"/opt/
}


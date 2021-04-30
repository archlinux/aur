# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=pandaroule-customization
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="the PandaRoule#5870 (DISCORD) Linux GNOME 40 Customization"
arch=(x86_64 i686)
url=""
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://wevofiles.epizy.com/DAdwaita.tar.xz"
        "http://wevofiles.epizy.com/Inverse.tar.xz" "http://wevofiles.epizy.com/Kimi-dark.tar.gz" "http://wevofiles.epizy.com/Simple-dark.tgz")
noextract=()
md5sums=("a69314fa126b6fd4708889c649b1e260" "4b8527706eaf8f5ca948992b0395a9bf" "fcba4615150f09ecc9a35f6a47cb80e6" "4cf6257fe59f3521537cb4c840e3ce76")
validpgpkeys=()

dadwaita() {
	cd DAdwaita
	cd gnome-shell
	mkdir -pv $pkgdir/usr/share/themes/gnome-shell
	cp *.css $pkgdir/usr/share/themes/
	cp *.css $pkgdir/usr/share/themes/gnome-shell/

}
inverse() {
	cd Inverse-dark
	mkdir -pv $pkgdir/usr/share/themes/Inverse-dark
	cp -r * $pkgdir/usr/share/themes/Inverse-dark/
}



kimidark() {
	cd Kimi-dark
	mkdir -pv $pkgdir/usr/share/themes/Kimi-dark
	cp -r * $pkgdir/usr/share/themes/Kimi-dark/
}
simpledark() {
	cd Simp1e-dark
	mkdir -pv $pkgdir/usr/share/icons/Simp1e-dark
	cp -r * $pkgdir/usr/share/icons/Simp1e-dark
}

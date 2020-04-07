# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Valentijn "noirscape" V. <neko at catgirlsin dot space>
pkgname=fusee-interfacee-tk-bin
_pkgname=fusee-interfacee-tk
pkgver=1.0.1
pkgrel=2
pkgdesc="A mod of falquinhos Fusée Launcher for use with Nintendo Homebrew Switch Guide. It also adds the ability to mount SD while in RCM."
arch=("x86_64")
url="https://github.com/nh-server/fusee-interfacee-tk"
license=('GPL2')
depends=("glibc")
provides=("fusee-interface-tk")
source=("$_pkgname-linux-$pkgver::https://github.com/nh-server/$_pkgname/releases/download/V$pkgver/$_pkgname-linux.zip")
noextract=()
md5sums=('65d1569eb3796fa723b30acbe9694adb')
validpgpkeys=()

package() {
	install -dm 755 "$pkgdir/usr/bin/"
	install -Dm 755 "$srcdir/fusee-interfacee-tk-linux/App For Linux/PayloadInjector" "$pkgdir/usr/bin/$_pkgname"
}

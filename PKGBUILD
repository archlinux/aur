# Maintainer: Bruno Wowk <bruno.wowk@gmail.com>
pkgname="evernote"
pkgver="5.8.13.8152"
pkgrel=1
epoch=
pkgdesc="Evernote, installs with wine"
arch=("x86_64")
url="http://evernote.com"
license=('unknown')
groups=()
depends=('wine' 'wine_gecko')
makedepends=()
checkdepends=()
optdepends=('xembedsniproxy: for tray icon under KDE Plasma')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(evernote "Setup.exe::http://cdn1.$pkgname.com/win5/public/Evernote_${pkgver}.exe")
noextract=("Setup.exe")
md5sums=("e9e2926db88f94b467aeb6f599fcbb73"
	 "c06c90cbbaa527a21256cc716769610b")

package() {
	install -d -m755 "$pkgdir"/usr/share/evernote
	cp -raL "$srcdir"/Setup.exe "$pkgdir"/usr/share/evernote
	install -d -m755 "$pkgdir"/usr/bin
	install -m755 evernote "$pkgdir"/usr/bin
}

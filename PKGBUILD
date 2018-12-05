# Maintainer: Oden S. <hello [at] odensc [dot] me>
pkgname=yubioath-krunner
pkgver=1.1.0
pkgrel=1
pkgdesc="Displays your YubiKey OATH credentials in krunner when you search for them."
arch=("any")
url="https://github.com/odensc/yubioath-krunner"
license=("LGPL")
depends=("python" "python-dbus" "python-fuzzywuzzy" "python-levenshtein" "python-gobject" "libnotify" "yubikey-manager" "xclip")
install=$pkgname.install
source=("https://github.com/odensc/yubioath-krunner/archive/v${pkgver}.tar.gz")
# update with updpkgsums
md5sums=('d31d59e373a5c14caf2b058ad85550d2')

package() {
	cd yubioath-krunner-1.0.0
	mkdir -p $pkgdir/usr/share/kservices5
	cp yubioath-krunner.desktop $pkgdir/usr/share/kservices5
	cp yubioath-krunner.py $pkgdir/usr/share/kservices5
}

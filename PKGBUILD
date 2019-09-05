# Maintainer: Oden S. <hello [at] odensc [dot] me>
pkgname=yubioath-krunner
pkgver=1.2.0
pkgrel=1
pkgdesc="Displays your YubiKey OATH credentials in krunner when you search for them."
arch=("any")
url="https://github.com/odensc/yubioath-krunner"
license=("LGPL")
depends=("python" "python-dbus" "python-fuzzywuzzy" "python-levenshtein" "python-gobject" "libnotify" "yubikey-manager" "xclip")
install=$pkgname.install
source=("https://github.com/odensc/yubioath-krunner/archive/v${pkgver}.tar.gz")
# update with updpkgsums
md5sums=('d201294d9f8f95d2da5a1f21190fd8b4')

package() {
	cd yubioath-krunner-$pkgver
	mkdir -p $pkgdir/usr/share/kservices5
	cp yubioath-krunner.desktop $pkgdir/usr/share/kservices5
	cp yubioath-krunner.py $pkgdir/usr/share/kservices5
}

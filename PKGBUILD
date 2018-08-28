# Maintainer: Oden S. <hello [at] odensc [dot] me>
pkgname=yubioath-krunner
pkgver=1.0.0
pkgrel=1
pkgdesc="Displays your YubiKey OATH credentials in krunner when you search for them."
arch=("any")
url="https://github.com/odensc/yubioath-krunner"
license=("LGPL")
depends=("python" "python-dbus" "python-fuzzywuzzy" "python-gobject" "libnotify" "yubikey-manager")
install=$pkgname.install
source=("https://github.com/odensc/yubioath-krunner/archive/v1.0.0.tar.gz")
# update with updpkgsums
md5sums=('b1383658f8306373040b1995041c6211')

package() {
	cd yubioath-krunner-1.0.0
	mkdir -p $pkgdir/usr/share/kservices5
	cp yubioath-krunner.desktop $pkgdir/usr/share/kservices5
	cp yubioath-krunner.py $pkgdir/usr/share/kservices5
}

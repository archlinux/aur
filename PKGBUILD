# Maintainer: Antoine Damhet <antoine.damhet@lse.epita.fr>
pkgname=mkinitcpio-gpg-encrypt
pkgdesc="mkinitcpio hook that adds GnuPG and smartcard support to FDE"
pkgver=0.5
pkgrel=1
arch=(any)
depends=(gnupg pcsclite libusb-compat)
install=${pkgname}.install
url="https://github.com/xdbob/mkinitcpio-gpg-encrypt"
source=(https://github.com/xdbob/$pkgname/archive/v$pkgver.tar.gz)
licence=('GPL')

build() {
	return 0
}

package() {
	cd "$pkgname-$pkgver"

	install -D -m0644 "gpg-encrypt-hook" "${pkgdir}/usr/lib/initcpio/hooks/gpg-encrypt"
	install -D -m0644 "gpg-encrypt-install" "${pkgdir}/usr/lib/initcpio/install/gpg-encrypt"
}

sha256sums=('1a22eab9f29fbc896a07c60ebdc0cf15eafb90525b14af790dd976d1cfd96199')

# Maintainer: Felix Singer

pkgname="mkinitcpio-openssh"
pkgver=0.0.1
pkgrel=1
pkgdesc="openssh mkinitcpio hook"
arch=('any')
url=""
license=('GPLv3')
depends=('openssh')
optdepends=()
conflicts=('mkinitcpio-tinyssh' 'mkinitcpio-dropbear')
install=${pkgname}.install
source=()
sha512sums=()

package() {
	install -m700 -d "${pkgdir}/etc/ssh-initrd"

	touch "${pkgdir}/etc/ssh-initrd/authorized_keys"
	chmod 600 "${pkgdir}/etc/ssh-initrd/authorized_keys"
}

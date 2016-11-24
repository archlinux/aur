# Contributor: moparisthebest <admin dot archlinux AT moparisthebest dot com>

pkgname=cryptsetup-multidisk
pkgver=1.0
pkgrel=1
pkgdesc='Handle multiple encrypted root devices'
arch=('any')
license=('GPL3')
url="https://github.com/moparisthebest/archlinux_encrypthook"
source=("https://codeload.github.com/moparisthebest/archlinux_encrypthook/tar.gz/v$pkgver")
sha256sums=('e38eed40eadfa7dadd697cbe6d06845edad35fcc37f910e5323d5b89fce5ef67')

package() {
	cd "archlinux_encrypthook-$pkgver"
	install -D -m644 encrypt_hook    "${pkgdir}"/usr/lib/initcpio/hooks/encrypt-multidisk
	install -D -m644 encrypt_install "${pkgdir}"/usr/lib/initcpio/install/encrypt-multidisk
}

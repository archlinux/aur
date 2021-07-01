# Maintainer: Primalmotion <primalmation at pm dot me>

pkgname=initramfs-l14kbdlight
pkgdesc="initramfs hook that turns Librem 14 keyboard on"
pkgver=1.0
pkgrel=3
license=(MIT)
arch=(any)
depends=(mkinitcpio)
source=(l14kbdlight-hook
		l14kbdlight-install
		README.md)

build() {
	return 0
}

package() {
	mkdir -p "${pkgdir}/usr/lib/initcpio/hooks"
	mkdir -p "${pkgdir}/usr/lib/initcpio/install"

	cp "${srcdir}/l14kbdlight-hook" "${pkgdir}/usr/lib/initcpio/hooks/l14kbdlight"
	cp "${srcdir}/l14kbdlight-install" "${pkgdir}/usr/lib/initcpio/install/l14kbdlight"

	mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
	cp "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/"
}

sha256sums=('8197fa26a502eee6472e764cead9d26bc95d5e1c318ab71ceb74a98efa5125f4'
            '0183c411f86b7dfd15c3025f8cee7d2f84df3369b4a9f273fd4e14df210d5261'
            '3ed869bc25c643c40cf36c76b9c50a3c3e06cd980e87dd68b1fd4e80241630be')

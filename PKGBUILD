# Maintainer: Randall Winkhart <idgr at tutanota dot com>

pkgname=rpass
pkgver=2021.09.15.mr4.2
pkgrel=1
pkgdesc="An rsync-based password manager and alternative to GNU pass"
arch=('x86_64' 'aarch64')
license=('GPL3')
depends=( python gnupg openssh rsync xclip wl-clipboard)

source_x86_64=('https://github.com/rwinkhart/rpass/releases/download/v2021.09.15.mr4.2/rpass-2021.09.15.mr4.2.tar.xz')
source_aarch64=('https://github.com/rwinkhart/rpass/releases/download/v2021.09.15.mr4.2/rpass-2021.09.15.mr4.2.tar.xz')
sha512sums_x86_64=('f3948d7c6e26f53d19a08db32ba7f7a3576d0386dea2338ff529cb3ee72365c3d405d6de5c812b398e87b8fe50b765a4fc2bcc899fe09cef9d2db44c7978d6bf')
sha512sums_aarch64=('f3948d7c6e26f53d19a08db32ba7f7a3576d0386dea2338ff529cb3ee72365c3d405d6de5c812b398e87b8fe50b765a4fc2bcc899fe09cef9d2db44c7978d6bf')

package() {

	tar xf rpass-"$pkgver".tar.xz -C "${pkgdir}"
	chown -R "$USER" ${pkgdir}/var/lib/rpass

}

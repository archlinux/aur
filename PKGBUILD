# Maintainer: Randall Winkhart (Cuan) <idgr at tutanota dot com>

pkgname=rpass
pkgver=2021.09.07.pr3.1
pkgrel=1
pkgdesc="An rsync-based password manager and alternative to GNU pass"
arch=('x86_64' 'aarch64')
license=('GPL3')
depends=( python gnupg openssh rsync )

source=('https://cloud.watergateserver.xyz/api/public/dl/6b0Wqz-J')
sha512sums=('f59cd1cd3c981b9424fba85bfd5e7b33e26a482d48b9b47a77be6f8e7cecbf078ec956a46b37db488d5173cd0a439f572ff06fc7d35cc3e9b0a7666e49cadeee')

package() {

    mv 6b0Wqz-J rpass-2021.09.07.pr3.1.tar.xz
	tar xf rpass-2021.09.07.pr3.1.tar.xz -C "${pkgdir}"
	chown -R "$USER" ${pkgdir}/var/lib/rpass

}


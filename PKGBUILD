# Maintainer: Randall Winkhart (Cuan) <idgr at tutanota dot com>

pkgname=rpass
pkgver=2021.09.07.pr3
pkgrel=1
pkgdesc="An rsync-based password manager and alternative to GNU pass"
arch=('x86_64' 'aarch64')
license=('GPL3')
depends=( python gnupg openssh rsync )

source=('https://cloud.watergateserver.xyz/api/public/dl/TfRRUA1B')
sha512sums=('1df5dce9fbc3028948bf84fc0326d1ac5989ccd4ada6218d5ff0a7094f74e0714e908031d30f10a5eda001a91f4ac1697786dc9f9053802b11832e04ac3eea0c')

package() {

    mv TfRRUA1B rpass-2021.09.07.pr3.tar.xz
	tar xf rpass-2021.09.07.pr3.tar.xz -C "${pkgdir}"
	chown -R "$USER" ${pkgdir}/var/lib/rpass

}


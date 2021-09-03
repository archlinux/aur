# Maintainer: Randall Winkhart (Cuan) <idgr at tutanota dot com>

pkgname=rpass
pkgver=2021.09.02.pr2
pkgrel=1
pkgdesc="An rsync-based password manager and alternative to GNU pass"
arch=('x86_64')
license=('GPL3')
depends=( bash gnupg python )

source=('https://cloud.watergateserver.xyz/api/public/dl/Fe-Ugvov')
sha512sums=('a4c6af4df11c6a3c68d162da2f5e9156ff4795709ef0fb02ff5a165c129d969c3d1f61bf996fbd455f01bf228f4f60ad477200596b6002672d2f9bdd9880c4ca')

package() {

    mv Fe-Ugvov rpass-2021.09.02.pr2.tar.xz
	tar xf rpass-2021.09.02.pr2.tar.xz -C "${pkgdir}"
	chown -R "$USER" ${pkgdir}/var/lib/rpass

}


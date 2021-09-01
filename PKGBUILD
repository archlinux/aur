# Maintainer: Randall Winkhart (Cuan) <idgr at tutanota dot com>

pkgname=rpass
pkgver=2021.09.01.pr1.1
pkgrel=1
pkgdesc="An rsync-based password manager and alternative to GNU pass"
arch=('x86_64')
options=('!emptydirs')
url="https://watergateserver.xyz"
license=('GPL3')
depends=( bash gnupg python )

source=('https://cloud.watergateserver.xyz/api/public/dl/KzymJs3t')
sha512sums=('0e809a16825e22af9b30e904028195a2e12967e07c8785cdf498adc82e8df7b983b6ac886c4d8b6138791643e83fab5c516f87d74990eaa1cf02dab4bfd2f38d')

package() {

    mv KzymJs3t rpass-2021.09.01.pr1.1.tar.xz
	tar xf rpass-2021.09.01.pr1.1.tar.xz -C "${pkgdir}"
	chown -R "$USER" ${pkgdir}/var/lib/rpass

}


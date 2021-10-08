# Maintainer: Randall Winkhart <idgr at tutanota dot com>

pkgname=rpass
pkgver=2021.10.07.mr5
pkgrel=1
pkgdesc='An rsync-based password manager and alternative to GNU pass'
url='https://github.com/rwinkhart/rpass'
arch=('x86_64' 'aarch64')
license=('GPL3')
depends=( python gnupg openssh rsync nano xclip wl-clipboard)

source_x86_64=('https://github.com/rwinkhart/rpass/releases/download/v2021.10.07.mr5/rpass-2021.10.07.mr5.tar.xz')
source_aarch64=('https://github.com/rwinkhart/rpass/releases/download/v2021.10.07.mr5/rpass-2021.10.07.mr5.tar.xz')
sha512sums_x86_64=('a1600816cd37fa7055f603dd9fa3f0a4d1f37505083ebb93d30270536f87666718c45bf995c89af6c425af5fcd93bba2ac3df12d83eea6dc3207c4030d55d46b')
sha512sums_aarch64=('a1600816cd37fa7055f603dd9fa3f0a4d1f37505083ebb93d30270536f87666718c45bf995c89af6c425af5fcd93bba2ac3df12d83eea6dc3207c4030d55d46b')

package() {

	tar xf rpass-"$pkgver".tar.xz -C "${pkgdir}"
	chown -R "$USER" ${pkgdir}/var/lib/rpass

}

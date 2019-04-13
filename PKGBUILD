# Maintainer: yurisuki
pkgname=osu-install
pkgver=1
pkgrel=0
pkgdesc="Auto-install osu! on Linux"
arch=('any')
url='https://github.com/yurisuki/osu-install'
depends=('winetricks' 'wine-mono' 'lib32-gnutls' 'lib32-alsa-plugins' 'lib32-libpulse' 'lib32-openal' 'p7zip' 'dialog' 'curl' 'bash')
source=('osu-install::https://raw.githubusercontent.com/yurisuki/osu-install/master/aur/osu-installonarch.sh')
sha512sums=('464ce05980203b4bdead16f9d6d0da5613b9b2c00208209a74828e3d30ce747800004d2c493c6dec0197d145264407508f8fa0f01983f54fef1f03bbbe1cb30b')

package() {
	echo ""
}

installosu() {
	bash osu-install
}

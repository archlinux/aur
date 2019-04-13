# Maintainer: yurisuki
pkgname=osu-install
pkgver=1
pkgrel=0
pkgdesc="Auto-install osu! on Linux"
arch=('any')
url='https://github.com/yurisuki/osu-install'
depends=('winetricks' 'wine-mono' 'lib32-gnutls' 'lib32-alsa-plugins' 'lib32-libpulse' 'lib32-openal' 'p7zip' 'dialog' 'curl')
source=('osu-install.sh')
sha512sums=('c0d1de26711de8abc5f3220e1e03f281f4663298ae4846fe8ef3534d7ec79ff93c46d306f70b0973e26df322d12bddb617c74c1b0b05728afcc402c5a8da9a04')

prepare() {
	chmod +x "$srcdir/osu-install"
	"$srcdir/osu-install.sh"
}

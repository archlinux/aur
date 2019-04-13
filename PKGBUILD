# Maintainer: yurisuki
pkgname=osu-install
pkgver=1
pkgrel=0
pkgdesc="Auto-install osu! on Linux"
arch=('any')
url='https://github.com/yurisuki/osu-install'
depends=('winetricks' 'wine-mono' 'lib32-gnutls' 'lib32-alsa-plugins' 'lib32-libpulse' 'lib32-openal' 'p7zip' 'dialog' 'curl' 'bash')

prepare() {
curl https://raw.githubusercontent.com/yurisuki/osu-install/master/aur/osu-installonarch.sh | bash
}

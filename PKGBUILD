# Maintainer: Mathias Bragagia <youremail@domain.com>
pkgname=kana-p
pkgver=0.2.3
pkgrel=1
pkgdesc="Lite desktop manager - use lightdm, awesome and compton"
arch=('any')
url="https://github.com/bragagia/kana-p"
license=('GPL')
groups=()
depends=(
	'xf86-input-synaptics'

	'networkmanager'
	'openssh'
	'alsa-firmware'
	'alsa-utils'
	'alsa-plugins'
	'pulseaudio'
	'pulseaudio-alsa'
	'pulseaudio-ctl'
	'bluez'
	'bluez-utils'
	'udevil'
	'ntp'
	'networkmanager-dispatcher-ntpd'

	'net-tools'
	'sudo'
	'adduser'
	'util-linux'

	'zsh'

	'xorg-server'
	'xorg-server-utils'
	'light'

	'lightdm'
	'lightdm-webkit-greeter'
	'lightdm-webkit-theme-bevel-git'
	'light-locker'

	'compton'
	'awesome'
	'lain-git'
	'eminent-git'
	'ohsnap'
	'otf-sauce-code-powerline-git'
	'rofi'
	'network-manager-applet'

	'xdg-utils'
	'xdg-user-dirs-gtk'
	'dex'
	'feh'
	'most'

	'rxvt-unicode'
	'git'
	'vim'
)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=.install
changelog=
source=(https://github.com/bragagia/kana-p/archive/$pkgver.tar.gz)
noextract=()
md5sums=('SKIP')

package() {
	mv -T $srcdir/$pkgname-$pkgver $pkgdir
	rm -f $pkgdir/.gitignore
	rm -f $pkgdir/LICENSE
	rm -f $pkgdir/README.md
}

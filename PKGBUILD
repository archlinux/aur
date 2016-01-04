# Maintainer: Mathias Bragagia <youremail@domain.com>
pkgname=kana-p
pkgver=0.3.1
pkgrel=1
pkgdesc="Lite desktop manager - use lightdm, awesome and compton - BETA"
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
	'ntfs-3g'
	'gptfdisk'
	'dosfstools'

	'ntp'
	'networkmanager-dispatcher-ntpd'

	'net-tools'
	'sudo'
	'adduser'
	'util-linux'
	'accountsservice'

	'ttf-dejavu'
	'ttf-bitstream-vera'
	'otf-sauce-code-powerline-git'
	'ohsnap'

	'xorg-server'
	'xorg-server-utils'
	'light'
	'srandrd'

	'lightdm'
	'lightdm-webkit-greeter'
	'lightdm-webkit-theme-bevel-git'
	'light-locker'

	'compton'
	'awesome'
	'lain-git'
	'eminent-git'
	'rofi'
	'network-manager-applet'
	'gnome-keyring'

	'xdg-utils'
	'xdg-user-dirs'
	'dex'
	'feh'
	'most'

	'gtk2'
	'gtk3'
	'qt4'
	'qt5-base'
	'gtk-theme-arc'

	'rxvt-unicode'
	'rxvt-unicode-terminfo'
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

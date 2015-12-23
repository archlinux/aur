# Maintainer: Mathias Bragagia <youremail@domain.com>
pkgname=kana-p
pkgver=0.2
pkgrel=1
pkgdesc="Middlewar meta-package"
arch=('any')
url=""
license=('GPL')
groups=()
depends=(
	'xf86-input-synaptics'

	'networkmanager'
	'openssh'
	'pulseaudio'
	'pulseaudio-alsa'
	'bluez'
	'bluez-utils'

	'net-tools'
	'sudo'
	'adduser'

	'zsh'

	'xorg-server'
	'xorg-server-utils'

	'lightdm'
	'lightdm-gtk-greeter'

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

	'rxvt-unicode'
	'git'
	'vim'
)
makedepends=()
optdepends=()
provides=()
conflicts=('kana-p-dev')
replaces=()
backup=()
options=()
install=INSTALL
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

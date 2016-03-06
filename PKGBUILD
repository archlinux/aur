# Maintainer: Austin Paxton <austin.is.paxton@gmail.com>
# keybase.io/poly
# This script is licensed under the MIT license.

pkgname=gpmdp
pkgver=3.0.0
pkgrel=1
pkgdesc="An electron wrapper for Google Play Music"
arch=('i686' 'x86_64')
url="http://www.googleplaymusicdesktopplayer.com"
source=("https://github.com/MarshallOfSound/Google-Play-Music-Desktop-Player-UNOFFICIAL-")
depends=('libgnome-keyring' 'lsb-release' 'alsa-lib' 'libnotify' 'nodejs' 'npm')
license=('MIT')

case $CARCH in
	'x86_64')
		_arch='amd64'
		md5sums=('f8f9e80f31ebdff6bc04f3413cb6f087')
		;;
	'i686')
		_arch='i386'
		md5sums=('70712ff5179454ac2d0576cef4d7655a')
		;;
esac

source=("https://github.com/MarshallOfSound/Google-Play-Music-Desktop-Player-UNOFFICIAL-/releases/download/${pkgver}/google-play-music-desktop-player_${pkgver}_linux_${_arch}.deb")

package() {
	tar -zxf data.tar.gz -C "${pkgdir}"
}

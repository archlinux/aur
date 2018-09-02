# Maintainer: t-onoz <t [dot] onozuka [dot] 1990 [at] (g-mail)>
pkgname=exmplayer-ubuntu
pkgver=5.0.1
pkgrel=1
pkgdesc="MPlayer GUI front-end with 3D/2D video playback support and with audio converter, media cutter and audio extractor tools (ubuntu binary version)"
arch=('x86_64')
url="http://exmplayer.sourceforge.net/"
license=('GPL')
depends=('ffmpeg' 'mplayer' 'qt4')
optdepends=('youtube-dl: download video/audio')
provides=('exmplayer')
conflicts=('exmplayer')
backup=()
install=
changelog=
source=("http://ppa.launchpad.net/exmplayer-dev/exmplayer/ubuntu/pool/main/e/exmplayer/exmplayer_${pkgver}_amd64.deb")
md5sums=('2c11849d4e92145d246b8665fb5f2b9c')


package() {
	cd "$pkgdir"
	tar xvf "${srcdir}/data.tar.gz"
	rm "${pkgdir}/usr/share/exmplayer/ffmpeg"
	rmdir "${pkgdir}/usr/share/exmplayer"
}

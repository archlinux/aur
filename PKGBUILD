# k311 <seamail311@yandex.ru>

pkgname='mplayer-gui'
pkgver='1.4'
_sver='1'
pkgrel='2'
pkgdesc='GUI for mplayer'
arch=('x86_64')
url='http://www.mplayerhq.hu/'
license=('GPL')
depends=('hicolor-icon-theme' 'sdl' 'libx11' 'libxxf86dga' 'libxxf86vm' 'libmad' 'libxinerama' 'lame' 'libtheora' 'xvidcore' 'libmng' 'libxss' 'libgl' 'aalib' 'jack' 'libcaca' 'faac' 'faad2' 'lirc'  'libxvmc' 'enca' 'libvdpau' 'opencore-amr' 'libdca' 'a52dec' 'schroedinger' 'libvpx' 'libpulse' 'fribidi' 'unzip' 'mesa' 'live-media' 'fontconfig' 'mpg123' 'ladspa' 'libass' 'libbluray' 'libcdio-paranoia' 'opus' 'x264' 'libx264' 'rtmpdump' 'gnutls' 'gsm' 'libdvdcss' 'libdvdread' 'libdvdnav' 'mencoder' 'libjpeg6-turbo')
install=${pkgname}.install
source=("http://download1.rpmfusion.org/free/fedora/updates/30/x86_64/m/mplayer-gui-1.4-1.fc30.x86_64.rpm")
md5sums=('a4c418e33c92593932bd8a939dd3032c')

build() {
  cd ${srcdir}
  bsdtar -xf "mplayer-gui-1.4-1.fc30.x86_64.rpm" -C .
}

package() {
  cd ${srcdir}
  mv usr ${pkgdir}
}
 

# k311 <seamail311@yandex.ru>

pkgname='mplayer-gui'
pkgver='1.3.0'
_sver='1'
pkgrel='26'
pkgdesc='GUI for mplayer'
arch=('x86_64')
url='http://www.mplayerhq.hu/'
license=('GPL')
depends=('hicolor-icon-theme' 'sdl' 'libx11' 'libxxf86dga' 'libxxf86vm' 'libmad' 'libxinerama' 'lame' 'libtheora' 'xvidcore' 'libmng' 'libxss' 'libgl' 'aalib' 'jack' 'libcaca' 'faac' 'faad2' 'lirc'  'libxvmc' 'enca' 'libvdpau' 'opencore-amr' 'libdca' 'a52dec' 'schroedinger' 'libvpx' 'libpulse' 'fribidi' 'unzip' 'mesa' 'live-media' 'fontconfig' 'mpg123' 'ladspa' 'libass' 'libbluray' 'libcdio-paranoia' 'opus' 'x264' 'libx264' 'rtmpdump' 'gnutls' 'gsm' 'libdvdcss' 'libdvdread' 'libdvdnav' 'mencoder' 'libjpeg6-turbo')
install=${pkgname}.install
source=("http://download1.rpmfusion.org/free/fedora/releases/29/Everything/source/SRPMS/mplayer-1.3.0-26.20180620svn.fc29.src.rpm")
md5sums=('3112e13347c857e60cc272fecda11536')

build() {
  cd ${srcdir}
  bsdtar -xf "mplayer-1.3.0-26.20180620svn.fc29.src.rpm" -C .
}

package() {
  cd ${srcdir}
  mv usr ${pkgdir}
}
 

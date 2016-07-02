# Maintainer: <aggraef at gmail.com>

# This is a binary package created directly from the latest upstream Debian
# package at http://l2ork.music.vt.edu/main/?page_id=56. If you want
# a package built specifically for Arch systems then use the pd-l2ork or
# pd-l2ork-git package instead, also available in the AUR.

pkgname=pd-l2ork-bin
pkgver=20160614
pkgrel=1
pkgdesc="L2Ork (Linux Laptop Orchestra) version of PureData (upstream Debian package)"
arch=('x86_64')
url="http://l2ork.music.vt.edu/main/?page_id=56"
license=('BSD')
depends=('bluez-libs' 'desktop-file-utils' 'dssi' 'fftw'
  'flite1' 'fluidsynth' 'freeglut' 'ftgl' 'glew' 'gmerlin'
  'gsl' 'gsm' 'hicolor-icon-theme' 'imagemagick' 'jack' 'ladspa' 'lame'
  'libdc1394' 'libdv' 'libgl' 'libiec61883' 'libjpeg' 'libquicktime'
  'libxxf86vm' 'libtiff' 'libiec61883' 'libunicap' 'libraw1394'
  'libsndobj-git' 'libv4l' 'libvorbis' 'lua51' 'portaudio'
  'smpeg' 'speex' 'stk' 'tk' 'tkpng' 'vlc' 'xapian-tcl-bindings' 'zlib')
provides=('pd-l2ork')
conflicts=('pd-l2ork')
source=(http://l2ork.music.vt.edu/data/pd/pd-l2ork-x86_64-$pkgver.deb)
md5sums=('99198f9857fb49963c43e20e738518b7')

prepare() {
    cd "$srcdir"
    tar -xf data.tar.xz
}

package() {
    cd "$srcdir"
    cp -a etc usr "$pkgdir"
}

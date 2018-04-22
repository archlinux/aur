# Maintainer: FFY00 <filipe.lains@gmail.com>
pkgname=pulseaudio-equalizer-ladspa-ffy00-git
pkgver=1.0
pkgrel=2
pkgdesc="A 15-band equalizer for PulseAudio (FFY00's fork)"
arch=(any)
url="https://github.com/FFY00/pulseaudio-equalizer-ladspa"
license=('GPL3')
groups=()
depends=('pygtk' 'swh-plugins' 'gnome-icon-theme' 'pulseaudio' 'bc' 'python2-gobject')
makedepends=('git')
provides=('pulseaudio-equalizer-ladspa')
conflicts=('pulseaudio-equalizer-ladspa')
replaces=('pulseaudio-equalizer-ladspa')
backup=()
options=()
install=
changelog=
source=('remote::git+https://github.com/FFY00/pulseaudio-equalizer-ladspa')
noextract=()
md5sums=('SKIP')

package() {
  cd "$srcdir/remote"
  mkdir "$pkgdir/usr"
  cp -rfp equalizerrc "$pkgdir/usr/"
  cp -rfp share "$pkgdir/usr/"
  cp -rfpp bin "$pkgdir/usr/"
}

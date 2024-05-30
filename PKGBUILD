# Maintainer: Vincent Jousse <vincent@jousse.org> - https://vincent.jousse.org
pkgname=pomodorolm-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Multi-platform pomodoro tracker with a nice looking UI, inspired by Pomotroid"
arch=('x86_64')
url="https://github.com/vjousse/pomodorolm"
license=('MIT')
depends=('alsa-lib' 'gtk3' 'hicolor-icon-theme' 'glibc' 'webkit2gtk' 'libsoup' 'cairo' 'glib2' 'pango' 'gcc-libs' 'gdk-pixbuf2')
provides=('pomodorolm')
source=("https://github.com/vjousse/pomodorolm/releases/download/app-v$pkgver/pomodorolm_${pkgver}_amd64.deb")
sha256sums=('1fa8315a3040acf2270e5b0ab33e35c0cd8225bcbe8225b8f672e6d77f1ea824')

package() {
  bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}

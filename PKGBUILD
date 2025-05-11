# Maintainer: Vincent Jousse <vincent@jousse.org> - https://vincent.jousse.org
pkgname=pomodorolm-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Multi-platform pomodoro tracker with a nice looking UI, inspired by Pomotroid"
arch=('x86_64')
url="https://github.com/vjousse/pomodorolm"
license=('MIT')
depends=('alsa-lib' 'gtk3' 'hicolor-icon-theme' 'glibc' 'webkit2gtk-4.1' 'libsoup' 'cairo' 'glib2' 'pango' 'gcc-libs' 'gdk-pixbuf2' 'libayatana-appindicator')
provides=('pomodorolm')
source=("https://github.com/vjousse/pomodorolm/releases/download/app-v$pkgver/pomodorolm_${pkgver}_amd64.deb")
sha256sums=('a305656175c425a1ec1dbef37c45fe951eb04442a2eeca1456a563880b36270f')

package() {
  bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}

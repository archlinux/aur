# Maintainer: Vincent Jousse <vincent@jousse.org> - https://vincent.jousse.org
pkgname=pomodorolm-bin
pkgver=0.1.11
pkgrel=2
pkgdesc="Multi-platform pomodoro tracker with a nice looking UI, inspired by Pomotroid"
arch=('x86_64')
url="https://github.com/vjousse/pomodorolm"
license=('MIT')
depends=('alsa-lib' 'gtk3' 'hicolor-icon-theme' 'glibc' 'webkit2gtk-4.1' 'libsoup' 'cairo' 'glib2' 'pango' 'gcc-libs' 'gdk-pixbuf2')
provides=('pomodorolm')
source=("https://github.com/vjousse/pomodorolm/releases/download/app-v$pkgver/pomodorolm_${pkgver}_amd64.deb")
sha256sums=('4aed027759bdc58cebdc372afc16635882bb0d11045d92f352ec942aba2de7a9')
package() {
  bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}

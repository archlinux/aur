# Maintainer: Vincent Jousse <vincent@jousse.org> - https://vincent.jousse.org
pkgname=pomodorolm-bin
pkgver=0.9.3
pkgrel=1
pkgdesc="Multi-platform pomodoro tracker with a nice looking UI, inspired by Pomotroid"
arch=('x86_64')
url="https://github.com/vjousse/pomodorolm"
license=('MIT')
depends=('alsa-lib' 'gtk3' 'hicolor-icon-theme' 'glibc' 'webkit2gtk-4.1' 'libsoup' 'cairo' 'glib2' 'pango' 'gcc-libs' 'gdk-pixbuf2' 'libayatana-appindicator')
provides=('pomodorolm')
source=("https://github.com/vjousse/pomodorolm/releases/download/app-v$pkgver/pomodorolm_${pkgver}_amd64.deb")
sha256sums=('f0868ad5c0612d74c2e2b9e433ee30ca11e10d6c4a9123c6947896edd006c076')

package() {
  bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}

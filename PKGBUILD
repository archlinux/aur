# Maintainer: Vincent Jousse <vincent@jousse.org> - https://vincent.jousse.org
pkgname=pomodorolm-bin
pkgver=0.3.3
pkgrel=1
pkgdesc="Multi-platform pomodoro tracker with a nice looking UI, inspired by Pomotroid"
arch=('x86_64')
url="https://github.com/vjousse/pomodorolm"
license=('MIT')
depends=('alsa-lib' 'gtk3' 'hicolor-icon-theme' 'glibc' 'webkit2gtk-4.1' 'libsoup' 'cairo' 'glib2' 'pango' 'gcc-libs' 'gdk-pixbuf2' 'libayatana-appindicator')
provides=('pomodorolm')
source=("https://github.com/vjousse/pomodorolm/releases/download/app-v$pkgver/pomodorolm_${pkgver}_amd64.deb")
sha256sums=('ee74a068f4baee71c41f03a376af0d7795551f55f806cdd52a7550d24ac11b6c')

package() {
  bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}

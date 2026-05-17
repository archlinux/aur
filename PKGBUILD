pkgname=faden
_pkgname=faden
pkgver=0.2.1
pkgrel=1
pkgdesc="Faden - desktop app for qualitative interview research"
arch=('x86_64')
url="https://github.com/ReadyPlayerNaN/faden"
license=('MIT')
options=(!lto)
depends=('ffmpeg' 'sqlite' 'webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'libsoup3' 'hicolor-icon-theme')
conflicts=('faden-git')
source=("faden-0.2.1-linux-x86_64.tar.gz::https://github.com/ReadyPlayerNaN/faden/releases/download/v0.2.1/faden-0.2.1-linux-x86_64.tar.gz")
sha256sums=('1269f8ebbbea085f25ebee26e2859115278331ca919e72911937caa35085ab9c')

package() {
  cp -a "$srcdir/faden-0.2.1-linux-x86_64/usr/." "$pkgdir/usr/"
}

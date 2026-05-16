pkgname=faden
_pkgname=faden
pkgver=0.1.2
pkgrel=1
pkgdesc="Faden - desktop app for qualitative interview research"
arch=('x86_64')
url="https://github.com/ReadyPlayerNaN/faden"
license=('MIT')
options=(!lto)
depends=('ffmpeg' 'sqlite' 'webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'libsoup3' 'hicolor-icon-theme')
conflicts=('faden-git')
source=("faden-0.1.2-linux-x86_64.tar.gz::https://github.com/ReadyPlayerNaN/faden/releases/download/v0.1.2/faden-0.1.2-linux-x86_64.tar.gz")
sha256sums=('0308a9416c61a94123e6830dbdfa607e3348ac8179de0f9fdac45ed4966cad60')

package() {
  cp -a "$srcdir/usr/." "$pkgdir/usr/"
}

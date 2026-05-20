pkgname=faden
_pkgname=faden
pkgver=0.2.4
pkgrel=1
pkgdesc="Faden - desktop app for qualitative interview research"
arch=('x86_64')
url="https://github.com/ReadyPlayerNaN/faden"
license=('MIT')
options=(!lto)
depends=('ffmpeg' 'sqlite' 'webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'libsoup3' 'hicolor-icon-theme')
conflicts=('faden-git')
source=("faden-0.2.4-linux-x86_64.tar.gz::https://github.com/ReadyPlayerNaN/faden/releases/download/v0.2.4/faden-0.2.4-linux-x86_64.tar.gz")
sha256sums=('626ae1bd47fcf77058eb99170cb8b1252079019891c6297843d883f3f35e8245')

package() {
  cp -a "$srcdir/faden-0.2.4-linux-x86_64/usr/." "$pkgdir/usr/"
}

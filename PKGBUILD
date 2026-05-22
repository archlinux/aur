pkgname=faden
_pkgname=faden
pkgver=0.2.5
pkgrel=1
pkgdesc="Faden - desktop app for qualitative interview research"
arch=('x86_64')
url="https://github.com/ReadyPlayerNaN/faden"
license=('MIT')
options=(!lto)
depends=('ffmpeg' 'sqlite' 'webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'libsoup3' 'hicolor-icon-theme')
conflicts=('faden-git')
source=("faden-0.2.5-linux-x86_64.tar.gz::https://github.com/ReadyPlayerNaN/faden/releases/download/v0.2.5/faden-0.2.5-linux-x86_64.tar.gz")
sha256sums=('817e1ecd1b728306a561dac67924927c9d9ac4cb9d838b52cd45a773f6273879')

package() {
  cp -a "$srcdir/faden-0.2.5-linux-x86_64/usr/." "$pkgdir/usr/"
}

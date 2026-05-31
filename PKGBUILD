pkgname=faden
_pkgname=faden
pkgver=0.2.6
pkgrel=1
pkgdesc="Faden - desktop app for qualitative interview research"
arch=('x86_64')
url="https://github.com/ReadyPlayerNaN/faden"
license=('MIT')
options=(!lto)
depends=('ffmpeg' 'sqlite' 'webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'libsoup3' 'hicolor-icon-theme')
conflicts=('faden-git')
source=("faden-0.2.6-linux-x86_64.tar.gz::https://github.com/ReadyPlayerNaN/faden/releases/download/v0.2.6/faden-0.2.6-linux-x86_64.tar.gz")
sha256sums=('8d5026067f615718dd75d2b4deb0216d1f743ac067ee862ba038060a3c046a0e')

package() {
  cp -a "$srcdir/faden-0.2.6-linux-x86_64/usr/." "$pkgdir/usr/"
}

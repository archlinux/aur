pkgname=faden
_pkgname=faden
pkgver=0.2.2
pkgrel=1
pkgdesc="Faden - desktop app for qualitative interview research"
arch=('x86_64')
url="https://github.com/ReadyPlayerNaN/faden"
license=('MIT')
options=(!lto)
depends=('ffmpeg' 'sqlite' 'webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'libsoup3' 'hicolor-icon-theme')
conflicts=('faden-git')
source=("faden-0.2.2-linux-x86_64.tar.gz::https://github.com/ReadyPlayerNaN/faden/releases/download/v0.2.2/faden-0.2.2-linux-x86_64.tar.gz")
sha256sums=('e882322320a53910c352f9be87ec3bb48774bff1742232808f600c58f9baf6a8')

package() {
  cp -a "$srcdir/faden-0.2.2-linux-x86_64/usr/." "$pkgdir/usr/"
}

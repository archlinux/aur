pkgname=faden
_pkgname=faden
pkgver=0.2.3
pkgrel=1
pkgdesc="Faden - desktop app for qualitative interview research"
arch=('x86_64')
url="https://github.com/ReadyPlayerNaN/faden"
license=('MIT')
options=(!lto)
depends=('ffmpeg' 'sqlite' 'webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'libsoup3' 'hicolor-icon-theme')
conflicts=('faden-git')
source=("faden-0.2.3-linux-x86_64.tar.gz::https://github.com/ReadyPlayerNaN/faden/releases/download/v0.2.3/faden-0.2.3-linux-x86_64.tar.gz")
sha256sums=('648ab1fdb8b0da8513bd42904f92140aab914bee992e405f39a608403b0cda58')

package() {
  cp -a "$srcdir/faden-0.2.3-linux-x86_64/usr/." "$pkgdir/usr/"
}

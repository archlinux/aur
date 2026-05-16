pkgname=faden
_pkgname=faden
pkgver=0.1.4
pkgrel=1
pkgdesc="Faden - desktop app for qualitative interview research"
arch=('x86_64')
url="https://github.com/ReadyPlayerNaN/faden"
license=('MIT')
options=(!lto)
depends=('ffmpeg' 'sqlite' 'webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'libsoup3' 'hicolor-icon-theme')
conflicts=('faden-git')
source=("faden-0.1.4-linux-x86_64.tar.gz::https://github.com/ReadyPlayerNaN/faden/releases/download/v0.1.4/faden-0.1.4-linux-x86_64.tar.gz")
sha256sums=('38cc782aae05e82d53d00f473c72e180ba660a4eef6984510d38d3441ac81f4e')

package() {
  cp -a "$srcdir/faden-0.1.4-linux-x86_64/usr/." "$pkgdir/usr/"
}

# Maintainer: Sushant Mishra <sushantsgml@gmail.com>

pkgname="locus"
pkgver=0.1.0
pkgrel=1
pkgdesc="An intelligent activity tracker that helps you understand and improve your focus habits."
arch=('x86_64')
url="https://github.com/Sushants-Git/locus"
license=('custom')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/Sushants-Git/locus/releases/download/v$pkgver/locus_"$pkgver"_amd64.deb")
sha256sums_x86_64=('5840e481b870524f9d4e2eaa0d2e7b749d8dc67e36a541250332432d09724d00')

package() {
  install -Dm644 "$srcdir/../LICENSE.md" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.md"
}

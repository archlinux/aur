# Maintainer: Sushant Mishra <sushantsgml@gmail.com>

pkgname="locus"
pkgver=0.2.2
pkgrel=1
pkgdesc="An intelligent activity tracker that helps you understand and improve your focus habits."
arch=('x86_64')
url="https://github.com/Sushants-Git/locus"
license=('custom')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/Sushants-Git/locus/releases/download/v$pkgver/locus_"$pkgver"_amd64.deb")
sha256sums_x86_64=('8c8f85c23fc4f1bc542343ff124aa13ca1d4111547d63c8ce4fd0b4eeebf762c')

package() {
  tar -xz -f data.tar.gz -C "${pkgdir}"
}

pkgname=mpass
pkgver=0.0.16
pkgrel=1
pkgdesc="Self-hosted password manager"
arch=('x86_64')
url="https://github.com/mPassw/desktop"
license=('mit')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/mPassw/desktop/releases/download/v$pkgver/mPass_"$pkgver"_amd64.deb")
sha256sums_x86_64=('8f2635d0d2a1116da8fcc27f78107b9e48ac8c6dbfe27d40ecb5687c5af69057')

package() {
    tar -xz -f data.tar.gz -C "${pkgdir}"
}

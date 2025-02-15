pkgname=mpass
pkgver=0.0.3
pkgrel=1
pkgdesc="Self-hosted password manager"
arch=('x86_64')
url="https://github.com/mPassw/desktop"
license=('mit')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/mPassw/desktop/releases/download/v$pkgver/mPass_"$pkgver"_amd64.deb")
sha256sums_x86_64=('8a5d541bc49b4bfd7bac29761d11b52bb6a24eddc4aceadac04ffa4a511dcacf')

package() {
    tar -xz -f data.tar.gz -C "${pkgdir}"
}

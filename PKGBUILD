pkgname=mpass
pkgver=0.0.1
pkgrel=1
pkgdesc="Self-hosted password manager"
arch=('x86_64')
url="https://github.com/mPassw/desktop"
license=('mit')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/mPassw/desktop/releases/download/v$pkgver/mpass-desktop_"$pkgver"_amd64.deb")
sha256sums_x86_64=('440863d514229c7ec2e15a05ea1aea2f6273fe42faa891473b3def06ff14130d')

package() {
    tar -xz -f data.tar.gz -C "${pkgdir}"
}
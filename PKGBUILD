pkgname=prev
pkgver=0.1.5
pkgrel=1
pkgdesc="Local-first preview social link cards instantly before deployment"
arch=('x86_64' 'aarch64')
url="https://github.com/dhanushk-offl/prev"
license=('MIT')

depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup')

options=('!strip' '!emptydirs')

source_x86_64=("${url}/releases/download/v${pkgver}/prev_${pkgver}_amd64.deb")
source_aarch64=("${url}/releases/download/v${pkgver}/prev_${pkgver}_arm64.deb")

sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
  bsdtar -xf "${srcdir}/prev_${pkgver}_${CARCH}.deb" -C "${pkgdir}"
}


# Maintainer: Alois <alois@tensamin.net>

pkgname=tensamin-bin
_pkgname=tensamin
pkgver=0.1.3
pkgrel=3
pkgdesc="True E2EE, decentralized messages. Open source and privacy first."
arch=('x86_64' 'aarch64')
url="https://github.com/Tensamin/Frontend"
license=('Custom')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!debug')
conflicts=('tensamin-git')
install=${_pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/tensamin_${pkgver}_amd64.deb")
source_aarch64=("${url}/releases/download/v${pkgver}/tensamin_${pkgver}_arm64.deb")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
  tar -xvf data.tar.gz -C "${pkgdir}"
}
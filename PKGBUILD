# Maintainer: UPdullah895 <your-email@example.com>
pkgname=opengg-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Open-source Linux gaming hub — OpenGG"
arch=('x86_64')
url="https://github.com/UPdullah895/opengg"
license=('MIT')
depends=('pipewire' 'wireplumber' 'ffmpeg' 'gstreamer' 'webkit2gtk-4.1')
optdepends=('polkit: for privileged device setup')
provides=('opengg')
conflicts=('opengg')
install=opengg.install
source=("${url}/releases/download/v${pkgver}/opengg-v${pkgver}-linux-x86_64.tar.gz")
sha256sums=('SKIP')

package() {
  tar -xzf "${srcdir}/opengg-v${pkgver}-linux-x86_64.tar.gz" -C "${pkgdir}" --strip-components=1
}

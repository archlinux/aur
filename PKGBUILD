pkgname=immich-cli
pkgrel=0
pkgver=0.41.0
pkgdesc='CLI utilities to help with some operations with the Immich app'
url='https://github.com/immich-app/cli'
license=('MIT')
arch=(x86_64)
makedepends=('npm')
depends=(
    # 'redis' 'postgresql' 'nodejs-lts-hydrogen'
    # 'typesense'
    # 'zlib'
    # 'glib2'
    # 'expat'
    # 'libjpeg-turbo'
    # 'libpng'
    # 'libjxl'
    # 'libheif'
    # 'mimalloc'
    # 'openjpeg2'
    # 'ffmpeg'
    # 'libvips'
    # 'imagemagick'
    # 'libraw'
)
optdepends=(
    # 'libva-mesa-driver: GPU acceleration'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/immich-app/cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('60484beb4581095cca4fb91b1984d766aaabb5c797247a69f96708d67b6eac82')
noextract=("${pkgname}-${pkgver}.tar.gz")
backup=()
# only for testing
options=("!strip")

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tar.gz"
}

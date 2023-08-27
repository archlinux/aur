pkgname=immich-cli
pkgrel=0
pkgver=0.41.0
pkgdesc='CLI utilities to help with some operations with the Immich app'
url='https://github.com/immich-app/cli'
license=('MIT')
arch=(x86_64)
makedepends=()
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
source=("https://github.com/immich-app/cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('eb84a463f45770e6a141c5f99e16780d8dd9ed9166720c3b1690f90ccca8d8f6'
            'da15a00fa9ff25e2235acc8df2009d12dcdca35e6bd2e73be2e8f82f1a479097'
            '5706dfa9fcdddc4da4cdd3dd6dfdd0300b4838a818e072fda75441468dd271d8'
            'db02514f523d0b166fc72c466ddab4685b50f4addad6522f664e4155e2c124be'
            'bc939e1883b8f9b91acd45f7f417b93b5f0c3310210827d8c70df1aa2e0afd6c'
            'c7db0e5e2eb50bd48892a7e669a2ced65988af43fb82ad67d8e2cc607a6aeb47'
            '23894fe92e02f8d69d045ece73d68ba5122549a39c60475780a5b03bebcab3aa'
            'd80109cdbbb15ee91299675512e9089ee9c547f9ef18eb750f31794723331045'
            '1d7cbc81c523ba4ccf5d67a8811ac95f10dfb184003f2f94bf1ac3c9addca45e')
noextract=("${pkgname}-${pkgver}.tgz")
backup=()
# only for testing
options=("!strip")

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"
}

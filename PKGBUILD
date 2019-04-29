# Maintainer: Michael Migliore <mcmigliore+aur@gmail.com>

pkgname=fbx2gltf-bin
pkgver=0.9.5
pkgrel=2
pkgdesc='A command-line tool for the conversion of the FBX file format to the glTF file format'
arch=('x86_64')
url="https://github.com/facebookincubator/${pkgname}/tree/v${pkgver}"
license=('BSD')
depends=('libc++' 'libc++abi' 'mesa' 'libxi')
makedepends=('cmake' 'clang')
conflicts=('mono') # because of /usr/bin/cmgen
source=("https://github.com/facebookincubator/FBX2glTF/releases/download/v${pkgver}/FBX2glTF-linux-x64")
sha256sums=('9399b1e3ecf51c86fafc02c444f85e576318354747e9231173e88d8b5e912c43')

package() {
    install -d ${pkgdir}/usr/bin
    install -m755 FBX2glTF-linux-x64 ${pkgdir}/usr/bin/fbx2gltf
}

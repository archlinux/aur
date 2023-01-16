# Maintainer: Christoph Brill <opensource@christophbrill.de>
# Contributor: Michael Migliore <mcmigliore+aur@gmail.com>

pkgname=godot-fbx2gltf-bin
pkgver=0.13.0
pkgrel=1
pkgdesc='A command-line tool for the conversion of the FBX file format to the glTF file format'
arch=('x86_64')
url="https://github.com/godotengine/FBX2glTF/"
license=('BSD')
source=("https://github.com/godotengine/FBX2glTF/releases/download/v${pkgver}-p1/FBX2glTF-linux-x86_64.zip")
sha256sums=('68f7f609125e60197faf2edfdeee7bb0f0087f01e2b260e9b6f942377a6c8931')
provides=('fbx2gltf-bin')
conflicts=('fbx2gltf-bin')

package() {
    install -d ${pkgdir}/usr/bin
    install -m755 FBX2glTF-linux-x86_64/FBX2glTF-linux-x86_64 ${pkgdir}/usr/bin/fbx2gltf
}

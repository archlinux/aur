# Maintainer: Christoph Brill <opensource@christophbrill.de>
# Contributor: Michael Migliore <mcmigliore+aur@gmail.com>

pkgname=godot-fbx2gltf-bin
pkgver=0.13.1
pkgrel=1
pkgdesc='A command-line tool for the conversion of the FBX file format to the glTF file format'
arch=('x86_64')
url="https://github.com/godotengine/FBX2glTF/"
license=('BSD')
source=("FBX2glTF-linux-x86_64-${pkgver}.zip::https://github.com/godotengine/FBX2glTF/releases/download/v${pkgver}/FBX2glTF-linux-x86_64.zip")
sha256sums=('52243ec1bf25c4501bdd4977057b6782702fe3ae1b79e2ac13039d2207870bec')
provides=('fbx2gltf-bin')
conflicts=('fbx2gltf-bin')

package() {
    install -d ${pkgdir}/usr/bin
    install -m755 FBX2glTF-linux-x86_64/FBX2glTF-linux-x86_64 ${pkgdir}/usr/bin/fbx2gltf
}

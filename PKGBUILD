# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: makidoll <maki at hotmilk dot space>

pkgname="collada2gltf-bin"
pkgver=2.1.5
pkgrel=2
pkgdesc="A command-line tool to convert COLLADA (.dae) files to glTF"
url="https://github.com/KhronosGroup/COLLADA2GLTF"
license=("custom")
arch=("x86_64")
provides=("collada2gltf")
conflicts=("collada2gltf")
depends=("draco")
source=("https://github.com/KhronosGroup/COLLADA2GLTF/releases/download/v$pkgver/COLLADA2GLTF-v$pkgver-linux.zip")
b2sums=('dacabce6213841b310771ed30a1b4a28200f406ae31c3a5a2c2147007ae5884d9cc8e5cad2cd2c8c4f74b2d3d41ca63f5b17b7796a009d2654c4b4b671b86def')
options=(!strip)

package(){
 install -D -m 755 "COLLADA2GLTF-bin"  "$pkgdir/usr/bin/collada2gltf"
 install -D -m 755 "COLLADA2GLTF-test" "$pkgdir/usr/bin/collada2gltf-test"
 install -D -m 755 "GLTF-test"         "$pkgdir/usr/bin/gltf-test"
}

pkgname=ryusak-bin
pkgver=1.6.2
pkgrel=2
pkgdesc="Allows you to download saves and shaders for Switch emulators."
arch=(x86_64)
url="https://github.com/Ecks1337/RyuSAK"
license=('GPL3')
conflicts=(emusak-bin)
depends=(expat glib2 nss gtk3)
source=("https://github.com/Ecks1337/RyuSAK/releases/download/v$pkgver/ryusak_${pkgver}_amd64.deb")
sha256sums=('4ea3f32576e50829daa9abac13cf0ee94f8716743928d745539f4bb2151114ed')

build(){
	tar -xvf data.tar.zst
}

package() {
	cp -r usr "$pkgdir"
}

pkgname=ryusak-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="Allows you to download saves and shaders for Switch emulators."
arch=(x86_64)
url="https://github.com/Ecks1337/RyuSAK"
license=('GPL3')
conflicts=(emusak-bin)
depends=(expat glib2 nss gtk3)
source=("https://github.com/Ecks1337/RyuSAK/releases/download/v$pkgver/ryusak_${pkgver}_amd64.deb")
sha256sums=('3222968c1c4978c51b75f3a8671221904c33c1379dbcb5e3961d52a9e5cef53c')

build(){
	tar -xvf data.tar.xz
}

package() {
	cp -r usr "$pkgdir"
}

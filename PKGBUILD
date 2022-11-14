pkgname=ryusak-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="Allows you to download saves and shaders for Switch emulators."
arch=(x86_64)
url="https://github.com/Ecks1337/RyuSAK"
license=('GPL3')
conflicts=(emusak-bin)
depends=(expat glib2 nss gtk3)
source=("https://github.com/Ecks1337/RyuSAK/releases/download/v$pkgver/ryusak_${pkgver}_amd64.deb")
sha256sums=('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')

build(){
	tar -xvf data.tar.xz
}

package() {
	cp -r usr "$pkgdir"
}

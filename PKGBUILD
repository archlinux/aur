pkgname=ryusak-bin
pkgver=1.4.3
pkgrel=1
pkgdesc="Allows you to download saves and shaders for Switch emulators."
arch=(x86_64)
url="https://github.com/Ecks1337/RyuSAK"
license=('GPL3')
conflicts=(emusak-bin)
depends=(expat glib2 nss gtk3)
source=("https://github.com/Ecks1337/RyuSAK/releases/download/v$pkgver/ryusak_${pkgver}_amd64.deb")
sha256sums=('7c1fa250bbe63fac10c3375a2c04606884f389b7195da037ed6b10b2a2e10b83')

build(){
	tar -xvf data.tar.xz
}

package() {
	cp -r usr "$pkgdir"
}

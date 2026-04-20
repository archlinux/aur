pkgname=neocat-bin
pkgver=1.0
pkgrel=1
pkgdesc="A simple and fast CLI text viewer"
arch=('x86_64')
url="https://github.com/Enderman1951/neocat"
license=('MIT')
depends=()
provides=('neocat')
conflicts=('neocat')

source=("https://github.com/Enderman1951/neocat/releases/download/v$pkgver/neocat.tar.gz")
sha256sums=('70e97262a20eeec63af5084a19954438df4178b25a32f4218a3b46154ed9814d')

package() {
    install -Dm755 neocat "$pkgdir/usr/bin/neocat"
}

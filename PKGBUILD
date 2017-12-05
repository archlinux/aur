# Maintainer: Ziul <ziuloliveira@gmail.com>

pkgname=plis
pkgver=v0.0.0.build10
pkgrel=0
pkgdesc="Helps your development process with Docker Compose by asking nicely :)"
arch=('x86_64')
url="https://github.com/IcaliaLabs/plis"
license=('MIT')
depends=('docker-compose')
optdepends=('go')
conflicts=('plis-git')
source=("https://github.com/IcaliaLabs/plis/releases/download/$pkgver/plis-linux_x86_64")
sha256sums=('884a18c48b0b37bdf94fc3af74234f45b982ad9da4853585cb09425b1101c84a')

package() {
    mkdir -p "$pkgdir/usr/bin/"
    install -Dm755 "$srcdir/plis-linux_x86_64" "$pkgdir/usr/bin/$pkgname"
}


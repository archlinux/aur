pkgname=upcloud-cli
pkgver=0.6.4
pkgrel=1
pkgdesc="upctl - a CLI tool for managing UpCloud services."
arch=('x86_64')
url="https://upcloud.com"
license=('Apache')
source=("https://github.com/kaminek/${pkgname}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_x86_64.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$pkgname_$pkgver_linux_x86_64"
    install -Dm755 upctl "$pkgdir/usr/local/bin/upctl"
}

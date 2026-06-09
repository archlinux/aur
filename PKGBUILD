pkgname=sysinfo
pkgver=1.1
pkgrel=1
pkgdesc="Simple neofetch-based system info wrapper"
arch=('any')
depends=('neofetch')
license=('MIT')

source=('sysinfo')
sha256sums=('SKIP')

package() {
    install -Dm755 sysinfo "$pkgdir/usr/bin/sysinfo"
}

# Maintainer: atha mdhyaulatha@gmail.com

pkgname=netinfo
pkgver=2.1.0
pkgrel=1
pkgdesc="Professional CLI tool to display user network and system information (IP, ASN, ISP, etc)"
arch=('any')
url="https://github.com/Bangkah/netinfo"
license=('MIT')
depends=('python' 'python-requests')
source=("netinfo.py")
sha256sums=('SKIP')

package() {
    install -Dm755 netinfo.py "$pkgdir/usr/bin/netinfo"
}

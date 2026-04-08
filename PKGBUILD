# Maintainer: Raphael Bitton <raphael@skylantix.com>
pkgname=zftop
pkgver=0.0.0
pkgrel=1
pkgdesc="A terminal dashboard for ZFS, in the spirit of htop"
arch=('x86_64')
url="https://git.skylantix.com/rbitton/zftop"
license=('MIT')
depends=()
keywords=('zfs' 'zftop')
source=("zftop-${pkgver}-linux-amd64::https://git.skylantix.com/api/v4/projects/rbitton%2Fzftop/packages/generic/zftop/${pkgver}/zftop-linux-amd64"
        "LICENCE-${pkgver}::https://git.skylantix.com/rbitton/zftop/-/raw/v${pkgver}/LICENCE")
sha256sums=('SKIP' 'SKIP')

package() {
    install -Dm755 "zftop-${pkgver}-linux-amd64" "$pkgdir/usr/bin/zftop"
    install -Dm644 "LICENCE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
}

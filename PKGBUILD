# Maintainer: Raphael Bitton <raphael@rbitton.com>
pkgname=zftop
pkgver=0.3.1
pkgrel=1
pkgdesc="A terminal dashboard for ZFS, in the spirit of htop"
arch=('x86_64')
url="https://git.skylantix.com/rbitton/zftop"
license=('GPL-3.0-or-later')
depends=('glibc' 'zfs-utils')
keywords=('zfs' 'zftop')
source=("zftop-${pkgver}-linux-amd64::https://git.skylantix.com/api/v4/projects/rbitton%2Fzftop/packages/generic/zftop/${pkgver}/zftop-linux-amd64"
        "LICENSE-${pkgver}::https://git.skylantix.com/rbitton/zftop/-/raw/v${pkgver}/LICENSE")
sha256sums=('c9e38460cf2d6bbff7aa6b09d600f0ee9ddee1e1341d66c297e3a5dd0a9bac72' '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
    install -Dm755 "zftop-${pkgver}-linux-amd64" "$pkgdir/usr/bin/zftop"
    install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

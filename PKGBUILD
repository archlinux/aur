# Maintainer: yuna0x0 <yuna@yuna0x0.com>
pkgname=obsidian2web-bin
pkgver=1.4.0
pkgrel=4
pkgdesc="lun-4's obsidian publish knockoff that generates (largely static) websites"
arch=('x86_64')
url="https://github.com/lun-4/obsidian2web"
license=('MIT')
provides=("obsidian2web=$pkgver-$pkgrel")
conflicts=('obsidian2web')
source=("$pkgname-$pkgver::https://github.com/lun-4/obsidian2web/releases/download/$pkgver/obsidian2web-x86_64-linux"
        "$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/lun-4/obsidian2web/$pkgver/LICENSE")
sha256sums=('9f7d13fc491b86afe75c2709d2ba2a1f64c063a007ba230d8e01318d43f7fe85'
            'eb27a3e9519121cc70191aba44ee73c1c01c3454f88df59d1cd698b2e8617f1b')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/obsidian2web"
    install -Dm644 "$srcdir/$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

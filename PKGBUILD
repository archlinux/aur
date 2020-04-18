# Maintainer: yaa110 <yaa110@gmail.com>

pkgname=nomino-bin
_pkgname=nomino
pkgver=0.1.4
pkgrel=2
arch=('x86_64')
url="https://github.com/yaa110/nomino"
license=("MIT")

pkgdesc='Batch rename utility for developers'

source=("LICENSE::https://raw.githubusercontent.com/yaa110/$_pkgname/master/LICENSE-MIT")
source_x86_64=("https://github.com/yaa110/$_pkgname/releases/download/$pkgver/$_pkgname-linux-64bit")
sha512sums=("169b314c09dffe76c8bf31929a61e58358c66516c17629cb257e0d44101b78d3949ee6d9951bb813cd6348d8626a0c8f638f6f874db446dce87cfa1de24d39ba")
sha512sums_x86_64=("f787a969fc8a60fdb28b9ce18095d5431f6eda7be47fd25eb9364e10e406dfcf55d8271ed8428311c409a042cd4de9563e905f79765176f789909d2f8691836a")
depends=('gcc-libs')
conflicts=('nomino-git' 'nomino')
provides=('nomino')

package() {
    install -Dm755 "$srcdir/$_pkgname-linux-64bit" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


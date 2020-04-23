# Maintainer: yaa110 <yaa110@gmail.com>

pkgname=nomino-bin
_pkgname=nomino
pkgver=0.4.2
pkgrel=1
arch=('x86_64')
url="https://github.com/yaa110/nomino"
license=("MIT")

pkgdesc='Batch rename utility for developers'

source=("LICENSE::https://raw.githubusercontent.com/yaa110/$_pkgname/master/LICENSE-MIT")
source_x86_64=("https://github.com/yaa110/$_pkgname/releases/download/$pkgver/$_pkgname-linux-64bit")
sha512sums=("169b314c09dffe76c8bf31929a61e58358c66516c17629cb257e0d44101b78d3949ee6d9951bb813cd6348d8626a0c8f638f6f874db446dce87cfa1de24d39ba")
sha512sums_x86_64=("0cd43401476060dca6d462fc5028f61f4ac062cc3aac828e30da895b9ebfafbe5acb3d04184271cb66941ee58a6d10339bdb7f2ae8f087cff062938fa08c6222")
depends=('gcc-libs')
conflicts=('nomino')
provides=('nomino')

package() {
    install -Dm755 "$srcdir/$_pkgname-linux-64bit" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


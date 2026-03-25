# Contributor: Jan Was <janek.jan at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=usql-bin
pkgver=0.21.2
pkgrel=1
pkgdesc='A universal command-line interface for SQL databases'
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/xo/usql"
license=(MIT)
provides=(usql)
conflicts=(usql)

source=("https://raw.githubusercontent.com/xo/usql/refs/tags/v$pkgver/README.md")
source_x86_64=("$url/releases/download/v$pkgver/usql-$pkgver-linux-amd64.tar.bz2")
source_armv6h=("$url/releases/download/v$pkgver/usql-$pkgver-linux-arm.tar.bz2")
source_armv7h=("$url/releases/download/v$pkgver/usql-$pkgver-linux-arm.tar.bz2")
source_aarch64=("$url/releases/download/v$pkgver/usql-$pkgver-linux-arm64.tar.bz2")

sha256sums=('aa6b75df1c4acc895646dfba859d93df9d5dbfec94eccbeae513ef93665d5780')
sha256sums_x86_64=('f76af72b73b29cd98e34f39eafc99f239a66a07608db6daf01305d24947a0ba6')
sha256sums_armv6h=('2306d34c8f154e115a283a35b9ef6ff1c3ee38cb5ef4b88ad1337400ae553243')
sha256sums_armv7h=('2306d34c8f154e115a283a35b9ef6ff1c3ee38cb5ef4b88ad1337400ae553243')
sha256sums_aarch64=('248093af9581991851977ad4a8cb661d2e98de14ef40d5db4e7e0f799026cf59')

package() {
    install -Dm755 usql -t "$pkgdir/usr/bin"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

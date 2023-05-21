# Maintainer: Daniele Basso <d dot bass05 at proton dot me>

pkgname='corepacker'
pkgver=0.0.0
pkgrel=1
pkgdesc='Remove npm, yarn and pnpm using corepack'
arch=('any')
url='https://github.com/nodejs/corepack/'
license=('')
source=("corepacker-enable.hook" "corepacker-disable.hook")
sha512sums=('183242451c81fec324afcab2d2d0ad2cbaa93e987c899a0a8cc3846cc2d38a85ec544d2560e252bccf7dfc3cfb94a93dfe279bf2b59d3c20d6d0efa6bdedcbda'
            '963becf46acf06e7560e02f96dbca9ca095629394317cc4c1cf1f80397aa564ad4807352ba32a28f891c6520535e1f7b71556571d44d0f22aef55c992a0e0136')
provides=("corepacker" "npm" "yarn" "pnpm")
conflicts=("corepacker" "npm" "yarn" "pnpm")
depends=("nodejs")

package() {
  install -D -m0644 -t "$pkgdir"/usr/share/libalpm/hooks *.hook
}

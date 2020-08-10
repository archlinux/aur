# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=chisel-tunnel
pkgver=1.6.0
pkgrel=1
pkgdesc="A fast TCP tunnel over HTTP"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/jpillora/chisel"
license=('MIT')
source=("README_${pkgver}.md::https://raw.githubusercontent.com/jpillora/chisel/v$pkgver/README.md"
        "users_${pkgver}.json::https://raw.githubusercontent.com/jpillora/chisel/v$pkgver/example/users.json"
	"LICENSE_${pkgver}::https://raw.githubusercontent.com/jpillora/chisel/v$pkgver/LICENSE")
source_i686=("chisel_${pkgver}_i686.gz::https://github.com/jpillora/chisel/releases/download/v$pkgver/chisel_${pkgver}_linux_386.gz")
source_x86_64=("chisel_${pkgver}_x86_64.gz::https://github.com/jpillora/chisel/releases/download/v$pkgver/chisel_${pkgver}_linux_amd64.gz")
source_armv6h=("chisel_${pkgver}_armv6h.gz::https://github.com/jpillora/chisel/releases/download/v$pkgver/chisel_${pkgver}_linux_armv6.gz")
source_armv7h=("chisel_${pkgver}_armv7h.gz::https://github.com/jpillora/chisel/releases/download/v$pkgver/chisel_${pkgver}_linux_armv7.gz")
source_aarch64=("chisel_${pkgver}_aarch64.gz::https://github.com/jpillora/chisel/releases/download/v$pkgver/chisel_${pkgver}_linux_arm64.gz")
sha256sums=('d64dfc4c11a81fe2de4368f8f308ce876f88e4e9ff890dd0f31a8f69b4ba64ef'
            'b3cb23ef88fcf4f39ee057289e7d2a92a03b2f33ec05caa4d70cd15a2ca60acd'
            '1edfe3540212ff667e460e212b31178e405139fdff18d643bdd49b05623ac3ac')
sha256sums_i686=('49cf02eb8f76329b62378b8e9b0ae5abbe0312b9f2c3e068dbdf57f9474dfd8c')
sha256sums_x86_64=('4a4dbfa07c6f4a72b6727c4a2ed8ef2899f61f724a9b5d142ab30b1c283a6db8')
sha256sums_armv6h=('389081eec49334d1d6ef3ba46e2167f6f3010443cf39a4f2e431b274fb58c369')
sha256sums_armv7h=('030d5d76052e0da4488b216db816fd13bdaf25e047f0b34820a2b55305f9fd8c')
sha256sums_aarch64=('a63a403167d39341c7a116a1f8d599d19859743cbb254ba6203733213081913f')

package() {
  install -D -m755 "chisel_${pkgver}_$CARCH" "$pkgdir/usr/bin/chisel"
  install -D -m644 "README_${pkgver}.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -D -m644 "users_${pkgver}.json" "$pkgdir/usr/share/doc/$pkgname/users.json"
  install -D -m644 "LICENSE_${pkgver}" "$pkgdir/usr/share/doc/$pkgname/LICENSE"
}

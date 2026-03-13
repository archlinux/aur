# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: George Rawlinson <george@rawlinson.net.nz>
# Contributor: mock

pkgname=ttf-nishiki-teki
pkgver=3.99zhz
pkgrel=1
pkgdesc='Unicode-based font inspired by a free shell of Ukagaka called “Nishiki”'
arch=('any')
url='https://umihotaru.work'
license=('custom')
source=("$pkgname-$pkgver.zip::http://umihotaru.fool.jp/nishiki-teki.zip"
        'LICENSE')
sha256sums=('cfb00983508ed13545b353c65d34d7a1ef8143f2712bb28740950635358b1cd2'
            'a60b2362ac0885bc4d7b013ccbbe38e2aeded839b3d88993add246d9076f72ad')

package() {
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" nishiki-teki.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "LICENSE"
}

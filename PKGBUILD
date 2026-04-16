# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: George Rawlinson <george@rawlinson.net.nz>
# Contributor: mock

pkgname=ttf-nishiki-teki
pkgver=3.99zir
pkgrel=1
pkgdesc='Unicode-based font inspired by a free shell of Ukagaka called “Nishiki”'
arch=('any')
url='https://umihotaru.work'
license=('custom')
source=("$pkgname-$pkgver.zip::http://umihotaru.fool.jp/nishiki-teki.zip"
        'LICENSE')
sha256sums=('2c4a7420f9679de377250cc329eebd728bfedf5daa4277feeca60dddd77e836b'
            'a60b2362ac0885bc4d7b013ccbbe38e2aeded839b3d88993add246d9076f72ad')

package() {
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" nishiki-teki.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "LICENSE"
}

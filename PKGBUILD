# Maintainer: Akatsuki Rui <akiirui@outlook.com>

pkgname=v2ray-domain-list-china
pkgver=20211206180335
pkgrel=1
pkgdesc="A list of domains to be used as geosites for routing purpose in Project V"
arch=('any')
url="https://github.com/akiirui/domain-list-china"
license=('MIT')
source=("dlc.dat-$pkgver::https://github.com/akiirui/domain-list-china/releases/download/$pkgver/dlc.dat"
        "https://raw.githubusercontent.com/akiirui/domain-list-china/main/LICENSE")
b2sums=('5bc84172fdf6981c9817128970ebc98d0ab8dd28d1f37141da7eed87a322e3f7abea673631acbd50341f80d20b220c28681087eeda3ae5032ff143a98e5f8741'
        '53fcf5b8a104ecd10a6719ef025de0d4779d1b24ea33a9b9dab78ae9f2579dc063c099e698745c6ac7b7e00bd5cbe5d849211f06281da9291fed86e193ae3628')

package() {
  install -Dm644 "$srcdir/dlc.dat-$pkgver" "$pkgdir/usr/share/v2ray/dlc.dat"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

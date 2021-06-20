# Maintainer: Akatsuki Rui <akiirui@outlook.com>

pkgname=v2ray-domain-list-china
pkgver=20210620121800
pkgrel=1
pkgdesc="A list of domains to be used as geosites for routing purpose in Project V"
arch=('any')
url="https://github.com/akiirui/domain-list-china"
license=('MIT')
source=("https://github.com/akiirui/domain-list-china/releases/download/$pkgver/dlc.dat"
        "https://raw.githubusercontent.com/akiirui/domain-list-china/main/LICENSE")
b2sums=('75f372e7b6e1b83f450d47820b656823202311477affaefd3c19db77a399b3bfcc261b076a94dac14e1330d4fe9bbc3ec9e122191a66053bd3eaad929d15c3d8'
        '53fcf5b8a104ecd10a6719ef025de0d4779d1b24ea33a9b9dab78ae9f2579dc063c099e698745c6ac7b7e00bd5cbe5d849211f06281da9291fed86e193ae3628')

package() {
  install -Dm644 "$srcdir/dlc.dat" "$pkgdir/usr/share/v2ray/dlc.dat"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

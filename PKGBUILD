# Maintainer: Akatsuki Rui <akiirui@outlook.com>

pkgname=v2ray-domain-list-china
pkgver=20220828122554
pkgrel=1
pkgdesc="A list of domains to be used as geosites for routing purpose in Project V"
arch=('any')
url="https://github.com/akiirui/domain-list-china"
license=('MIT')
source=("dlc.dat-$pkgver::https://github.com/akiirui/domain-list-china/releases/download/$pkgver/dlc.dat"
        "https://raw.githubusercontent.com/akiirui/domain-list-china/main/LICENSE")
b2sums=('e4b54746c31e2a5b3406ffcc88bb1f1b4d37645436d9d70ad20194123f7b735e31533be16886d4570a562894da63a5c62b599479da31bae06a20ecb38fa90fd2'
        '53fcf5b8a104ecd10a6719ef025de0d4779d1b24ea33a9b9dab78ae9f2579dc063c099e698745c6ac7b7e00bd5cbe5d849211f06281da9291fed86e193ae3628')

package() {
  install -Dm644 "$srcdir/dlc.dat-$pkgver" "$pkgdir/usr/share/v2ray/dlc.dat"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

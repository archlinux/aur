# Maintainer: Akatsuki Rui <akiirui@outlook.com>

pkgname=v2ray-domain-list-china
pkgver=20210614161217
pkgrel=1
pkgdesc="A list of domains to be used as geosites for routing purpose in Project V"
arch=('any')
url="https://github.com/akiirui/domain-list-china"
license=('MIT')
source=("https://github.com/akiirui/domain-list-china/releases/download/$pkgver/dlc.dat"
        "https://raw.githubusercontent.com/akiirui/domain-list-china/main/LICENSE")
b2sums=('fdc6764363f2f229274d54f3d6e612573c808639a82a29f0df0f014403abb089bde8cf6ca9c52b4263fe53596e2b974fb1589035d87341ed8ed4890083e2b4b5'
        '53fcf5b8a104ecd10a6719ef025de0d4779d1b24ea33a9b9dab78ae9f2579dc063c099e698745c6ac7b7e00bd5cbe5d849211f06281da9291fed86e193ae3628')

package() {
  install -Dm644 "$srcdir/dlc.dat" "$pkgdir/usr/share/v2ray/dlc.dat"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Akatsuki Rui <akiirui@outlook.com>

pkgname=v2ray-domain-list-china
pkgver=20230115122138
pkgrel=1
pkgdesc="A list of domains to be used as geosites for routing purpose in Project V"
arch=('any')
url="https://github.com/akiirui/domain-list-china"
license=('MIT')
source=("dlc.dat-$pkgver::https://github.com/akiirui/domain-list-china/releases/download/$pkgver/dlc.dat"
        "https://raw.githubusercontent.com/akiirui/domain-list-china/main/LICENSE")
b2sums=('9afeee8e9ef2ec0e0021d755f43a96e6abb84f5f2e8b77a0fdb260341e3800c287bd9a3dbef210dd6372c9bd4720e60c04689415cdc6796e3a8353a7421d7b4d'
        '53fcf5b8a104ecd10a6719ef025de0d4779d1b24ea33a9b9dab78ae9f2579dc063c099e698745c6ac7b7e00bd5cbe5d849211f06281da9291fed86e193ae3628')

package() {
  install -Dm644 "$srcdir/dlc.dat-$pkgver" "$pkgdir/usr/share/v2ray/dlc.dat"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

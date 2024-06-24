# Maintainer: Kevin MacMartin <prurigro@gmail.com>

pkgname=cryptobox
pkgver=1.0
pkgrel=2
epoch=1
pkgdesc='A script that makes it easy to create, mount and unmount encrypted images in Linux using LUKS'
url='https://github.com/prurigro/cryptobox'
license=('MIT')
depends=('coreutils' 'cryptsetup' 'util-linux')
arch=('any')
source=("https://github.com/prurigro/cryptobox/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('3e7b3c11fbc07027797c7e8d28f27a5d52ea13c4f677973778e2559b192ac405f8af22b9de3c2b5dfb9c2bfbfb9b01a17cc2b8c25936474be9421b1978a44aa3')

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

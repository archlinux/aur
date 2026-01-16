pkgname=kns
pkgver=1
pkgrel=3
pkgdesc="Quick Kubernetes Namespace Switcher."
arch=('any')
license=('MIT')
depends=('fzf' 'which')
url="https://github.com/blendle/kns.git"
source=("git+https://github.com/blendle/kns.git#commit=4fb3e0cd12295bd6380b3e5d34598f96156dd56d")
sha512sums=('e213bc34d97f0db46e7383bb4061be01c4524f73b0680467942bcb3701ccff8c5d016413d6f96941cc23835a63eb5d6f330b38e4079f30e5fcde53f3838df816')

package() {

    cd $srcdir/kns/bin
    install -dm 755 "$pkgdir/usr/bin"

    install -Dm755 ktx "$pkgdir/usr/bin/ktx"
    install -Dm755 kns "$pkgdir/usr/bin/kns"

}

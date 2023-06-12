# Maintainer: Andrew Ryan <dnrops@outlook.com>
#

pkgname=aur_cli
pkgver=0.1.0
pkgrel=1
pkgdesc="Prepare Rust projects to be released on the Arch Linux User Repository."
url="https://dnrops.gitee.io"
license=("MIT")
arch=("x86_64")
provides=("aur_cli")
conflicts=("aur_cli")
source=("https://gitlab.com/andrew_ryan/aur_cli/-/raw/master/aur_cli-$pkgver-x86_64.tar.gz")
sha256sums=("c241c6b315729a14ab0204fce90e731f1c5fc773e0d2a02dfd0147a1d1f7a273")

package() {
    install -Dm755 aur_cli -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

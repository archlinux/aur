# Maintainer: Andrew Ryan <dnrops@outlook.com>
#

pkgname=aur-cli-git
pkgver=0.1.3
pkgrel=1
pkgdesc="Prepare Rust projects to be released on the Arch Linux User Repository."
url="https://dnrops.gitee.io"
license=("MIT")
arch=("x86_64")
provides=("aur_cli")
conflicts=("aur_cli")
source=("https://gitlab.com/andrew_ryan/aur_cli/-/raw/main/aur_cli-$pkgver-x86_64.tar.gz")
sha256sums=('7ad29bc9c1f50124168ee231a7fd2c2bca23b833f570e3a7255777f9e082c154')

package() {
    install -Dm755 aur_cli -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

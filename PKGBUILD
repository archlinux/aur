pkgname=clever-reposync-bin
pkgver=0.7.0
pkgrel=0
pkgdesc="Sync repos for a GitHub user or organization into a folder on your computer"
arch=("x86_64")
url="https://github.com/Clever/reposync"
#license=("Not sure")
provides=("clever-reposync")
conflicts=("clever-reposync")
depends=(
    "git"
    "openssh"
)
source=("$pkgname-$pkgver::https://github.com/Clever/reposync/releases/download/v$pkgver/reposync-$pkgver-linux-amd64")
sha256sums=("f09f91a1de6c779f1519fa4474fa45b95f144866dc6892ead48a864e2e8b7ee8")

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/clever-reposync"
}

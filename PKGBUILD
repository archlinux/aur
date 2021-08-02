pkgname=clever-reposync-bin
pkgver=0.6.5
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
source=("$pkgname-$pkgver::https://github.com/Clever/reposync/releases/download/$pkgver/reposync-$pkgver-linux-amd64")
sha256sums=("87249672fb12c0b728c421c9d05511aff323f51cb906aba2695b801e00e059dc")

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/clever-reposync"
}

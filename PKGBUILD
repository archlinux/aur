pkgname=clever-reposync-bin
pkgver=0.8.0
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
sha256sums=("8e5af308105eb626ec8767dfbfa834a2b04453586cd451b2a80832622c080ec1")

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/clever-reposync"
}

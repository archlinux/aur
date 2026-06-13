# Maintainer: nicknb <nicknb at posteo dot com>
_name=exdupe
pkgname=$_name-bin
pkgver=4.0.0
pkgrel=1
arch=("x86_64")
pkgdesc="Fast file archiver that supports data deduplication and differential backups"
url="https://github.com/rrrlasse/$_name"
license=("GPL-2.0-or-later")
source=("$_name::$url/releases/download/v${pkgver}/${_name}_${pkgver}_linux_amd64")
noextract=("$_name")
sha256sums=("54fe20712daaed7047d2a84b03ec1308d70da78c2dafe24a8e1e4a1846b6d2d4")
options=("!strip")

package() {
    install -Dm 0755 $_name "$pkgdir/usr/bin/$_name"
}

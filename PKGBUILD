# Maintainer: codeberge <codeberge at mailbox dot org>
pkgname=dl-distro
pkgver=1.0.1
pkgrel=1
pkgdesc="Download and verify ISOs with GnuPG and shasums"
arch=('any')
url="https://codeberg.org/codeberge/$pkgname"
source=("$url/archive/v$pkgver.tar.gz")
license=('GPL3')
depends=('bash' 'gnupg' 'wget')
sha256sums=('295f987aefaf108eaa981e49991ae1bbc5bb1211e6c1b55e5a49aa4c58f2dda3')

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

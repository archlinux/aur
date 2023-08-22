# Maintainer: codeberge <codeberge at mailbox dot org>
pkgname=dl-distro
pkgver=1.0.0
pkgrel=1
pkgdesc="Download and verify ISOs with GnuPG and shasums"
arch=('any')
url="https://codeberg.org/codeberge/$pkgname"
source=("$url/archive/v$pkgver.tar.gz")
license=('GPL3')
depends=('bash' 'gnupg' 'wget')
sha256sums=('d5c110a52946825d351bb7abe995fa6ebb7edd7572d25c4c57ed75065affe6b1')

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# Maintainer: bashuser30 <bashuser30 at mailbox dot org>
pkgname=dl-distro
pkgver=1.1.1
pkgrel=2
pkgdesc="Download and verify ISOs with GnuPG and shasums"
arch=('any')
url="https://codeberg.org/bashuser30/$pkgname"
source=("$url/archive/v$pkgver.tar.gz")
license=('GPL3')
depends=('bash' 'gnupg' 'jq' 'wget')
sha256sums=('c1b4c6cb9d2b8c0f952dd6e7208922a1b86439a61e8d1654cb5525d371793a0e')

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 distro_data.json "$pkgdir/usr/share/$pkgname/distro_data.json"
}

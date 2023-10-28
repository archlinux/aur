# Maintainer: bashuser30 <bashuser30 at mailbox dot org>
pkgname=dl-distro
pkgver=1.11.0
pkgrel=1
pkgdesc="Download and verify Linux ISOs with GnuPG and shasums"
arch=('any')
url="https://codeberg.org/bashuser30/$pkgname"
source=("$url/archive/v$pkgver.tar.gz")
license=('GPL3')
depends=('bash' 'coreutils' 'jq' 'wget')
optdepends=('gnupg'
            'minisign: Void Linux verification'
            'signify: OpenBSD verification')
sha256sums=('690a07013548d047b449939b1c9b3cd986dda59227a27e97e3a2385882a6b292')

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
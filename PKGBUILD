# Maintainer: bashuser30 <bashuser30 at mailbox dot org>
pkgname=dl-distro
pkgver=1.12.0
pkgrel=1
pkgdesc="Bash script for downloading and verifying OS images."
arch=('any')
url="https://codeberg.org/bashuser30/$pkgname"
source=("$url/archive/v$pkgver.tar.gz")
license=('GPL3')
depends=('bash' 'coreutils' 'jq' 'wget')
optdepends=('gnupg'
            'minisign: Void Linux verification'
            'signify: OpenBSD verification')
sha256sums=('fb633ed4a7bd9645c07a501b40cf803ab0de2a025478c580df7cf00dfacd8de6')

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

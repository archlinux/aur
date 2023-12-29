# Maintainer: bashuser30 <bashuser30 at mailbox dot org>
pkgname=dl-distro
pkgver=1.18.0
pkgrel=2
pkgdesc="Bash script for downloading and verifying OS images."
arch=('any')
url="https://codeberg.org/bashuser30/$pkgname"
source=("$url/archive/v$pkgver.tar.gz")
license=('GPL3')
depends=('bash' 'coreutils' 'jq' 'wget')
optdepends=('gnupg'
            'minisign: Void Linux verification'
            'signify: OpenBSD verification')
sha256sums=('dc040a37d75675604c39317a3cbdd6650a7c723083172e7c8bcdf57ee4428a09')

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

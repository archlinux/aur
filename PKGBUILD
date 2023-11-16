# Maintainer: bashuser30 <bashuser30 at mailbox dot org>
pkgname=dl-distro
pkgver=1.16.0
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
sha256sums=('768c32f68d0be43ba07b2e732cc6dcc457f7cdbf9e863c049b563c3855da9bd1')

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

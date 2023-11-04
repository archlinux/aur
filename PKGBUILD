# Maintainer: bashuser30 <bashuser30 at mailbox dot org>
pkgname=dl-distro
pkgver=1.15.0
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
sha256sums=('842617b771b09aab4bebd6b2a1017172a6ab36b40736e6325ee2bdd9ad519300')

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

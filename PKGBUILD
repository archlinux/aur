# Maintainer: Wellinton Vieira <wellintonvieira.office@gmail.com>

pkgname="aurup"
pkgver="1.79"
pkgrel=2
pkgdesc="The simplify finding and installing packages AUR helper"
arch=("any")
url="https://github.com/nellowint/$pkgname"
license=("GPL-3.0-or-later")
depends=("bash-completion" "curl" "diffutils" "jq" "tar")
makedepends=("git")
source=("git+https://github.com/nellowint/$pkgname.git#tag=v$pkgver")
sha256sums=('5eb3985221f4f292d3964d3a59939be5fa03e60ad461652b5002bf8c5921f404')

package() {
	cd "$pkgname"
	install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$pkgname-complete.sh" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Wellinton Vieira <wellintonvieira.office@gmail.com>

pkgname="aurup"
pkgver="1.81"
pkgrel=1
pkgdesc="The simplify finding and installing packages AUR helper"
arch=("any")
url="https://github.com/nellowint/$pkgname"
license=("GPL-3.0-or-later")
depends=("bash-completion" "curl" "diffutils" "jq" "tar")
makedepends=("git")
source=("git+https://github.com/nellowint/$pkgname.git#tag=v$pkgver")
sha256sums=('0d105aa8d006588bcb693205e49805f4b026396eacdf9f50a4736dcfa2276237')

package() {
	cd "$pkgname"
	install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$pkgname-complete.sh" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

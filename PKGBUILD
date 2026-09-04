# Maintainer: Wellinton Vieira <wellintonvieira.office@gmail.com>

pkgname="update-mirrors"
pkgver="1.26"
pkgrel=1
pkgdesc="CLI to update the Arch Linux mirrorlist"
arch=("any")
url="https://github.com/nellowint/update-mirrors"
license=("GPL-3.0-or-later")
depends=("bash-completion" "curl")
makedepends=("git")
source=("git+https://github.com/nellowint/update-mirrors.git#tag=v$pkgver")
sha256sums=('a39a2a59f8a916f1c29917bc5f54bde64caf7fd70ec7b4c7222a27f1b27c7c31')

package() {
	cd "$pkgname"
	install -Dm755 update-mirrors.sh "$pkgdir/usr/bin/update-mirrors"
	install -Dm644 update-mirrors-complete.sh "$pkgdir/usr/share/bash-completion/completions/update-mirrors"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

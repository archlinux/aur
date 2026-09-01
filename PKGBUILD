# Maintainer: Wellinton Vieira <wellintonvieira.office@gmail.com>

pkgname="update-mirrors"
pkgver="1.24"
pkgrel=1
pkgdesc="CLI to update the Arch Linux mirrorlist"
arch=("any")
url="https://github.com/nellowint/update-mirrors"
license=("GPL-3.0-or-later")
depends=("bash-completion" "curl")
makedepends=("git")
source=("git+https://github.com/nellowint/update-mirrors.git#tag=v$pkgver")
sha256sums=('6b17634f2854c9a15b660a31bd86330ba46c87a78acfaad8b385490ccc169034')

package() {
	cd "$pkgname"
	install -Dm755 update-mirrors.sh "$pkgdir/usr/bin/update-mirrors"
	install -Dm644 update-mirrors-complete.sh "$pkgdir/usr/share/bash-completion/completions/update-mirrors"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

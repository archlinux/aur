# Maintainer: nezu <nezu@nezu.cc>
pkgname=givemebadge-bin
_pkgname=givemebadge
pkgver=1.0.5
pkgrel=2
pkgdesc="Pretty simple Discord bot to get the active developer badge"
arch=('any')
url="https://github.com/AlexFlipnote/GiveMeBadge"
license=('MIT')
depends=('python')
provides=('givemebadge')
conflicts=('givemebadge')
source=("$_pkgname::$url/releases/download/$pkgver/GiveMeBadge_$pkgver-linux"
				"https://raw.githubusercontent.com/AlexFlipnote/GiveMeBadge/$pkgver/LICENSE")
sha256sums=('46a245cec9b3ecff03c6a4ebcef893f4073b4967ad1d82a949424da19289a8b4'
            '56dce1ff375ccdebd3a0904e46eef6f2f377e8f9216b73b552270c13fa3e7449')

package() {
	install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

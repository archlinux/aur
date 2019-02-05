# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=git-commands
pkgver=1.0.0
pkgrel=1
pkgdesc="Fuzzy search git commands with fzf"
arch=('any')
url="https://github.com/hankchanocd/git-commands"
license=('MIT')
depends=('fzf')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/hankchanocd/git-commands/archive/v$pkgver.tar.gz")
md5sums=('be06d8734fd3ec158b015766c69f5ecf')

package() {
	install -Dm755 "$pkgname-$pkgver/git-commands" "$pkgdir/usr/bin/git-commands"
}

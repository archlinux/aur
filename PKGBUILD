# Maintainer: Eric Nielsen <ericbn at proton dot me>

pkgname=zimfw
pkgver=1.20.0
pkgrel=1
pkgdesc='Zsh plugin manager'
arch=('any')
url='https://zimfw.sh'
license=('MIT')
depends=('zsh>=5.2')
source=("$pkgname-$pkgver.zsh.gz::https://github.com/zimfw/zimfw/releases/download/v$pkgver/zimfw.zsh.gz")
sha256sums=('b948ef89a2f6fe565197e0fa898046337168c78bfcbae43601baeb9cd51f7038')
install=zimfw.install

package() {
	cd "$srcdir"
	install -Dm0644 -T "$pkgname-$pkgver.zsh" "$pkgdir/usr/share/zimfw/zimfw.zsh"
}

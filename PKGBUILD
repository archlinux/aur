# Maintainer: Eric Nielsen <ericbn at proton dot me>

pkgname=zimfw
pkgver=1.20.1
pkgrel=1
pkgdesc='Zsh plugin manager'
arch=('any')
url='https://zimfw.sh'
license=('MIT')
depends=('zsh>=5.2')
source=("$pkgname-$pkgver.zsh.gz::https://github.com/zimfw/zimfw/releases/download/v$pkgver/zimfw.zsh.gz")
sha256sums=('f8398d723475ae408221d9f04854c5153710d3f29f8fe30edeed733a5f4ca703')
install=zimfw.install

package() {
	cd "$srcdir"
	install -Dm0644 -T "$pkgname-$pkgver.zsh" "$pkgdir/usr/share/zimfw/zimfw.zsh"
}

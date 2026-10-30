# Maintainer: Eric Nielsen <ericbn at proton dot me>

pkgname=zimfw
pkgver=1.20.2
pkgrel=1
pkgdesc='Zsh plugin manager'
arch=('any')
url='https://zimfw.sh'
license=('MIT')
depends=('zsh>=5.2')
source=("$pkgname-$pkgver.zsh.gz::https://github.com/zimfw/zimfw/releases/download/v$pkgver/zimfw.zsh.gz")
sha256sums=('61f65ca3d69f5ba6a1349be161e8e18be61366e869056352f8ba0d7065c263ff')
install=zimfw.install

package() {
	cd "$srcdir"
	install -Dm0644 -T "$pkgname-$pkgver.zsh" "$pkgdir/usr/share/zimfw/zimfw.zsh"
}

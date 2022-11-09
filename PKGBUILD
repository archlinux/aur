# Maintainer: Gustavo Parreira <gustavotcparreira at gmail dot com>
pkgname=hyprshot
pkgver=1.0.0
pkgrel=1
url="https://github.com/Gustash/hyprshot"
pkgdesc="A utility to easily take screenshots in Hyprland using your mouse"
arch=('any')
license=('GPL')
depends=('jq' 'grim' 'slurp' 'wl-clipboard')
optdepends=()
source=("hyprshot-1.0.0.tar.gz::https://github.com/Gustash/hyprshot/archive/$pkgver.tar.gz")
sha512sums=('be719c84c7b3d72331fb7422e3d211c9260e56c56a05a9d5c184d6e3c8de042c75657343f08b81a1b73b1a0e9aff2824b2e2cb8b8eac7c0e117137c0acb9386d')

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	cp hyprshot "$pkgdir/usr/bin/"
}

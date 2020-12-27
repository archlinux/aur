# Maintainer: Alif Uzair bin Abd Rahman <riazufila at gmail dot com>
# Contributor: Cole Thompson <cole dot thompson at gmail dot com>
pkgname=ufw-icon-bar
pkgver=1
pkgrel=6
pkgdesc="System tray icon for ufw"
arch=('any')
url="https://github.com/juanmafont/ufwIconbar"
license=('unknown')
depends=('yad' 'ufw')
optdepends=('gufw')
source=("$pkgname-$pkgver::git+https://github.com/juanmafont/ufwIconbar.git")
md5sums=("SKIP")

package() {
    install -Dm 755 "$srcdir/$pkgname-$pkgver/gufw_icon.sh" "$pkgdir/usr/bin/gufw_icon.sh"
}

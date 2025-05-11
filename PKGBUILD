# Maintainer: Hnashiko hlichisper@gmail.com
pkgname=i3map
pkgver=1.0.0
pkgrel=1
pkgdesc="Generate a table of i3wm keybindings from your config file"
arch=('any')
url="https://github.com/Hanashiko/i3map"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
install="$pkgname.install"
source=("i3map.py" "LICENSE" "README.md")
sha256sums=('02784807434bb2e9028a41039eec3588764fe6615d6eecdfb900773dee31271e' '26e23658285bac48a2c3a11902d8fd28b84dc48cfeae2eee06ff5e6f5bddd0e0' '6ad1c2fc0fb140d4cccacce2b98719b714294bdbc246f0bac6476409e868cae6')

package() {
    cd "$srcdir"

    install -Dm755 i3map.py "$pkgdir/usr/bin/i3map"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

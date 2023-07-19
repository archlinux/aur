# Maintainer: channel-42 <info@devls.de>
pkgname=huetui
_gitname=hue-tui
pkgver=2.0
pkgrel=1
pkgdesc="A TUI for Phillips Hue"
arch=('any')
url="https://github.com/channel-42/hue-tui"
license=('MIT')
groups=('misc')
depends=('python' 'python-colorthief' 'python-py_cui' 'python-click' 'python-urllib3')
makedepends=('python-setuptools')
source=("https://github.com/channel-42/$_gitname/archive/v$pkgver.tar.gz")
md5sums=('03d1ec432371fcc6f4d988a5cc5685d9')

package() {
    cd "$srcdir/$_gitname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
    
    
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
# vim: ts=2 sw=2 et ft=PKGBUILD:

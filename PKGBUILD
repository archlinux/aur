# Maintainer: Payson Wallach <payson@paysonwallach.com>

pkgname=aw-watcher-afk
pkgver=0.8.3
pkgrel=1
pkgdesc="Log what you do on your computer. Simple, extensible, no third parties."
arch=('i686' 'x86_64')
url="https://github.com/ActivityWatch/activitywatch"
license=('MPL2')
depends=('python>=3.5.1')
makedepends=('python>=3.5.1' 'python-setuptools')
source=("git+https://github.com/ActivityWatch/aw-watcher-afk.git#commit=55528c3")
md5sums=('SKIP')

build() {
    cd $pkgname
    python setup.py build
}

package() {
    cd $pkgname
    python setup.py install --skip-build --root="$pkgdir/" --optimize=1
}

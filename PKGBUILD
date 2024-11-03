# Maintainer: Zinar <zinar@domain.com>

pkgname='zinar'
pkgver=1.0
pkgrel=1

pkgdesc="A modern Python GUI application."
url="https://github.com/Zinaro/zinar"

arch=('any')
license=(GPL-3.0-or-later)
provides=('zinar')
conflicts=('zinar-bin' 'zinar-git')
depends=('python' 'python-kivy')
source=("zinar.py")
sha256sums=('2bb642fd1790dfdf8726d48a3ddf807f9885ceb13d9834f5b818a3869b28f301')

build() {
    cd "${srcdir}" || exit
}

package() {
    install -Dm755 "${srcdir}/zinar.py" "$pkgdir/usr/local/bin/zinar"
}


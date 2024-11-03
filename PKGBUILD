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
sha256sums=('c498244711343582e646cc85eb31cf18b1fc784c54f370d4c256597d4aaa899a')

build() {
    cd "${srcdir}" || exit
}

package() {
    install -Dm755 "${srcdir}/zinar.py" "$pkgdir/usr/local/bin/zinar"
}


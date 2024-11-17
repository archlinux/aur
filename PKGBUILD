# Maintainer: halsschmerzen <bastiansteampl@gmail.com>

pkgname=quickrice
pkgver=1.0.3
pkgrel=1
pkgdesc="A simple CLI Tool to change GTK Based desktops"
arch=('any')
url="https://pypi.org/project/quickrice/"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'git')
source=("git+https://github.com/halsschmerzen/quickrice.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
    cd "$srcdir/quickrice-$pkgver"
    python -m pip install --root="$pkgdir" --prefix=/usr --ignore-installed --no-cache-dir .
    install -Dm755 "$pkgdir/usr/bin/quickrice" "$pkgdir/usr/bin/quickrice"

}
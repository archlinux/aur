# Maintainer: Dringsim <dringsim@qq.com>

pkgname=binfmt-python
pkgver=1
pkgrel=1
pkgdesc="Register python interpreter"
arch=('any')
url="http://www.freedesktop.org/software/systemd/man/binfmt.d.html"
license=('Unlicense')
depends=('python')
source=('python.conf')
md5sums=('9137ba72f8f1b71d379615beff940ab6')

package() {
    install -Dm644 'python.conf' "$pkgdir/usr/lib/binfmt.d/python.conf"
}
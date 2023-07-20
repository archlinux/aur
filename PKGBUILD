# Maintainer: Dringsim <dringsim@qq.com>

pkgname=binfmt-python
pkgver=1
pkgrel=2
pkgdesc="Register Python interpreter"
arch=('any')
url="http://www.freedesktop.org/software/systemd/man/binfmt.d.html"
license=('Unlicense')
depends=('python')
source=('python.conf')
md5sums=('52d4af1a8c3830e86a10a9624add7f83')

package() {
    install -Dm644 'python.conf' "$pkgdir/usr/lib/binfmt.d/python.conf"
}
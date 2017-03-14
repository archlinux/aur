# Maintainer: Bláithín Nic Aoidh <blawheen@gmail.com>

_pkgname=ranwhen
pkgname=${_pkgname}-git
pkgver=20170314
pkgrel=1
pkgdesc="Visualize when your system was running"
url="https://github.com/p-e-w/ranwhen"
arch=('any')
license=('GPL3')
provides=('ranwhen')
depends=('python' 'util-linux')
makedepends=('git')
source=(git+https://github.com/p-e-w/${_pkgname}.git)
md5sums=('SKIP')


package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 "$_pkgname.py" "$pkgdir/usr/bin/$_pkgname"
}

# vim:set ts=4 sw=4 et:

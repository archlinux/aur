# Maintainer: Aleksey Kurnosov <akkurnosov@gmail.com>

pkgname=pyapplier
pkgver=0.0.2
pkgrel=1
arch=('x86_64' 'i686')
pkgdesc=".scrobbler.log (Rockbox offline last.fm scrobling format) submiter"
url="https://github.com/ultraelephant/pyapplier"
license=('GPL')
source=("git+https://github.com/ultraelephant/pyapplier")
md5sums=('SKIP')
depends=('python' 'python-pylast' 'python-setuptools' 'python-pyaml')

prepare() {
        cd "$pkgname"
}

build() {
        cd "$pkgname"
}

check() {
        cd "$pkgname"
}

package() {
        mkdir -p $pkgdir/usr/bin
        cp $pkgname/pyapplier.py $pkgdir/usr/bin/pyapplier
        chmod +x $pkgdir/usr/bin/pyapplier
}
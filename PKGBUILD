# Maintainer: Everett B. <everettbutts@hotmail.com>
pkgname=passgen-git
pkgver=V1.02.g6bf9091
pkgrel=1
pkgdesc='A simple cli tool that generates passwords of a user defined length. Can currently create Random String, Secure Token String , and UUID4 Secure Unique String ID passwords'
url="https://github.com/Can221-ParOS/passgen-git.git"
license=('GPL3')
depends=("python")
makedepends=(git)
arch=('x86_64')
source=("git+$url")
md5sums=("SKIP")

pkgver() {
  cd "$pkgname"
  git describe --long --tags | grep -o g.......
}

package() {
    echo "$pkgname"
    mkdir -p "$pkgdir/usr/bin/"
    cp "$srcdir/$pkgname/passgen" "$pkgdir/usr/bin/passgen"
}

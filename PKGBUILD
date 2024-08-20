pkgname=conman
pkgver=1.0.0
pkgrel=1
pkgdesc="a (con)figuration (man)ager"
arch=('any')
url="https://github.com/teaperr/conman"
license=('MIT')
depends=('go')
source=("git+${url}.git#branch=master")
md5sums=('SKIP')

build() {
    cd "$srcdir/conman"
    go build -o conman
}

package() {
    cd "$srcdir/conman"
    install -Dm755 conman "$pkgdir/usr/bin/conman"
}


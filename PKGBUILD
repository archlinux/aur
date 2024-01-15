# Maintainer: Dandraghas <dandraghas at proton dot me>

pkgname=gomerge
pkgver=3.3.0
pkgrel=1
pkgdesc="Gomerge is a tool which allows you to quickly bulk merge, approve and close several pull requests from your terminal."
url="https://github.com/Cian911/gomerge"
makedepends=("go")
license=('MIT')
arch=('any')

source=("git+${url}.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
    cd gomerge

    make
}

package() {
    install -D gomerge/bin/gomerge "${pkgdir}/usr/bin/gomerge"
}

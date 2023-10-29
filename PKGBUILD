# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=archosaur
pkgver=1.0.0
pkgrel=1
pkgdesc="A PKGBUILD management framework for the Arch User Repository"
arch=('any')
url="https://github.com/txtsd/${pkgname}"
license=('GPL3')
depends=('openssh')
makedepends=('git' 'asciidoc')
source=("git+${url}.git")
sha512sums=('SKIP')

build() {
    cd ${pkgname}

    make PREFIX=/usr
}

package() {
    cd ${pkgname}

    make PREFIX=/usr DESTDIR="${pkgdir}" install
}

# Maintainer: Karol Babioch <karol@babioch.de

pkgname=otca
pkgver=1
pkgrel=2
pkgdesc="otca is a script supporting you in quickly setting up a simple public-key infrastructure."
arch=('any')
url="https://github.com/kbabioch/otca/"
license=('GPL3')
depends=('openssl')
makedepends=('git')
backup=('etc/otca/otca.cnf')
source=("git+https://github.com/kbabioch/otca.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {

    #make
    :

}

package() {

    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir/" install

}


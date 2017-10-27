# Maintainer: Karol Babioch <karol@babioch.de

pkgname=snapback
pkgver=4
pkgrel=1
pkgdesc="Set of scripts to glue together snapshot capabilities from btrfs and backup solutions from borg in a reliable and automated way."
arch=('any')
url="https://github.com/kbabioch/snapback/"
license=('GPL3')
depends=('btrfs-progs' 'borg')
makedepends=('git')
backup=('etc/conf.d/snapback')
source=("git+https://github.com/kbabioch/snapback.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {

    #make
    :

}

package() {

    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir/" install

}


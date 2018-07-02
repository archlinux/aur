# Maintainer: George Angelopoulos <george@usermod.net>
pkgname=tremc
pkgver=0.9.1
pkgrel=1
pkgdesc="Curses interface for transmission - python3 fork of transmission-remote-cli"
arch=('any')
url="https://github.com/tremc/tremc"
license=('GPL3')
depends=('python')
makedepends=('git')
optdepends=('python-geoip: Guess which country peers come from'
            'python-xerox: Copy magnet links to the system clipboard') 
source=("https://github.com/tremc/tremc/archive/v0.9.1.tar.gz")
md5sums=('08262de033014bf19cde91f1f27cf264')

conflicts=('tremc-git')

package() {
    cd "$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

# vim: ts=4 sts=4 sw=4 et

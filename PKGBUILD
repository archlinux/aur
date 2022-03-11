# Maintainer: George Angelopoulos <george@usermod.net>
pkgname=tremc
pkgver=0.9.3
pkgrel=2
pkgdesc="Curses interface for transmission - python3 fork of transmission-remote-cli"
arch=('any')
url="https://github.com/tremc/tremc"
license=('GPL3')
depends=('python')
optdepends=('python-geoip: Guess which country peers come from'
            'python-xerox: Copy magnet links to the system clipboard')
source=("https://github.com/tremc/tremc/archive/$pkgver.tar.gz")
md5sums=('3adc2bf4796fa991118e41b7cb98c668')

conflicts=('tremc-git')

package() {
    cd "$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

# vim: ts=4 sts=4 sw=4 et

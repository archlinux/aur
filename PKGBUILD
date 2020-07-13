# Maintainer: ThePaulODoom <pblemmermann@gmail.com>
pkgname=macho
pkgver=1
pkgrel=2
pkgdesc="Macho is a man page viewer by HiPhish"
arch=('any')
url="https://hiphish.github.io/blog/2020/05/31/macho-man-command-on-steroids/"
license=('GPL')
depends=('man-db' 'sed' 'gawk' 'grep' 'coreutils' 'fzf')
makedepends=('curl')
provides=('macho')
source=("$pkgname::https://gitlab.com/snippets/1995457/raw")
md5sums=('SKIP')

package() {
    curl -LO "https://gitlab.com/snippets/1995457/raw"
    install -Dm755 ./raw "$pkgdir/usr/bin/macho"
}

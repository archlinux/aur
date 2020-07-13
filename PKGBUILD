# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: ThePaulODoom <pblemmermann@gmail.com>
pkgname=macho
pkgver=1
pkgrel=1
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

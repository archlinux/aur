# Contributor: Mark Foxwell <fastfret79@archlinux.org.uk>
# Contributor: Nicolas Pouillard [https://nicolaspouillard.fr]
# Contributor: seschwar -- contact via Arch Linux forum or AUR
# Maintainer: Ian Denhardt <ian@zenhack.net>

pkgname=alot
pkgver=0.3.6
pkgrel=1
pkgdesc="terminal-based MUA for the notmuch mail system"
arch=(any)
url="https://github.com/pazz/alot"
license=(GPL)
depends=(notmuch python2-pygpgme python2-magic python2-configobj python2-urwid python2-twisted)
options=(!emptydirs)
source=($pkgname-$pkgver.tar.gz::https://github.com/pazz/$pkgname/archive/$pkgver.tar.gz)

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py install --optimize=1 --root="$pkgdir"
}
md5sums=('527ee0b24bf444e61b05604efe4658b0')

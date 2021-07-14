# Maintainer: Carson Rueter <roachh@protonmail.com>

_pkgname='gord'
pkgname='gord-bin'
pkgdesc='Discord TUI client - Fork of cordless'
url="https://github.com/cainy-a/$_pkgname/"
license=('BSD')
pkgver=2021_07_14
pkgrel=1

_pkgver=${pkgver//_/-}
_tarname="${_pkgname}_${_pkgver}_linux_amd64"

source=("https://github.com/yellowsink/$_pkgname/releases/download/${_pkgver}/$_tarname.tar.gz")
md5sums=('3c67b6bef294c4de46c474e5891e9fc5')
provides=('gord')
conflicts=('gord-git')
depends=('glibc')
arch=('x86_64')

package() {
    cd $srcdir
    install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


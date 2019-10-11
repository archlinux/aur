# Maintainer: Max Hollmann <max@hollmann.me>
# Contributor: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=lf-extras
_pkgname=lf
pkgver=13
pkgrel=2
pkgdesc="extras for lf, the file manager"
arch=('any')
url="https://github.com/gokcehan/lf"
license=('MIT')
depends=('lf')
source=("$_pkgname-r$pkgver.tar.gz::https://github.com/gokcehan/$_pkgname/archive/r$pkgver.tar.gz")
md5sums=('4d4617d3ac534b707b14f14fb0c08b53')

package() {
    cd $_pkgname-r$pkgver

    install -Dm644 etc/lfrc.example "${pkgdir}"/usr/share/doc/$_pkgname/lfrc.example
    install -Dm644 etc/lf.vim "${pkgdir}"/usr/share/vim/vimfiles/plugin/lf.vim
    install -Dm644 etc/lf.fish "${pkgdir}"/usr/share/fish/vendor_completions.d/lf.fish
    install -Dm644 etc/lfcd.fish "${pkgdir}"/usr/share/fish/vendor_functions.d/lfcd.fish
    install -Dm644 etc/lfcd.sh "${pkgdir}"/usr/share/$_pkgname/lfcd.sh
    install -Dm644 lf.1 "${pkgdir}"/usr/share/man/man1/lf.1
}


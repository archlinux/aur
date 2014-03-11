# Maintainer: Caleb Maclennan <caleb@alerque.com>
pkgname=freecheck
pkgver=0.30.1
pkgrel=2
url=https://github.com/alerque/freecheck
pkgdesc='A blank check printer that adds MICR codes and check templates to blank stock.'
arch=('any')
license=('GPL2')
depends=('perl' 'gnumicr')
optdepends=(
      'cups: printing support'
      'ghostscript: output to pdf files'
    )
source=('https://github.com/alerque/freecheck/archive/installer.tar.gz')
md5sums=('aa984e37da9165d488fc31cf3efcc28a')

package() {
    cd "$srcdir/$pkgname-installer"
    make prefix=$pkgdir install
}


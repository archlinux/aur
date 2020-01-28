# Maintainer: mehalter <micah at mehalter.com>
# Contributor: mehalter <micah at mehalter.com>
# Contributor: Maxim Moseychuk <franchesko.salias.hudro.pedros@gmail.com>
# Contributor: oozyslug <oozyslug at gmail dot com>
# Submitter: mehalter <micah at mehalter.com>

_pkgname=antigen
pkgname=antigen
pkgver='2.2.3'
pkgrel=2
pkgdesc="A plugin manager for zsh, inspired by oh-my-zsh and vundle."
arch=('any')
url="https://github.com/zsh-users/antigen"
source=("https://github.com/zsh-users/antigen/releases/download/v${pkgver}/v${pkgver}.tar.gz")
sha256sums=('bd3f1077050d52f459bc30fa3f025c44c528d625b4924a2f487fd2bacb89d61e')
license=('MIT')
provides=('antigen')
depends=('zsh' 'git')
makedepends=('make')
install='antigen.install'

package() {
    cd $srcdir/$_pkgname-$pkgver
    make PREFIX=$pkgdir/usr/share/zsh build
    make PREFIX=$pkgdir/usr/share/zsh install
}

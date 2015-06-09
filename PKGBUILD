# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=subrepo
pkgver=0.0.1
pkgrel=2
pkgdesc="Git & Mercurial subrepos done right"
arch=('any')
depends=('git' 'mercurial')
url="http://blog.rusty.io/2010/01/24/submodules-and-subrepos-done-right/"
license=('Apache')
source=(subgit
        subhg)
sha256sums=('f1fc0854c4162c0e1da5640e3609e10e2641b25835b05b9bb0c8d8ee0d9e12b6'
            '8fb862db6f0953f125ab3ad1c136b97f86c685c05f27a64df0b7c939147c4c3b')
provides=('subgit subhg')
conflicts=('subgit-git subhg-git')

package() {
  cd $srcdir

  msg 'Installing executables...'
  install -D -m755 subgit "${pkgdir}/usr/bin/subgit"
  install -D -m755 subhg "${pkgdir}/usr/bin/subhg"
}

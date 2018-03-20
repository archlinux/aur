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
sha256sums=('f627c66bd7203b91b48822f5fe535ea10e5370b94886bd450d98050e2ec7bb03'
            '8cef86a2ea6f8961ed984528e3add2048cb8f2bfee9ee2d9d0cb8ec997019d61')
provides=('subgit subhg')
conflicts=('subgit-git subhg-git')

package() {
  cd $srcdir

  msg 'Installing executables...'
  install -D -m755 subgit "${pkgdir}/usr/bin/subgit"
  install -D -m755 subhg "${pkgdir}/usr/bin/subhg"
}

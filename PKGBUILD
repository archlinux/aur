# Maintainer: Sébastien Luttringer

pkgname=agetpkg-git
pkgver="$(git log --pretty=format:''|wc -l)"
pkgrel=1
pkgdesc='Archlinux Archive Get Package (Git version)'
arch=('any')
url='https://github.com/seblu/agetpkg'
license=('GPL2')
makedepends=('git')
depends=('python' 'python-xdg')
conflicts=('agetpkg')

package() {
  cd "$startdir"
  install -Dm755 agetpkg "$pkgdir/usr/bin/agetpkg"
}

# vim:set ts=2 sw=2 et:

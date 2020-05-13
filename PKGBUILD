# Maintainer: 
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Will Price <will.price94+aur@gmail.com>

_npmname=gitignore
_npmver=0.6.0
pkgname=nodejs-gitignore # All lowercase
pkgver=0.6.0
pkgrel=1
pkgdesc="Automatically fetch gitignore files for any project type from github into your new project"
arch=(any)
url="https://github.com/msfeldstein/gitignore"
license=()
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('ecb937dd5efb23f9e3db487b7abff7a3444287969b24a33abb1d2ebde074f87f')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:

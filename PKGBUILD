# Maintainer: Will Price <will.price94+aur@gmail.com>

_npmname=gitignore
_npmver=0.1.6
pkgname=nodejs-gitignore # All lowercase
pkgver=0.1.6
pkgrel=1
pkgdesc="Automatically fetch gitignore files for any project type from github into your new project"
arch=(any)
url="https://github.com/msfeldstein/gitignore"
license=()
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(311b32ebfee1a65d2546c032e777b389dd148566)

build() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:

# Maintainer: Connor McFarlane <cm at semtex dot net>

pkgname=foobar2000-component-runcmd-bin
pkgver=1.1
pkgrel=4
_buildhash='fe25440f759b899a918aeb8a531107da'
_builddate='20100107'
_fooname='foo_runcmd'
pkgdesc='A component to find and execute menu items for foobar2000'
arch=('any')
url="https://www.foobar2000.org/components/view/${_fooname}"
license=('unknown')
depends=('foobar2000>=1.0.0')
source=("https://foobar2000.org/getcomponent/${_buildhash}/${_fooname}-${pkgver}-${_builddate}.zip")
md5sums=('a79f101e1a68c86bf9242d9362b893d5')

package() {
  install -Dm644 -t "$pkgdir/usr/share/foobar2000/components/${_fooname}" "$srcdir/components/${_fooname}.dll"
}


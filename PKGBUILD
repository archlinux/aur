# Maintainer: Stefan Göbel <aur —at— subtype —dot— de>

pkgname='corky'
pkgver='2019021402'
pkgrel='1'
pkgdesc='Some Lua modules for the system monitor Conky.'
url='https://gitlab.com/goeb/corky/'
install="$pkgname.install"
arch=('any')
license=('GPL3')
depends=('conky-cairo' 'lua-lpeg')
makedepends=('git' 'ldoc')
source=("$pkgname::git+https://gitlab.com/goeb/$pkgname.git#tag=$pkgver")
sha256sums=('SKIP')

package() {

   cd "$pkgname"
   make install DESTDIR="$pkgdir" PREFIX='/usr'

}

#:indentSize=3:tabSize=3:noTabs=true:mode=shellscript:maxLineLen=87:
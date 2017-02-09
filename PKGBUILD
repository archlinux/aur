# Maintainer: Allonsy < linuxbash8 [at@at] gmail [dot.dot] com >
pkgname=git-town
pkgver=3.0.0
pkgrel=1
pkgdesc="A git extension for generic high-level git workflow support"
url="https://github.com/Originate/git-town"
arch=('x86_64' 'i686')
license=('MIT')
depends=('bash' 'git' 'dialog')
source=("$pkgname"::"git://github.com/Originate/git-town#tag=v$pkgver")
md5sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/lib/git-core
  chmod 755 $pkgdir/usr/lib
  cp -r src/* $pkgdir/usr/lib/git-core
  
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  mkdir -p $pkgdir/usr/share/man/man1
  cp -r man $pkgdir/usr/share/
}


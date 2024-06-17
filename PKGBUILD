pkgname=luajit-symlinks
pkgver=1
pkgrel=1
pkgdesc='Runs luajit if lua5.1 is called'
arch=('any')
depends=('luajit')
provides=('lua51')
conflicts=('lua51')

package() {
  install -dm755 "$pkgdir/usr/bin"
  cd "$pkgdir/usr/bin"
  ln -s luajit lua5.1

  install -dm755 "$pkgdir/usr/include"
  cd "$pkgdir/usr/include"
  ln -s luajit-2.1 lua5.1
}

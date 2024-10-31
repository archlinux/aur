pkgname=gopass-symlinks
pkgver=0
pkgrel=1
pkgdesc='Runs gopass if pass is called'
arch=('any')
depends=('gopass')
provides=('pass')
conflicts=('pass')

package() {
  install -dm755 "$pkgdir/usr/bin/"
  cd "$pkgdir/usr/bin/"

  ln -s gopass pass
}

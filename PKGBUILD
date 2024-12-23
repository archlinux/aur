pkgname=gopass-symlinks
pkgver=0
pkgrel=1
pkgdesc='Runs gopass if pass is called'
arch=('any')
depends=('gopass')
provides=('pass')
conflicts=('pass')
source=(_pass)
sha256sum=(SKIP)

package() {
  install -Dm644 ../_pass -t "$pkgdir/usr/share/zsh/site-functions"
  install -dm755 "$pkgdir/usr/bin/"
  cd "$pkgdir/usr/bin/"

  ln -s gopass pass
}
sha256sums=('701bb8f11c4efac771e8218cd78efa80c3005058a4ec9c907b741383cba08c9d')

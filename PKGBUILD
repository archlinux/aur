pkgname=mocp-scrobbler
pkgver=0.2
pkgrel=1
pkgdesc="Last.fm scrobbler for MOC audio player"
arch=('any')
url="https://github.com/fluxid/mocp-scrobbler"
license=('GPL')
depends=('python' 'moc')
install=$pkgname.install
source=('https://raw.githubusercontent.com/fluxid/mocp-scrobbler/master/mocp-scrobbler.py'
        'config.example')
md5sums=('f5aa370d01fcb088d123f1d6c522e7fe'
         'f8ac0e62a30c03bbf90761fc7d5ba624')

package() {
  cd "$srcdir"

  mkdir -p $pkgdir/usr/{bin,share/doc/$pkgname}
  install -m755 $pkgname.py $pkgdir/usr/bin/
  install -m644 config.example $pkgdir/usr/share/doc/$pkgname/
}

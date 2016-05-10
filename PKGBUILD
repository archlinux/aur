# Maintainer: James An <james@jamesan.ca>

pkgname=philesight
pkgver=20120427
pkgrel=1
pkgdesc='A tool to browse your filesystem and see where the diskspace is being used at a glance (fork of filelight for headless environments).'
arch=('any')
url="http://zevv.nl/play/code/philesight"
license=('GPL')
depends=('ruby-cairo' 'ruby-bdb')
source=("http://zevv.nl/play/code/$pkgname/$pkgname-$pkgver.tgz")
md5sums=('bfc4113ef97df0dc1399f20e6bed9261')

package() {
  cd $pkgname-$pkgver

  # installing package into opt
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm755 "$pkgname.rb" "$pkgdir/usr/lib/ruby/2.3.0/$pkgname.rb"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
  install -m755 --directory "$pkgdir/var/lib/philesight"
}

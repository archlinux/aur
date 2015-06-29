#Contributor: Fabio Scotoni <CCuleX@gmail.com>
#Maintainer: aksr <aksr at t-com dot me>
pkgname=cjots
pkgver=0.95
pkgrel=2
pkgdesc="A console note taker program written in Perl for Linux using Perl's Curses library. Inspired by Kjots."
arch=('any')
url="http://cjots.sourceforge.net"
license=('GPL')
depends=('perl' 'perl-curses' 'perl-curses-ui')
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('fa035118192ce408eda37457c2bdf639')
sha1sums=('c49e3edcd9c6b859fc3290ff6694bb37c58c38bd')
sha256sums=('415024e8e2b1a69fc491271dedc158cb93dc50442958d4aa20ec3cd47da94f4e')
    
package() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p $pkgdir/usr/bin
  install -Dm755 cjots.pl $pkgdir/usr/bin/cjots
}


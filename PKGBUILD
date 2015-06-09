# Contributor: Jan Fader <jan.fader@web.de>
pkgname=t-prot
pkgver=3.4
pkgrel=1
pkgdesc="A filter which improves the readability of email messages and Usenet posts by hiding some of their annoying parts"
url="http://www.escape.de/users/tolot/mutt/"
license=('BSD')
arch=('any')
depends=('perl-locale-gettext')
source=(http://www.escape.de/users/tolot/mutt/t-prot/downloads/$pkgname-$pkgver.tar.gz LICENSE)

package() {
  cd $srcdir/$pkgname-$pkgver
  install -D -m755 t-prot $pkgdir/usr/bin/t-prot
  install -D -m644 t-prot.1 $pkgdir/usr/share/man/man1/t-prot.1
  install -d -m755 $pkgdir/usr/share/t-prot
  cp -a contrib/ $pkgdir/usr/share/t-prot/contrib/
  install -d -m755 -p $pkgdir/usr/share/licenses/t-prot
  install -D -m644 $srcdir/LICENSE -p $pkgdir/usr/share/licenses/t-prot/LICENSE
}
sha512sums=('6c86c10e5b381b93cbaa9382f8bd2c94eeb9c8ecec092d83cfbda5f0eea5933fb85397b364ea58e08ef93e6a06198447f167f0850959ddf16b8a18d3fe8953f0'
            '851607bbae4c09f23b9eafe1002c924b2bb6bec6f09037b7ca73fa665664ca8678ee6f209dcbb215dcd24261c969735c2d2dfa606495d77ef34120c14baa98cc')

# $Id: PKGBUILD 257638 2017-09-15 07:11:45Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Xilon <xilonmu@gmail.com>
# Contributor: Edward Toroschin <edward.hades@gmail.com>

pkgname=grc
pkgver=1.11.1
pkgrel=3
pkgdesc='Yet another colouriser for beautifying your logfiles or output of commands.'
arch=('any')
url='https://github.com/garabik/grc'
license=('GPL')
depends=('python')
backup=('etc/grc.conf')
source=($pkgname-$pkgver.tar.gz::https://github.com/garabik/grc/archive/v$pkgver.tar.gz)
sha256sums=('9ae4bcc9186d6856e861d5b0e29b7b14db3f14e6b643e2df0076c104a94dbcba')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  ./install.sh "$pkgdir"/usr "$pkgdir"
  # FS#55468
  # mv "$pkgdir"/etc/profile.d/grc.bashrc "$pkgdir"/etc/profile.d/grc.bashrc.sh
}

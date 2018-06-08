# $Id: PKGBUILD 257638 2017-09-15 07:11:45Z spupykin $
# Maintainer: Juan Simón 
# Contributor: Xilon <xilonmu@gmail.com>
# Contributor: Edward Toroschin <edward.hades@gmail.com>

pkgname=grc
pkgver=1.11.3
pkgrel=1
pkgdesc='Yet another colouriser for beautifying your logfiles or output of commands.'
arch=('any')
url='https://github.com/garabik/grc'
license=('GPL')
depends=('python')
backup=('etc/grc.conf')
source=($pkgname-$pkgver.tar.gz::https://github.com/garabik/grc/archive/v$pkgver.tar.gz)
sha256sums=('b167babd8f073a68f5a3091f833e4036fb8d86504e746694747a3ee5048fa7a9')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  ./install.sh "$pkgdir"/usr "$pkgdir"
}

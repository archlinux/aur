# Contributor: ConnorBehan <connor.behan@gmail.com>

pkgname=diet-kconfig
pkgver=1
pkgrel=5
pkgdesc="A script to trim unused modules when compiling the kernel"
arch=('i686' 'x86_64')
url="http://ftp.suse.com/pub/people/tiwai/misc/${pkgname}"
license=('GPL')
depends=('findutils' 'grep' 'sed' 'awk' 'coreutils')
source=($url)

package() {
  install -Dm755 "$srcdir"/$pkgname "$pkgdir"/usr/bin/$pkgname
}
md5sums=('500addab85db4abd77e70f04cc352eab')

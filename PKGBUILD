# Maintainer: Runney Wu <an9wer@gmail.com>

pkgname=an9wer-suckless-rebuild
pkgver=0.1.2
pkgrel=1
pkgdesc="A script to rebuild suckless softwares"
url="https://github.com/an9wer/pkg/tree/master/arch/suckless-rebuild"
arch=('x86_64')
license=('MIT')
groups=('an9wer-suckless')
depends=('bash')
source=("suckless-rebuild")
md5sums=('c7d19bc4fdd6376df88fda66a2ff26a8')

package() {
  install -m755 -D suckless-rebuild "$pkgdir/usr/bin/suckless-rebuild"
}

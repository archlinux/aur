# Maintainer: Runney Wu <an9wer@gmail.com>

pkgname=an9wer-suckless-rebuild
pkgver=0.1.0
pkgrel=1
pkgdesc="A script to rebuild suckless tools"
url="https://github.com/an9wer/pkg/tree/master/arch/suckless-rebuild"
arch=('x86_64')
license=('MIT')
source=("suckless-rebuild")
md5sums=('52dd209ab552f2134dc129d5860eda91')

package() {
  install -m755 -D suckless-rebuild "$pkgdir/usr/bin/suckless-rebuild"
}

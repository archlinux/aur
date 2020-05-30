# Maintainer: Runney Wu <an9wer@gmail.com>

pkgname=an9wer-suckless-rebuild
pkgver=0.1.1
pkgrel=1
pkgdesc="A script to rebuild suckless softwares"
url="https://github.com/an9wer/pkg/tree/master/arch/suckless-rebuild"
arch=('x86_64')
license=('MIT')
depends=('bash')
source=("suckless-rebuild")
md5sums=('3bca355a7976136bc77c5421d9e7c59d')

package() {
  install -m755 -D suckless-rebuild "$pkgdir/usr/bin/suckless-rebuild"
}

# Maintainer: Grant Handy <grantshandy AT gmail DOT com>

_pkgname='thes'
pkgname=${_pkgname}-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="A CLI tool that finds the location of IP addresses."
arch=('x86_64')
url="https://github.com/DefunctLizard/thes"
license=('APACHE-2.0')
depends=('glibc')
makedepends=('rust' 'git')
source=("https://github.com/DefunctLizard/thes/releases/download/0.1.2/thes-linux.x86_64")
md5sums=('SKIP')

package() {
  cd "$srcdir/"

  # Binary
  install -Dm755 thes-linux.x86_64 $pkgdir/usr/bin/$_pkgname
}

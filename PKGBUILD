pkgdesc="Access s3 from bash"
pkgname=s3-bash
pkgver=1
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/random-archer/s3-bash"
#source=("git+${url}.git#tag=v$pkgver")
source=("git+${url}.git#branch=master")
md5sums=('SKIP')
license=('Apache')
makedepends=('git')

package() {
  cd "$pkgname"
  install -D -m755 s3-common-functions "$pkgdir/usr/bin/s3-common-functions"
  install -D -m755 s3-delete "$pkgdir/usr/bin/s3-delete"
  install -D -m755 s3-get "$pkgdir/usr/bin/s3-get"
  install -D -m755 s3-put "$pkgdir/usr/bin/s3-put"
}

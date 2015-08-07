# Maintainer: Kevin Rauwolf <sweetpea@tentacle.net>
pkgname=s3-curl
pkgver=20120308
pkgrel=1
pkgdesc="Amazon S3 Authentication Tool for Curl"
url="http://aws.amazon.com/code/128"
arch=('x86_64' 'i686')
license=('BSD')
depends=('perl' 'perl-digest-hmac')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=("http://s3.amazonaws.com/doc/s3-example-code/s3-curl.zip")
md5sums=('f63d4ef54af0400dba7793b8f0793bd8')

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm755 s3curl.pl "$pkgdir/usr/bin/s3curl"
}

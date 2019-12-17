# Maintainer: Steve Engledow <steve@engledow.me>
pkgname=aws-cli-v2
pkgver=latest
pkgrel=1
pkgdesc="Experimental v2 of the AWS CLI"
arch=('i686' 'x86_64')
url="https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html"
license=('Apache-2.0')
depends=(
)
makedepends=(
  'unzip'
)
source=("awscliv2.zip::https://d1vvhvl2y92vvt.cloudfront.net/awscli-exe-linux-x86_64.zip")
sha1sums=('SKIP')

package() {
  cd "$srcdir"
  ./aws/install -i "$pkgdir/usr/share/aws-cli" -b "$pkgdir/usr/bin"
}

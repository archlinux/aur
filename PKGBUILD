# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ec2-metadata
pkgver=0.1.1
pkgrel=1
pkgdesc="A simple bash script that uses curl to query the EC2 instance Metadata from within a running EC2 instance"
arch=('any')
url='https://aws.amazon.com/code/ec2-instance-metadata-query-tool/'
license=('Apache')
depends=('curl')
source=("http://s3.amazonaws.com/ec2metadata/$pkgname")
sha256sums=('e320585b2455a879f201c6a0cc381a5b645ce1bd851c7946e12dc6513c07769d')

package() {
  cd "$srcdir"

  install -D -m 755 ec2-metadata "$pkgdir"/usr/bin/ec2-metadata
}

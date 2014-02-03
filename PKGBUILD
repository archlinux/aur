# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ec2-metadata
pkgver=0.1.1
pkgrel=1
pkgdesc="A simple bash script that uses curl to query the EC2 instance Metadata from within a running EC2 instance."
arch=('any')
url="http://developer.amazonwebservices.com/connect/entry.jspa?externalID=1825"
license=('APL')
depends=('curl')
source=('http://s3.amazonaws.com/ec2metadata/ec2-metadata')
md5sums=('2b81a0ca0f19485ef9c543bcc7ae1020')

build() {
  cd "$srcdir"

}

package() {
  cd "$srcdir"

  install -D -m 755 ec2-metadata $pkgdir/usr/bin/ec2-metadata
}

# vim:set ts=2 sw=2 et:

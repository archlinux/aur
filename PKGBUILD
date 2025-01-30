# Maintainer: Oliver Gasser <oliver@flowriver.net>
pkgname=mmdbctl
pkgver=1.4.7
pkgrel=1
pkgdesc="mmdbctl is an MMDB file management CLI by IPinfo.io"
arch=('x86_64')
url="https://github.com/ipinfo/mmdbctl"
license=('APACHE')
provides=('mmdbctl')
conflicts=('mmdbctl')
source=("https://github.com/ipinfo/mmdbctl/releases/download/mmdbctl-$pkgver/mmdbctl_${pkgver}.deb")
sha256sums=('ff0403d1490f47b73782cc3ccfca46b83e88c2d3e4e60540c01feadd576c51ee')

package() {
  bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}

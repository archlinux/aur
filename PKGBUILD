# Maintainer: Oliver Gasser <oliver@flowriver.net>
pkgname=mmdbctl
pkgver=1.4.10
pkgrel=1
pkgdesc="mmdbctl is an MMDB file management CLI by IPinfo.io"
arch=('x86_64')
url="https://github.com/ipinfo/mmdbctl"
license=('APACHE')
provides=('mmdbctl')
conflicts=('mmdbctl')
source=("https://github.com/ipinfo/mmdbctl/releases/download/mmdbctl-$pkgver/mmdbctl_${pkgver}.deb")
sha256sums=('dea9e78104bb20d0695fd663299d60c336fe308004ba1e9c7872a190fec9204c')

package() {
  bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}

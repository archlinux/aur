# Maintainer: Oliver Gasser <oliver@flowriver.net>
pkgname=mmdbctl
pkgver=1.4.4
pkgrel=1
pkgdesc="mmdbctl is an MMDB file management CLI by IPinfo.io"
arch=('x86_64')
url="https://github.com/ipinfo/mmdbctl"
license=('APACHE')
provides=('mmdbctl')
conflicts=('mmdbctl')
source=("https://github.com/ipinfo/mmdbctl/releases/download/mmdbctl-$pkgver/mmdbctl_${pkgver}.deb")
sha256sums=('40fbf372e7e6222e0f72bba5df5f84578683bbfbbfec73cf94c9b59736c830fa')

package() {
  bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}

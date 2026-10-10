# Maintainer: Oliver Gasser <oliver@flowriver.net>
pkgname=mmdbctl
pkgver=1.5.0
pkgrel=1
pkgdesc="mmdbctl is an MMDB file management CLI by IPinfo.io"
arch=('x86_64')
url="https://github.com/ipinfo/mmdbctl"
license=('APACHE')
provides=('mmdbctl')
conflicts=('mmdbctl')
source=("https://github.com/ipinfo/mmdbctl/releases/download/mmdbctl-$pkgver/mmdbctl_${pkgver}.deb")
sha256sums=('f0ff168d89537e33621b486eb7c0baeb4d137e39a27a492fc273fe95fe923a86')

package() {
  bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}

# Maintainer: Oliver Gasser <oliver@flowriver.net>
pkgname=mmdbctl
pkgver=1.5.2
pkgrel=1
pkgdesc="mmdbctl is an MMDB file management CLI by IPinfo.io"
arch=('x86_64')
url="https://github.com/ipinfo/mmdbctl"
license=('APACHE')
provides=('mmdbctl')
conflicts=('mmdbctl')
source=("https://github.com/ipinfo/mmdbctl/releases/download/mmdbctl-$pkgver/mmdbctl_${pkgver}.deb")
sha256sums=('c1dbc3627b31b54a0abdf5ebcafa3fb21543eb287b4137782cb2a596d6c885e8')

package() {
  bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}

# Maintainer: Felix <felix.crabdrop@gmail.com>
pkgname=crabdrop-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="A simple, fast file manager for S3-compatible storage"
arch=('x86_64')
url="https://github.com/alsofelix/crabdrop"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'openssl')
provides=('crabdrop')
conflicts=('crabdrop')
source=("${url}/releases/download/v${pkgver}/crabdrop_${pkgver}_amd64.deb")
sha256sums=('b562607099e6717663edb8eb003763b13f77ffab97458c32e012829b8b47a77b')

package() {
  bsdtar -xf data.tar.gz -C "${pkgdir}/"
}

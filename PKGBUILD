# Maintainer: Felix <felix.crabdrop@gmail.com>
pkgname=crabdrop-bin
pkgver=0.3.4
pkgrel=1
pkgdesc="A simple, fast file manager for S3-compatible storage"
arch=('x86_64')
url="https://github.com/alsofelix/crabdrop"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'openssl')
provides=('crabdrop')
conflicts=('crabdrop')
source=("${url}/releases/download/v${pkgver}/crabdrop_${pkgver}_amd64.deb")
sha256sums=('aa75b8a1d74169d4f559fe85e8063e30010fe9fc9eed03423755de7eed1ac8ae')

package() {
  bsdtar -xf data.tar.gz -C "${pkgdir}/"
}

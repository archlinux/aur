# Maintainer: Felix <felix.crabdrop@gmail.com>
pkgname=crabdrop-bin
pkgver=0.5.3
pkgrel=1
pkgdesc="A simple, fast file manager for S3-compatible storage"
arch=('x86_64')
url="https://github.com/alsofelix/crabdrop"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'openssl')
provides=('crabdrop')
conflicts=('crabdrop')
source=("${url}/releases/download/v${pkgver}/crabdrop_${pkgver}_amd64.deb")
sha256sums=('365fbf534229f3781fae3a4cbe5217fb5f244bcf0deb7218b127b4354a960904')

package() {
  bsdtar -xf data.tar.gz -C "${pkgdir}/"
}

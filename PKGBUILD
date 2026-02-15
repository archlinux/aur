# Maintainer: Felix <felix.crabdrop@gmail.com>
pkgname=crabdrop-bin
pkgver=0.2.12
pkgrel=1
pkgdesc="A simple, fast file manager for S3-compatible storage"
arch=('x86_64')
url="https://github.com/alsofelix/crabdrop"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'openssl')
provides=('crabdrop')
conflicts=('crabdrop')
source=("${url}/releases/download/v${pkgver}/crabdrop_${pkgver}_amd64.deb")
sha256sums=('a52dfb95831ad95998899930423fdb8194b02c8fd5df533bb8da9145fd86d587')

package() {
  bsdtar -xf data.tar.gz -C "${pkgdir}/"
}

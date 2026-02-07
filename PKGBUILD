# Maintainer: Felix <felix.crabdrop@gmail.com>
pkgname=crabdrop-bin
pkgver=0.1.10
pkgrel=1
pkgdesc="A simple, fast file manager for S3-compatible storage"
arch=('x86_64')
url="https://github.com/alsofelix/crabdrop"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'openssl')
provides=('crabdrop')
conflicts=('crabdrop')
source=("${url}/releases/download/v${pkgver}/crabdrop_${pkgver}_amd64.deb")
sha256sums=('bc705027166787659c33a1b55b1a63c2ba773ea3408462d239930a5918030b98')

package() {
  bsdtar -xf data.tar.gz -C "${pkgdir}/"
}

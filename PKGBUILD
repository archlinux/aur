# Maintainer: LIghtJUNction <lightjunction.me@gmail.com>
pkgname=matchplane-bin
pkgver=0.1.7
pkgrel=1
pkgdesc='Federated AI matching infrastructure (prebuilt binaries)'
arch=('x86_64')
url='https://github.com/LIghtJUNction/matchplane'
license=('LicenseRef-MatchPlane-Pending')
depends=('ca-certificates' 'gcc-libs' 'glibc' 'openssl' 'zlib')
provides=('matchplane')
conflicts=('matchplane' 'matchplane-git')
backup=('etc/matchplane/matchplane.env')
install=matchplane.install
source=("matchplane-${pkgver}-linux-x86_64.tar.zst::https://github.com/LIghtJUNction/matchplane/releases/download/v${pkgver}/matchplane-${pkgver}-linux-x86_64.tar.zst")
sha256sums=('368f4d9bd105d585b7f66a5b1baa7db158b7f66fb21a8125e71045c552d0763b')

package() {
  cp -a "$srcdir/matchplane-${pkgver}-linux-x86_64/." "$pkgdir/"
}

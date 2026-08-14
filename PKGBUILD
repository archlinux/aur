# Maintainer: LIghtJUNction <lightjunction.me@gmail.com>
pkgname=matchplane-bin
pkgver=0.1.3
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
sha256sums=('4ce67b3604d61c44c9413dbe8c72b1592250d11c8387e91f2cbff3103514f02a')

package() {
  cp -a "$srcdir/matchplane-${pkgver}-linux-x86_64/." "$pkgdir/"
}

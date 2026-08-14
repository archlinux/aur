# Maintainer: LIghtJUNction <lightjunction.me@gmail.com>
pkgname=matchplane-bin
pkgver=0.1.5
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
sha256sums=('2a4915bd276f2f9864001c90335c19bbe1ff4721d31dc8d55d87ac0e9bd7e18d')

package() {
  cp -a "$srcdir/matchplane-${pkgver}-linux-x86_64/." "$pkgdir/"
}

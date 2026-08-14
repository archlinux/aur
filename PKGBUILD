# Maintainer: LIghtJUNction <lightjunction.me@gmail.com>
pkgname=matchplane-bin
pkgver=0.1.4
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
sha256sums=('186526495d2b68a8da37c10bfd09e5b4477b5b81a902d98be887e69924e1c962')

package() {
  cp -a "$srcdir/matchplane-${pkgver}-linux-x86_64/." "$pkgdir/"
}

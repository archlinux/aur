# Maintainer: LIghtJUNction <lightjunction.me@gmail.com>
pkgname=matchplane-bin
pkgver=0.1.8
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
sha256sums=('f0f4a995d2f25a5a10ecad38124c6d806747ea1b437959128e753e91065cee3a')

package() {
  cp -a "$srcdir/matchplane-${pkgver}-linux-x86_64/." "$pkgdir/"
}

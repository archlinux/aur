# Maintainer: Gildedboy
pkgname=ani-cli-mx
pkgver=1.2.0
pkgrel=1
pkgdesc='Command-line anime streaming helper for Mexico-oriented provider support'
arch=('any')
url='https://github.com/Gildedboy/ani-cli-mx'
license=('GPL')
depends=('bash' 'curl' 'gawk' 'grep' 'openssl' 'sed' 'fzf' 'mpv' 'yt-dlp')
optdepends=('aria2: parallel video downloads')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Gildedboy/ani-cli-mx/archive/refs/tags/v1.2.0.tar.gz")
sha256sums=('2b85da6b33dc7652be32f5e35c4aef7a30c66e325b72a91db5086ddca6045201')

package() {
  cd "${srcdir}"/ani-cli-mx-*/

  install -Dm755 ani-cli-mx-core "${pkgdir}/usr/lib/ani-cli-mx/ani-cli-mx-core"
  install -Dm755 ani-cli-mx "${pkgdir}/usr/bin/ani-cli-mx"
}

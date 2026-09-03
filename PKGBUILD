# Maintainer: Gildedboy
pkgname=ani-cli-mx
pkgver=3.0.0
pkgrel=1
pkgdesc='Command-line anime streaming helper for Mexico-oriented provider support'
arch=('any')
url='https://github.com/Gildedboy/ani-cli-mx'
license=('GPL')
depends=('bash' 'curl' 'gawk' 'grep' 'openssl' 'sed' 'fzf' 'mpv' 'yt-dlp')
optdepends=('aria2: parallel video downloads')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Gildedboy/ani-cli-mx/archive/refs/tags/v3.0.0.tar.gz")
sha256sums=('23346a0c6b95eef49eec5a8eedc92e9c82b52a223660273e006f67f31b9880d7')

package() {
  cd "${srcdir}"/ani-cli-mx-*/

  install -Dm755 ani-cli-mx-core "${pkgdir}/usr/lib/ani-cli-mx/ani-cli-mx-core"
  install -Dm755 ani-cli-mx "${pkgdir}/usr/bin/ani-cli-mx"
}

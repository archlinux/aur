# Maintainer: Gildedboy
pkgname=ani-cli-mx
pkgver=3.0.7
pkgrel=1
pkgdesc='Command-line anime streaming helper for Mexico-oriented provider support'
arch=('any')
url='https://github.com/Gildedboy/ani-cli-mx'
license=('GPL')
depends=('bash' 'curl' 'gawk' 'grep' 'openssl' 'sed' 'fzf' 'mpv' 'python' 'yt-dlp')
optdepends=('aria2: parallel video downloads')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Gildedboy/ani-cli-mx/archive/refs/tags/v3.0.7.tar.gz")
sha256sums=('2ec3c7acc6ab76b92d8371cc4430710651f1c9d060739eb1230b1921e7ecd232')

package() {
  cd "${srcdir}"/ani-cli-mx-*/

  install -Dm755 ani-cli-mx-core "${pkgdir}/usr/lib/ani-cli-mx/ani-cli-mx-core"
  install -Dm755 ani-cli-mx "${pkgdir}/usr/bin/ani-cli-mx"
}

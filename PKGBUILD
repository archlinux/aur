# Maintainer: Gildedboy
pkgname=ani-cli-mx
pkgver=1.1.4
pkgrel=1
pkgdesc='Command-line anime streaming helper for Mexico-oriented provider support'
arch=('any')
url='https://github.com/Gildedboy/ani-cli-mx'
license=('GPL')
depends=('bash' 'curl' 'gawk' 'grep' 'openssl' 'sed' 'fzf' 'mpv' 'yt-dlp')
optdepends=('aria2: parallel video downloads')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Gildedboy/ani-cli-mx/archive/refs/tags/v1.1.4.tar.gz")
sha256sums=('3adf25077b17ee7ee60de032c78588ced1c4be591aae3d6326e58dd22ce2f8ca')

package() {
  cd "${srcdir}"/ani-cli-mx-*/

  install -Dm755 ani-cli-mx-core "${pkgdir}/usr/lib/ani-cli-mx/ani-cli-mx-core"
  install -Dm755 ani-cli-mx "${pkgdir}/usr/bin/ani-cli-mx"
}

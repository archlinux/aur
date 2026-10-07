# Maintainer: Yegor Pomortsev <yegor@pomortsev.com>

pkgname=veeam-extract
pkgver=13.1.0.411
pkgrel=1
pkgdesc="Veeam Extract Utility for Linux"
arch=(x86_64)
url=https://www.veeam.com/backup-replication-vcp-download.html?tab=extensions
license=('LicenseRef-Veeam-EULA')
depends=()
options=(!strip)
source=("https://download2.veeam.com/VBR/v13/VeeamExtract_$pkgver.tar.gz"
    "EULA")
sha256sums=('2a34296f6bd452c741621b493268c6e17f4bd02cb4b53b6d2c0cc6ae94d9b403'
            '477ef0aa7b2a3c842a428e022e236356a719fb5ed2716b5438c7608ea1f24f5f')

package() {
  install -Dm755 extract "$pkgdir"/usr/bin/veeam-extract

  install -dm755 "$pkgdir"/usr/share/licenses/$pkgname/
  install -Dm644 EULA "$pkgdir"/usr/share/licenses/$pkgname/EULA
}

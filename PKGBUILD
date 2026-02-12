# Maintainer: Yegor Pomortsev <yegor@pomortsev.com>

pkgname=veeam-extract
pkgver=13.0.1.180
pkgrel=2
pkgdesc="Veeam Extract Utility for Linux"
arch=(x86_64)
url=https://www.veeam.com/backup-replication-vcp-download.html?tab=extensions
license=('LicenseRef-Veeam-EULA')
depends=()
source=("https://download2.veeam.com/VBR/v13/VeeamExtract_$pkgver.tar.gz"
    "EULA")
sha256sums=('4d7d75af3b34f230d94cee9f30b62a38912704921b82a873d10142c46c8627c8'
            '477ef0aa7b2a3c842a428e022e236356a719fb5ed2716b5438c7608ea1f24f5f')

package() {
  install -Dm755 extract "$pkgdir"/usr/bin/veeam-extract

  install -dm755 "$pkgdir"/usr/share/licenses/$pkgname/
  install -Dm644 EULA "$pkgdir"/usr/share/licenses/$pkgname/EULA
}

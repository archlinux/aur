# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

pkgname=gosumemory
pkgver=1.3.6
pkgrel=5
pkgdesc="Cross-Platform memory reader for osu!"
arch=(x86_64)
url="https://github.com/l3lackShark/gosumemory"
license=(GPL)
depends=("osu" "wine" "winetricks")
source=("gosumemory.exe::https://asunaproject.nl/downloads/gosumemory.exe"
        "gosumemory")
sha256sums=('da46d9ed341bf8f2a167e5d771366dd2170d50f5ce564f9e92aad9d59869de8c'
            '7312dfd93febbda96397a54127f56d372598bfdea5c8a2cc25c530183d43fecb')

package() {
  install -D -m 755 "gosumemory" "${pkgdir}/usr/bin/gosumemory"
  install -D -m 644 "gosumemory.exe" "${pkgdir}/usr/share/gosumemory/gosumemory.exe"
}

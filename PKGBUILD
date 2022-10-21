# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

pkgname=gosumemory
pkgver=1.3.6
pkgrel=3
pkgdesc="Cross-Platform memory reader for osu!"
arch=(x86_64)
url="https://github.com/l3lackShark/gosumemory"
license=(GPL)
depends=("osu" "wine" "winetricks")
source=("gosumemory.exe::https://asunaproject.nl/downloads/gosumemory.exe"
        "gosumemory")
sha256sums=("da46d9ed341bf8f2a167e5d771366dd2170d50f5ce564f9e92aad9d59869de8c"
            "954e2b10ae1e30638a7568377020aad0ef07bf3ab186d3a4c896e9ec85d8c13b")

package() {
  install -D -m 755 "gosumemory" "${pkgdir}/usr/bin/gosumemory"
  install -D -m 644 "gosumemory.exe" "${pkgdir}/usr/share/gosumemory/gosumemory.exe"
}

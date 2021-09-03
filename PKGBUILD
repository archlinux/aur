# Maintainer: Barfin
pkgname=paimon-launcher
pkgver=1.3.1
pkgrel=1
pkgdesc="unoffical native launcher for genshin impact."
arch=(x86_64)
url="https://notabug.org/loentar/paimon-launcher"
license=("https://notabug.org/loentar/paimon-launcher/raw/master/LICENSE")
source=("Paimon.AppImage::https://drive.google.com/uc?export=download&id=1GC-PFibSdo8Mwx2xG50gcfia3wSClN87"
        "Paimon-Launcher.desktop")
options=('!strip')

package() {
  install -Dm755 "${srcdir}/Paimon.AppImage" "${pkgdir}/opt/paimon-launcher/Paimon.AppImage"
  install -Dm644 "${srcdir}/Paimon-Launcher.desktop" "${pkgdir}/usr/share/applications/Paimon-Launcher.desktop"
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/paimon-launcher/Paimon.AppImage" "${pkgdir}/usr/bin/paimon-launcher"
}

md5sums=('3fb587cd10b9dd85bd001224e5023dd7'
         'b8b58842fb72262aefcbcde709b871b3')

pkgname=lichess-local-engine-bin
pkgver=0.0.6
pkgrel=1
pkgdesc="Desktop app for Lichess external engine"
arch=('x86_64')
url="https://github.com/fitztrev/lichess-tauri"
license=('AGPL3')
depends=('gtk3' 'webkit2gtk' 'hicolor-icon-theme')
provides=('lichess-local-engine')
conflicts=('lichess-local-engine')
source=("https://github.com/fitztrev/lichess-tauri/releases/download/app-v${pkgver}/lichess-local-engine_${pkgver}_amd64.deb")
sha256sums=('813ed9d5ef0a14d7622f34d337f807f5f2b6ed64a0f5b75ce1169f332bd750b5')

package() {
  bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
  mv "${pkgdir}/usr/share/icons/hicolor/256x256@2" "${pkgdir}/usr/share/icons/hicolor/256x256"
}

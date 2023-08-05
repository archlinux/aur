pkgname=lichess-local-engine-bin
pkgver=0.0.5
pkgrel=1
pkgdesc="Desktop app for Lichess external engine"
arch=('x86_64')
url="https://github.com/fitztrev/lichess-tauri"
license=('AGPL3')
depends=('gtk3' 'webkit2gtk' 'hicolor-icon-theme')
provides=('lichess-local-engine')
conflicts=('lichess-local-engine')
source=("https://github.com/fitztrev/lichess-tauri/releases/download/app-v${pkgver}/lichess-local-engine_${pkgver}_amd64.deb")
sha256sums=('cdb4b7824d861ce0837bfff0a9940b76434413bb8cbd9781c9bc80c537c3e7e9')

package() {
  bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
  mv "${pkgdir}/usr/share/icons/hicolor/256x256@2" "${pkgdir}/usr/share/icons/hicolor/256x256"
}

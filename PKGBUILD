# Maintainer: Hecori (https://github.com/Hecori/obsolete-appimagetool-gms2)
# Contributor: Ayami
# Contributor: ahmubashshir

# based on appimagetool-bin PKGBUILD by Ayami

_pkgname='appimagetool'
pkgname="obsolete-appimagetool-bin"
pkgver=13
pkgrel=2
pkgdesc='Package desktop applications as AppImages (Obsolete version, compatible with Game Maker Studio, at least as on today 21/08/2025)'
arch=('x86_64' 'armhf' 'i686' 'aarch64')
url='https://github.com/AppImage/AppImageKit/releases/download/'
license=('MIT')
depends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
noextract=("${_pkgname}-${pkgver}-${arch}.appimage")

#Because it can not be empty i guess
source=("https://github.com/AppImage/appimagetool/raw/refs/tags/continuous/README.md" 
	"https://github.com/AppImage/appimagetool/raw/refs/tags/continuous/LICENSE")

source_x86_64=("${url}/${pkgver}/obsolete-${_pkgname}-x86_64.AppImage")
source_armhf=("${url}/${pkgver}/obsolete-${_pkgname}-armhf.AppImage")
source_i686=("${url}/${pkgver}/obsolete-${_pkgname}-i686.AppImage")
source_aarch64=("${url}/${pkgver}/obsolete-${_pkgname}-aarch64.AppImage")

sha256sums=('5fda0457b69bc54b7f8a4274d574be98b836573a893b13d89b321843a27eb220'
            'd726eb47bb96b7e7f8971a1431575ab4fd8780b5d2efde3552c70ef71469015f')
sha256sums_x86_64=('df3baf5ca5facbecfc2f3fa6713c29ab9cefa8fd8c1eac5d283b79cab33e4acb')
sha256sums_armhf=('36bb718f32002357375d77b082c264baba2a2dcf44ed1a27d51dbb528fbb60f6')
sha256sums_i686=('104978205c888cb2ad42d1799e03d4621cb9a6027cfb375d069b394a82ff15d1')
sha256sums_aarch64=('334e77beb67fc1e71856c29d5f3f324ca77b0fde7a840fdd14bd3b88c25c341f')

options=(!strip)

package(){
  install -Dm 0755 obsolete-${_pkgname}-${arch}.AppImage "$pkgdir/usr/local/bin/appimagetool"
}

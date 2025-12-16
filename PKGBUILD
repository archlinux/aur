# Maintainer: stilmisty<1772797842@qq.com>
pkgname=lightmeetspiano-bin
_pkgname=LightMeetsPiano
pkgver=0.5.1
pkgrel=1
pkgdesc="基于Tauri的光遇自动弹琴脚本."
arch=('x86_64')
url="https://github.com/StillMisty/LightMeetsPiano"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator' 'librsvg')

source_x86_64=("${_pkgname}_${pkgver}_amd64.deb::https://github.com/StillMisty/LightMeetsPiano/releases/download/app-v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums_x86_64=('SKIP')

package() {
  bsdtar -x -f "${srcdir}/${_pkgname}_${pkgver}_amd64.deb"
  bsdtar -x -f data.tar.* -C "${pkgdir}"
}
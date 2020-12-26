# Maintainer: c4tz
pkgname=kodi-addon-script-module-inputstreamhelper
pkgver=0.5.2
pkgrel=1
pkgdesc="A simple Kodi module that makes life easier for add-on developers relying on InputStream based add-ons and DRM playback."
_gitname=script.module.inputstreamhelper
arch=('any')
url="https://github.com/emilsvennesson/${_gitname}"
license=('GPL')
groups=('kodi')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}");
depends=('kodi' 'kodi-addon-inputstream-adaptive')
source=("https://github.com/emilsvennesson/${_gitname}/releases/download/v${pkgver}/${_gitname}-${pkgver}.zip"
)
sha256sums=('84de7738e88236ebc225c72c6030bc79e7795897a1863a5542af77ba2f0519a7')

package() {
    install -d "${pkgdir}/usr/share/kodi/addons"
    mv "${_gitname}" "${pkgdir}/usr/share/kodi/addons"
}

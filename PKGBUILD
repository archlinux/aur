# Maintainer: c4tz
pkgname=kodi-addon-script-module-inputstreamhelper
pkgver=0.4.4
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
sha256sums=('0d6675268ed0c570eef8fdbfb7b35454c6880f089c12c6b35a9de16d811cbcc9')

package() {
    install -d "${pkgdir}/usr/share/kodi/addons"
    mv "${_gitname}" "${pkgdir}/usr/share/kodi/addons"
}

# Maintainer: c4tz
pkgname=kodi-addon-script-module-inputstreamhelper
pkgver=0.4.7
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
sha256sums=('fa2ecf51061765367ed374cfc5322e78e284ef6305764bd7da6eba6aa23aa214')

package() {
    install -d "${pkgdir}/usr/share/kodi/addons"
    mv "${_gitname}" "${pkgdir}/usr/share/kodi/addons"
}

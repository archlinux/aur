# Maintainer: c4tz
pkgname=kodi-addon-script-module-inputstreamhelper
pkgver=0.5.2
pkgrel=2
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
source=("https://github.com/emilsvennesson/${_gitname}/releases/download/v${pkgver}/${_gitname}-${pkgver}+matrix.1.zip"
)
sha256sums=('262fd3356c653f5e65002de29621854247deccf8972d276047e0308986b76491')

package() {
    install -d "${pkgdir}/usr/share/kodi/addons"
    mv "${_gitname}" "${pkgdir}/usr/share/kodi/addons"
}

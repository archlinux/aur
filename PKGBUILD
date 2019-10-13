# Maintainer: c4tz
pkgname=kodi-addon-script-module-inputstreamhelper
pkgver=0.4.3
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
sha256sums=('94277e9c08fd058d731a181d0ac1bcc80c1d366e8b6296dccf2cc28a999cfaaa')

package() {
    install -d "${pkgdir}/usr/share/kodi/addons"
    mv "${_gitname}" "${pkgdir}/usr/share/kodi/addons"
}

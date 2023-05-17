# Maintainer: nl6720 <nl6720@archlinux.org>
# Contributor: c4tz
pkgname=kodi-addon-script-module-inputstreamhelper
pkgver=0.6.0
pkgrel=1
pkgdesc='A simple Kodi module that makes life easier for add-on developers relying on InputStream based add-ons and DRM playback'
_gitname=script.module.inputstreamhelper
arch=('any')
url="https://github.com/emilsvennesson/${_gitname}"
license=('MIT')
makedepends=('git')
depends=('kodi-addon-inputstream-adaptive')
source=("https://github.com/emilsvennesson/${_gitname}/releases/download/v${pkgver}/${_gitname}-${pkgver}+matrix.1.zip")
sha512sums=('8e6858398e1e036c7076f1cafb7106d2d3439fe40dbf9de1f0929fc9b7c19a6faa8e00f1c5f7bdac6c2e6020e5c8e165c027020c0d99229f50f56579606f51b9')

package() {
	install -d "${pkgdir}/usr/share/kodi/addons"
	cp -r "${_gitname}" "${pkgdir}/usr/share/kodi/addons"
	install -Dm644 "${_gitname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

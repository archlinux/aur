# Maintainer: nl6720 <nl6720@archlinux.org>
# Contributor: c4tz
pkgname=kodi-addon-script-module-inputstreamhelper
pkgver=0.5.9
pkgrel=1
pkgdesc='A simple Kodi module that makes life easier for add-on developers relying on InputStream based add-ons and DRM playback'
_gitname=script.module.inputstreamhelper
arch=('any')
url="https://github.com/emilsvennesson/${_gitname}"
license=('MIT')
makedepends=('git')
depends=('kodi-addon-inputstream-adaptive')
source=("https://github.com/emilsvennesson/${_gitname}/releases/download/v${pkgver}/${_gitname}-${pkgver}+matrix.1.zip")
sha512sums=('849ecc2f129d9dfd5f92258df4af20b18e7329b560cd71467f9c50757cbc7130c5542fa810375593a639e7d63dd4e3d55b0529e8009be2ae5127c5388502ba8e')

package() {
	install -d "${pkgdir}/usr/share/kodi/addons"
	cp -r "${_gitname}" "${pkgdir}/usr/share/kodi/addons"
	install -Dm644 "${_gitname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

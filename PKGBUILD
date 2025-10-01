# Maintainer: nl6720 <nl6720@archlinux.org>
# Contributor: c4tz
pkgname=kodi-addon-script-module-inputstreamhelper
pkgver=0.8.2
pkgrel=1
pkgdesc='A simple Kodi module that makes life easier for add-on developers relying on InputStream based add-ons and DRM playback'
_gitname=script.module.inputstreamhelper
arch=('any')
url="https://github.com/emilsvennesson/${_gitname}"
license=('MIT')
makedepends=('git')
depends=('kodi-addon-inputstream-adaptive')
source=("https://github.com/emilsvennesson/${_gitname}/releases/download/v${pkgver}/${_gitname}-${pkgver}.zip")
sha512sums=('9bc1859d1cb17cae74b7570fecac9294bcb285edbbc82ba29c83ae1db6314ff4095830f63ef81514fa4bee057da65148cab1d734172f9901d6fc3f2a7b229b33')

package() {
	install -d "${pkgdir}/usr/share/kodi/addons"
	cp -r "${_gitname}" "${pkgdir}/usr/share/kodi/addons"
	install -Dm644 "${_gitname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# Maintainer: nl6720 <nl6720@archlinux.org>
# Contributor: c4tz
pkgname=kodi-addon-script-module-inputstreamhelper
pkgver=0.8.6
pkgrel=1
pkgdesc='A simple Kodi module that makes life easier for add-on developers relying on InputStream based add-ons and DRM playback'
_gitname=script.module.inputstreamhelper
arch=('any')
url="https://github.com/emilsvennesson/${_gitname}"
license=('MIT')
depends=('kodi-addon-inputstream-adaptive')
source=("https://github.com/emilsvennesson/${_gitname}/releases/download/v${pkgver}/${_gitname}-${pkgver}.zip")
sha256sums=('9186e70bc29a16f24213a32edbb5afc14747da143a51e4be687c1939e40cf088')
sha512sums=('39839e9d945790610ac85cd1902e707b822a991fb145151d208a9878d06f6933519776ea2f451f92df4e3b19cb7a9046319d4988f688af6c8ed54d427280e689')

package() {
	install -d "${pkgdir}/usr/share/kodi/addons"
	cp -r "${_gitname}" "${pkgdir}/usr/share/kodi/addons"
	install -Dm644 "${_gitname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

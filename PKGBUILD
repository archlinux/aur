# Maintainer: Kamil Śliwak <cameel2@gmail.com>

_addon_name=google_search_link_fix
_addon_version=1.6.9
_addon_id=351740
_addon_filename="${_addon_name}-${_addon_version}-an+fx.xpi"
_gecko_id="jid0-XWJxt5VvCXkKzQK99PhZqAn7Xbg@jetpack"

pkgname=firefox-extension-google-search-link-fix
pkgver=${_addon_version}
pkgrel=1
pkgdesc="Firefox extension that prevents Google and Yandex search pages from replacing direct URLs with tracking URLs when you click them "
arch=('any')
url="https://github.com/palant/searchlinkfix"
license=('MPL2')
depends=("firefox")
source=("https://addons.cdn.mozilla.net/user-media/addons/${_addon_id}/${_addon_filename}")
noextract=("${_addon_filename}")
sha256sums=('c62024e8f711217585731b00c083af13f921f8245ece72c766528eaba9895732')


package() {
    cd "${srcdir}"
    install -Dm644 "${_addon_filename}" "${pkgdir}/usr/lib/firefox/browser/extensions/${_gecko_id}.xpi"
}

# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Daniel Nagy <danielnagy at gmx de>

_plugin_name=feedly_notifier
_plugin_version=2.24.5
_plugin_id=456474
_plugin_ext="fx"
pkgname=firefox-extension-feedly-notifier
pkgver=$_plugin_version
pkgrel=1
pkgdesc="Firefox extension for reading news from rss aggregator Feedly"
url="https://addons.mozilla.org/firefox/addon/feedly-notifier/"
depends=("firefox")
makedepends=('unzip')
license=('MPL2')
arch=('any')
source=("https://addons.cdn.mozilla.net/user-media/addons/${_plugin_id}/${_plugin_name}-${_plugin_version}-${_plugin_ext}.xpi")
sha256sums=('8acc05414031e60fdcb6e7e631b53e046d1f681a0e4892ea7dc32bcfc9613ebf')
noextract=(addon-${_plugin_id}-latest.xpi)

package() {
	install -Dm644 "${_plugin_name}-${_plugin_version}-${_plugin_ext}.xpi" "$pkgdir/usr/lib/firefox/browser/extensions/feedlynotifier@olsh.github.io.xpi"

}

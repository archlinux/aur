# Maintainer: GI_Jack <iamjacksemail@hackermail.com>
# Based on PKGBUILD firefox-extension-httpseverywhere

_plugin_name=trackmenot
_plugin_version=0.10.2
_file_name=addon-3173-latest.xpi
pkgdesc="Firefox extension to protect web habits from tracking and profiling"
license=('cc-by-nc-sa')
pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=1
arch=('any')
url="http://cs.nyu.edu/trackmenot/"
depends=("firefox")
source=("https://addons.mozilla.org/firefox/downloads/latest/trackmenot/${_file_name}")
sha256sums=('d4f08e0d5f1238e3f218a8d58723b2b29668864d40163186e3bbdf811134de5b')

_filename=addon-3173-latest.xpi

package() {
  local _extension_id="trackmenot@mrl.nyu.edu"
  local _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"

  cd "${srcdir}"

  install -Dm644 "${_filename}" "${_extension_dest}.xpi"
}


# Maintainer: Konstantin Shalygin (k0ste@opentech.ru)

_qt='quicktext'
pkgname=thunderbird-${_qt}
pkgver='0.9.11.5'
pkgrel='0'
pkgdesc='Quicktext is an extension for Thunderbird that lets you create templates that can be easily inserted into your own emails'
arch=('any')
_url='http://extensions.hesslow.se/'
url=${_url}extension/4/${_qt}
license=('AGPL')
depends=('thunderbird')
source=("${_url}download/24/${_qt}_${pkgver}.xpi")
sha256sums=("81560f2623994642848993a3f4343a14d7bcf069509deee13fc8fc84884861d9")

package() {
  pushd "$srcdir"
  install -Dm644 "${_qt}_${pkgver}.xpi" "$pkgdir/usr/lib/thunderbird/extentions/${_qt}.xpi"
  popd
}

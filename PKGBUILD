# Maintainer: Konstantin Shalygin (k0ste@opentech.ru)

_qt='quicktext'
pkgname=thunderbird-${_qt}
pkgver='0.9.11.5'
pkgrel='1'
pkgdesc='Quicktext is an extension for Thunderbird that lets you create templates that can be easily inserted into your own emails'
arch=('any')
_url='http://extensions.hesslow.se/'
url=${_url}extension/4/${_qt}
license=('AGPL')
depends=('thunderbird')
source=("${_url}download/24/${_qt}_${pkgver}.xpi")
sha256sums=("7443f67ff5369ca79d7a4f9a45fff37d2cf6f816b0fdf8d7484fe9cf69295664")

package() {
  pushd "$srcdir"
  install -Dm644 "${_qt}_${pkgver}.xpi" "$pkgdir/usr/lib/thunderbird/extentions/${_qt}.xpi"
  popd
}

# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

_pkgname=qtcreator-spellchecker-plugin
pkgname=${_pkgname}-bin
pkgver=3.7.0
_qtcreatorver=14.0.0
pkgrel=1
pkgdesc="Spell Checker plugin for the Qt Creator IDE"
groups=('qt')
arch=('x86_64')
url="https://github.com/CJCombrink/SpellChecker-Plugin"
license=('LGPL-3.0-only' 'GPL-3.0-only')
depends=(
    "qtcreator>=${_qtcreatorver}" 'qtcreator<15.0.0'
)
provides=('qtcreator-spellchecker-plugin')
conflicts=('qtcreator-spellchecker-plugin')
source=("${_pkgname}-$pkgver.tar.gz::${url}/releases/download/v${pkgver}/SpellChecker-Plugin_QtC${_qtcreatorver}_linux_x64.tar.gz")
sha256sums=('9d39a5605bf6bcdf60f5a0ae9ab8e07d0272dee9e4edfa6c12cc6c4230e7d7ab')

package() {
    install -D "${srcdir}/lib/qtcreator/plugins/libSpellChecker.so" "${pkgdir}/usr/lib/qtcreator/plugins/libSpellChecker.so"
}

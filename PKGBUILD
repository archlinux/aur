# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

_pkgname=qtcreator-spellchecker-plugin
pkgname=${_pkgname}-bin
pkgver=3.10.0
_qtcreatorver=17.0.0
pkgrel=1
pkgdesc="Spell Checker plugin for the Qt Creator IDE"
groups=('qt')
arch=('x86_64')
url="https://github.com/CJCombrink/SpellChecker-Plugin"
license=('LGPL-3.0-only' 'GPL-3.0-only')
depends=(
    "qtcreator>=${_qtcreatorver}"
)
provides=('qtcreator-spellchecker-plugin')
conflicts=('qtcreator-spellchecker-plugin')
source=("${_pkgname}-$pkgver.tar.gz::${url}/releases/download/v${pkgver}/SpellChecker-Plugin_QtC${_qtcreatorver}_linux_x64.tar.gz")
sha256sums=('848b2ebc8cb12632a3ace37a102f3800b2e4780fe39e2726431f44b24f333e5f')

package() {
    install -D "${srcdir}/lib/qtcreator/plugins/libSpellChecker.so" "${pkgdir}/usr/lib/qtcreator/plugins/libSpellChecker.so"
}

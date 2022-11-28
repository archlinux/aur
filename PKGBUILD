# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

pkgname=qtcreator-spellchecker-plugin-bin
pkgver=3.2.0
_qtcreatorver=9.0.0
pkgrel=1
pkgdesc="Spell Checker plugin for the Qt Creator IDE"
groups=('qt')
arch=('x86_64')
url="https://github.com/CJCombrink/SpellChecker-Plugin"
license=('LGPL3' 'GPL3')
depends=('qtcreator' 'hunspell')
provides=('qtcreator-spellchecker-plugin')
conflicts=('qtcreator-spellchecker-plugin-git' 'qtcreator-spellchecker-plugin')
source=("${url}/releases/download/v${pkgver}/SpellChecker-Plugin_QtCv${_qtcreatorver}_linux_x64.tar.gz")
sha256sums=('d67b9f6a76d3260eb92ddf03731a732aa23e91ce842f387064453b43636335a3')

package() {
    install -D "${srcdir}/lib/qtcreator/plugins/libSpellChecker.so" "${pkgdir}/usr/lib/qtcreator/plugins/libSpellChecker.so"
}

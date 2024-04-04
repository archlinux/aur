# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

pkgname=qtcreator-spellchecker-plugin-bin
pkgver=3.6.0
_qtcreatorver=13.0.0
pkgrel=1
pkgdesc="Spell Checker plugin for the Qt Creator IDE"
groups=('qt')
arch=('x86_64')
url="https://github.com/CJCombrink/SpellChecker-Plugin"
license=('LGPL3' 'GPL3')
depends=('qtcreator' 'hunspell')
provides=('qtcreator-spellchecker-plugin')
conflicts=('qtcreator-spellchecker-plugin-git' 'qtcreator-spellchecker-plugin')
source=("${url}/releases/download/v${pkgver}/SpellChecker-Plugin_QtC${_qtcreatorver}_linux_x64.tar.gz")
sha256sums=('b93dd0c3a42c3782f911e17eb2bb0180e7a2816a5d7b0d96d4cd1db415033654')

package() {
    install -D "${srcdir}/lib/qtcreator/plugins/libSpellChecker.so" "${pkgdir}/usr/lib/qtcreator/plugins/libSpellChecker.so"
}

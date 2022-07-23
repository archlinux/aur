# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

pkgname=qtcreator-spellchecker-plugin-bin
pkgver=3.1.0
pkgrel=1
pkgdesc="Spell Checker plugin for the Qt Creator IDE"
groups=('qt')
arch=('i686' 'x86_64')
url="https://github.com/CJCombrink/SpellChecker-Plugin"
license=('LGPL3')
depends=('qtcreator' 'hunspell')
conflicts=('qtcreator-spellchecker-plugin-git' 'qtcreator-spellchecker-plugin')
source=("${url}/releases/download/v${pkgver}/SpellChecker-Plugin_QtCv8.0.0_linux_x64.tar.gz")
sha256sums=('62465ba73dfe54ff959648b131b245cbc4efa9c2c931e20399606350558f8703')

package() {
    install -D "${srcdir}/lib/qtcreator/plugins/libSpellChecker.so" "${pkgdir}/usr/lib/qtcreator/plugins/libSpellChecker.so"
}

# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

pkgname=qtcreator-spellchecker-plugin-bin
pkgver=2.0.12
pkgrel=1
pkgdesc="Spell Checker plugin for the Qt Creator IDE (precompiled binary)"
groups=('qt' 'qt5' 'qt6')
arch=('i686' 'x86_64')
url="https://github.com/CJCombrink/SpellChecker-Plugin"
license=('GPL3')
depends=('qtcreator' 'hunspell')
conflicts=('qtcreator-spellchecker-plugin-git')
source=("${url}/releases/download/v${pkgver}/SpellChecker-Plugin_QtC6.0_linux_x64.tar.gz")
sha256sums=('0c3a7100b255df7797b01bae862d2c3d9e2c0ce521ea3196637c8be8dc2db46b')

prepare() {
    tar -xf "SpellChecker-Plugin_QtC6.0_linux_x64.tar.gz"
}

package() {
    install -D "${srcdir}/lib/qtcreator/plugins/libSpellChecker.so" "${pkgdir}/usr/lib/qtcreator/plugins/libSpellChecker.so"
}

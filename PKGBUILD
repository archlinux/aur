# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

pkgname=qtcreator-spellchecker-plugin-bin
pkgver=3.0.0
pkgrel=2
pkgdesc="Spell Checker plugin for the Qt Creator IDE (precompiled binary)"
groups=('qt' 'qt5' 'qt6')
arch=('i686' 'x86_64')
url="https://github.com/CJCombrink/SpellChecker-Plugin"
license=('LGPL3')
depends=('qtcreator' 'hunspell')
conflicts=('qtcreator-spellchecker-plugin-git')
source=("${url}/releases/download/v${pkgver}/SpellChecker-Plugin_QtCv7.0.0_linux_x64.tar.gz")
sha256sums=('4600473a78754d5c81794d5ab81e5af4d9c789c462f2af3692d6e0a6c3eca314')

prepare() {
    tar -xf "SpellChecker-Plugin_QtCv7.0.0_linux_x64.tar.gz"
}

package() {
    install -D "${srcdir}/lib/qtcreator/plugins/libSpellChecker.so" "${pkgdir}/usr/lib/qtcreator/plugins/libSpellChecker.so"
}

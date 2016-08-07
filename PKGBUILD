# Maintainer: Vladislav Glinsky <cl0ne@mithril.org.ua>

pkgname=gtksourceview3-i386asm
pkgver=20160807
pkgrel=1
url="https://wiki.gnome.org/action/show/Projects/GtkSourceView/LanguageDefinitions"
pkgdesc="i386 AT&T syntax assembly language syntax highlight support in gtksourceview3 for gedit 3 and others"
arch=('any')
license=('unknown')
depends=('gtksourceview3')
source=('i386asm.lang::https://wiki.gnome.org/Projects/GtkSourceView/LanguageDefinitions?action=AttachFile&do=get&target=i386asm.lang')
md5sums=('2619840bb9f032fc5faf9caad38077fe')

package() {
    install -Dm644 i386asm.lang "${pkgdir}/usr/share/gtksourceview-3.0/language-specs/i386asm.lang"
}
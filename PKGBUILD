# Maintainer: Siôn Le Roux <sinisterstuf@gmail.com>

pkgname=tomboy-notepreview
pkgver=0.10
pkgrel=1
pkgdesc="A Tomboy plugin to show a tooltip containing a preview when you hold the mouse over a link in a note."
url="http://www.robpvn.net/notepreview/"
depends=('tomboy')
arch=(any)
license=(LGPL)
source=("https://github.com/downloads/robpvn/Tomboy-Note-Preview-Addin/tomboy_notepreviewaddin.zip")
md5sums=('40633eee15cd50794f44f3afb1559e6f')

package() {
    install -Dm644 $srcdir/NotePreviewAddin.dll $pkgdir/usr/lib/tomboy/addins/NotePreviewAddin.dll
}

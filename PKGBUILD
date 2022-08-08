# Contributor: libele <libele@disroot.org>

pkgname=inform7-ide-bin
pkgver=2.0.0.rc2
pkgrel=4
pkgdesc="Inform 7 IDE for the Inform 7 programming language for interactive fiction"
arch=('x86_64')
url="https://github.com/ptomato/inform7-ide"
license=('Artistic2.0' 'GPL3')
provides=('inform7-ide')
conflicts=('inform7-ide')
groups=(inform)
depends=('goocanvas2' 'gtksourceview4' 'webkit2gtk')
install=inform7-ide.install
source=("https://github.com/ptomato/inform7-ide/releases/download/2.0.0-rc2/inform7-ide-2.0.0-1.fc35.x86_64.rpm")
md5sums=('1508bd979dbb2358a5e044173edb347a')
options=(!strip)

package() {
  cd "${srcdir}"
  cp -a usr "${pkgdir}"/
  mv "${pkgdir}/usr/lib64"/* "${pkgdir}/usr/lib/"
  rm -r "${pkgdir}/usr/lib64"
}

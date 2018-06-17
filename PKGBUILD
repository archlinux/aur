# Maintainer: Acidhub <dev@acidhub.click>

pkgname=xcursor-theme-wii
pkgver=0.3.1
pkgrel=1
pkgdesc="Complete port of the 'Wii Cursors' theme by allewun"
arch=('any')
url="https://www.gnome-look.org/content/show.php/Wii+Cursors?content=100367"
license=('GPL')
conflicts=('')
source=('https://dl.opendesktop.org/api/files/downloadfile/id/1460735332/s/5f5dde1d18c509f44e421936bd3a772c/t/1529250171/u//100367-WiiCursors-0.3.1.tar.bz2')
md5sums=('3fa928f448f974bc1bea15e30777bca6')

package() {
  # Create installation directories
  install -d -m755 "${pkgdir}/usr/share/icons/"
  # Install the cursor theme
  cp -rf "WiiCcwCursorTheme" "${pkgdir}/usr/share/icons/"
  cp -rf "WiiCursorTheme" "${pkgdir}/usr/share/icons/"
}

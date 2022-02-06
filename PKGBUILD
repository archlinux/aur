# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Marc Poiroud <marci1 AT archlinux.fr>
# Contributor: Joel Almeida <aullidolunar at gmail dot c0m>
# Contributor: flan_suse <windows2linux AT zoho DOT com>

pkgname=xcursor-arch-simple
_pkgname=xcursor-archcursorblue
pkgver=1.1
pkgrel=2
pkgdesc="Simple blue Arch Linux cursor theme"
arch=('any')
#url="http://xfce-look.org/content/show.php/Arch+Cursor+Theme+%28simple%29?content=135902"
url="http://gnome-look.org/content/show.php/Arch+Cursor+Theme+(simple)?content=135902"
license=('GPL')
conflicts=($_pkgnbame)
#source=("http://xfce-look.org/CONTENT/content-files/135902-ArchCursorTheme.tar.gz")
#source=('http://gnome-look.org/CONTENT/content-files/135902-ArchCursorTheme.tar.gz')
#source=('https://www.gnome-look.org/p/999988/startdownload?file_id=1462316425&file_name=135902-ArchCursorTheme.tar.gz&file_type=application/x-gzip&file_size=47501')
source=('135902-ArchCursorTheme.tar.gz')
md5sums=('ac2c9e3c6ddc46b36793007e6a5eeb48')

build() {
  # Remove unnecessary preview images
  rm -f ArchCursorTheme/preview*.png
}

package() {
  # Create installation directories
  install -d -m755 "${pkgdir}/usr/share/icons/"
  # Install the cursor theme
  cp -rf "ArchCursorTheme" "${pkgdir}/usr/share/icons/"
}


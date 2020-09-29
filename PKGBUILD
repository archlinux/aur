# Maintainer GI Jack <GI_Jack@hackermail.com>

pkgname=gtk-theme-windows-server-2003
pkgver=1.0
pkgrel=2
pkgdesc="GTK theme based on the appearance of Windows Server 2003"
arch=('any')
url="https://github.com/B00merang-Project/Windows-Server-2003"
license=('GPLv3')
optdepends=('gnome-themes-extra: for the GTK3 theme?'
            'gtk-engine-murrine: for the GTK2 theme')
#changelog=${pkgname}.changelog
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/B00merang-Project/Windows-Server-2003/archive/${pkgver}.tar.gz")
sha256sums=('f7bf914465cf512eab6b99c793a2df3230f294b1d3f7fdd875a35c3975bfae6f')

package() {
  cd Windows-Server-2003-$pkgver

  # create theme dir
  install -dm755 "$pkgdir/usr/share/themes/Windows-server-2003"

  # install theme
  find . -type f -exec \
  install -Dm644 '{}' "$pkgdir/usr/share/themes/Windows-server-2003/{}" \;
}

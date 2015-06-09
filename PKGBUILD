# Maintainer: Max Gonzih <iam@gonzih.org>

pkgname=faenza-fresh-icon-theme
pkgver=0.2
pkgrel=3
pkgdesc="FaenzaFresh icon theme"
arch=('i686' 'x86_64')
url="http://gnome-look.org/content/show.php/Faenza+Fresh?content=141003"
license=('GPL')
depends=('faenza-cupertino-icon-theme')
filename='Faenza-Fresh_v0.2.tar.bz2'
source=("http://dl.dropbox.com/u/4109351/soft/faenza-fresh-icon-theme/$filename")
md5sums=('65e3613a7db3808e0635c882519d2942')

build() {
  icons_path="$pkgdir/usr/share/icons"
  mkdir -p "$icons_path"
  tar -xjf "$srcdir/$filename" -C "$icons_path"
}

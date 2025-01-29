# Maintainer:  Thiago Gobatto <tggt@pm.me>
# Contributor: Caldas Lopes <joao.caldas.lopes@gmail.com> 

pkgname=nautilus-mediainfo-gtk4
pkgver=1.0
pkgrel=1
pkgdesc="A Nautilus extension that displays detailed metadata for multimedia files."
arch=('any')
url="https://github.com/thiago-g/$pkgname"
license=('GPL-3.0')
depends=('git' 'python-gobject' 'libnotify' 'nautilus-python' 'libmediainfo' 'python-mediainfodll')
conflicts=(nautilus-mediainfo)
source=("git+${url}")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "$pkgname.py" "$pkgdir/usr/share/nautilus-python/extensions/$pkgname.py"
}

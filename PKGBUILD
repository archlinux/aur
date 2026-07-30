# Maintainer: MatsyaOS <admin@matsyaos.ml>
pkgname=matsya-gtk-themes
pkgver=1.1
pkgrel=1
pkgdesc="MatsyaOS GTK themes"
arch=('any')
url="https://github.com/MatsyaOs/gtk-themes"
license=('GPL')
groups=('Matsya')
source=()
md5sums=('SKIP')

package() {
    mkdir -p "$pkgdir/usr/share/themes"
    cp -a "$startdir"/Matsya* "$pkgdir/usr/share/themes/" 2>/dev/null || true
}

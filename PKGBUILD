# Contributor: twa022 <twa022@gmail.com>

pkgname=audacious-vortigo-themes
pkgver=20080531
pkgrel=1
pkgdesc="Vortigo themes for Audacious"
arch=(any)
url="http://gnome-look.org/content/show.php/Vortigo+++%28+3D%2BVU%2BBeryl%2BDock+%29?content=55440"
license=('GPL')
depends=('audacious' 'unzip')
source=(http://www.chairod.de/2OO8-O5-31/XMMS/Vortigo_1.1.wsz
        http://www.chairod.de/2OO8-O5-31/XMMS/Vortigo-Clear_1.1.wsz
		http://www.chairod.de/2OO8-O5-31/XMMS/Vortigo_2.0.wsz)
sha256sums=('dde567d3b59869c40bf246b2fabf04dc19fc70b7a2bc8e8138d24147f6a28249'
            '396451d82fe05d0861c89d81a1b2231a9ec11be33f6369925ccedcaa7c194401'
            '4c7337784ede9873d3beb5d60f8c3661177e922a9558190ddcb587fcec0a043e')
            
package() {
  cd "$srcdir"
  find . -name "*wsz" -exec install -Dm644 '{}' "$pkgdir"/usr/share/audacious/Skins/'{}' \;
}

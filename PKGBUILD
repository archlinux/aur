# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: pancho horrillo <pancho at pancho dot name>

pkgname=ansible-aur
epoch=1
pkgver=0.10.0
pkgrel=1
pkgdesc="Ansible module to manage packages from the AUR"
arch=(any)
url=https://github.com/kewlfft/ansible-aur
license=(GPL3)
source=("https://github.com/kewlfft/ansible-aur/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('cc998ea38814ae1a50fdf57ae325a8359ac4cff223768d56e41038b5fc45ff9c')

package() {
  cd $pkgname-$pkgver

  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 plugins/modules/aur.py \
    "$pkgdir/usr/share/ansible/plugins/modules/aur.py"
}

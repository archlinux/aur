# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: pancho horrillo <pancho at pancho dot name>

pkgname=ansible-aur
pkgver=0.43
pkgrel=1
pkgdesc="Ansible module to manage packages from the AUR"
arch=(any)
url=https://github.com/kewlfft/ansible-aur
license=(GPL3)
source=("https://github.com/kewlfft/ansible-aur/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('485a3bc3b5e4ef4d42b6f65a9b74754935e64754d535cc6d44e4e11584927263')

package() {
  cd $pkgname-$pkgver

  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 library/aur.py \
    "$pkgdir/usr/share/ansible/plugins/modules/aur.py"
}

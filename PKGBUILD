# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: pancho horrillo <pancho at pancho dot name>

pkgname=ansible-aur
epoch=1
pkgver=0.9.1
pkgrel=1
pkgdesc="Ansible module to manage packages from the AUR"
arch=(any)
url=https://github.com/kewlfft/ansible-aur
license=(GPL3)
source=("https://github.com/kewlfft/ansible-aur/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('29ee274cc2e627b109deefc70984b3fcf617b3d14098cb61069e4b46eba08538')

package() {
  cd $pkgname-$pkgver

  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 plugins/modules/aur.py \
    "$pkgdir/usr/share/ansible/plugins/modules/aur.py"
}

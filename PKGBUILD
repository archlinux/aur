# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: pancho horrillo <pancho at pancho dot name>

pkgname=ansible-aur
epoch=1
pkgver=0.11.1
pkgrel=1
pkgdesc="Ansible module to manage packages from the AUR"
arch=(any)
url=https://github.com/kewlfft/ansible-aur
license=(GPL3)
source=("https://github.com/kewlfft/ansible-aur/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('99e2b07a18881423b6433f4c08ef4caf4906a11fb7fcde67abd211bf10a9ded7')

package() {
  cd $pkgname-$pkgver

  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 plugins/modules/aur.py \
    "$pkgdir/usr/share/ansible/plugins/modules/aur.py"
}

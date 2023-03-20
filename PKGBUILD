# Maintainer: Christian Heusel <christian@heusel.eu>
pkgname=ansible-gopass
_reponame=ansible-lookup-plugin-gopass
pkgver=1.0.0
pkgrel=1
pkgdesc='a ansible plugin to lookup passwords in the gopass password manager'
arch=('any')
url="https://github.com/christian-heusel/$_reponame"
license=('GPL3')
depends=('ansible-core' 'gopass' 'python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('19186193bc731269303c45ec8ffde4c4386f36c8482fb64ae0cf113aee8b5d4f')

package() {
  cd "$_reponame-$pkgver"
  install -D lookup_plugins/gopass.py "$pkgdir"/usr/share/ansible/plugins/lookup/$pkgname/gopass.py
}

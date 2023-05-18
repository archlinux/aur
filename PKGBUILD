# Maintainer: Christian Heusel <christian@heusel.eu>
pkgname=ansible-gopass
_reponame=ansible-lookup-plugin-gopass
pkgver=1.0.1
pkgrel=1
pkgdesc='a ansible plugin to lookup passwords in the gopass password manager'
arch=('any')
url="https://github.com/christian-heusel/$_reponame"
license=('GPL3')
depends=('ansible-core' 'gopass' 'python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1264c21a1697a068e07523bc702c09af3f28ebe92bc5434b9d5cae21b8128c84')

package() {
  cd "$_reponame-$pkgver"
  install -Dm644 lookup_plugins/gopass.py "$pkgdir"/usr/share/ansible/plugins/lookup/$pkgname/gopass.py
}

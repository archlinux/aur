# Maintainer: Brandon Milton <brandon.milton21@gmail.com>
pkgname=download-sweeper
pkgver=1.1
pkgrel=0
pkgdesc="A stale file archive and removal tool"
arch=('any')
url="https://github.com/brandonio21/download-sweeper"
license=('GPL')
depends=('python>=3' 'python-yaml')
source=("https://github.com/brandonio21/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('87b93555a6f6b2bdf62c611c9336466bb3da134f8d95f9fb60048121d52fa4dc')

package() {
	cd "$pkgname-$pkgver"
  install download_sweeper.py usr/bin/
}

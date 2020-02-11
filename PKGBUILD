# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=git-lfs-bin
pkgver=2.10.0
pkgrel=1
pkgdesc="An open source Git extension for versioning large files"
arch=('i686' 'x86_64')
url="https://git-lfs.github.com/"
license=('MIT')
depends=('git')
conflicts=('git-lfs')
provides=('git-lfs')
install=git-lfs.install
_url=https://github.com/github/git-lfs/releases/download/v$pkgver
source_i686=($_url/git-lfs-linux-386-v$pkgver.tar.gz)
source_x86_64=($_url/git-lfs-linux-amd64-v$pkgver.tar.gz)
sha256sums_i686=('8cb943466ab91f3ce8cdc9cf160c32c4a368ea3c69fc6143cde881bb80b667cc')
sha256sums_x86_64=('ec1513069f2679c4c95d9d7c54fdb4b9d7007cc568578a25e2b2ff30edd93cfd')

package() {
  install -Dm755 "$srcdir"/git-lfs "$pkgdir"/usr/bin/git-lfs
}

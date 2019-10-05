# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=git-lfs-bin
pkgver=2.8.0
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
sha256sums_i686=('4ef51eb6ee2f609e4ed3dc0f26baa74798aa7ed5cf9388b71a497b385402100f')
sha256sums_x86_64=('54054178deea7c97ce58edf9c0a2f79eb30c1e836fbc7e6dece9b2c9ff516863')

package() {
  install -Dm755 "$srcdir"/git-lfs "$pkgdir"/usr/bin/git-lfs
}

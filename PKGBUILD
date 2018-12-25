# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=git-lfs-bin
pkgver=2.6.1
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
sha256sums_i686=('4c78f2525c6cdf0130ed2520280f11f60fef33687fdf9ff6489aa0f6b524d9c3')
sha256sums_x86_64=('c098092be413915793214a570cd51ef46089b6f6616b2f78e35ba374de613b5b')

package() {
  install -Dm755 "$srcdir"/git-lfs "$pkgdir"/usr/bin/git-lfs
}

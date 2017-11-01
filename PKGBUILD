# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=git-lfs-bin
pkgver=2.3.4
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
source_i686=($url/git-lfs-linux-386-$pkgver.tar.gz)
source_x86_64=($url/git-lfs-linux-amd64-$pkgver.tar.gz)
md5sums_i686=('eaa8c4e03aaf5b43319142672a472376')
md5sums_x86_64=('3d5cb6b3c5c2ddc6bbbfc68a011ca6fa')

package() {
  cd "$srcdir"/${pkgname%-bin}-$pkgver
  install -Dm755 git-lfs "$pkgdir"/usr/bin/git-lfs
}

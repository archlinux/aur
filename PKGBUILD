# Maintainer: dtluna dtluna@waifu.club
pkgname=pacman-backup-hook
pkgver="1.0.0"
pkgrel=1
pkgdesc="A pacman hook that will save the list of your packages to /etc/pkglist.txt on every install and removal"
arch=('any')
url="https://git.voluntaryism.club/dtluna/pacman-backup-hook"
license=('unknown')
depends=(
    'pacman>=5.1'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('532fcbc1fc4dbb93b8b7e729d53bc5e37c7067eb9f491c31cdafd54b2fa7d56e')

package() {
  cd "$srcdir/$pkgname"
  install -Dm644 pacman-backup.hook $pkgdir/usr/share/libalpm/hooks/pacman-backup.hook
}

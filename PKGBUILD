pkgname=yaknewtab
commit_hash=52192368063cbc676c15006c539367c7375704aa
pkgver=${commit_hash}
pkgrel=2
pkgdesc='A shell script for opening new Yakuake tabs/sessions'
arch=(any)
url='https://github.com/RogueScholar/yaknewtab'
license=(GPL-3.0)

depends=(
    'bash'
)

makedepends=(
    'coreutils'
)

source=(https://github.com/RogueScholar/yaknewtab/archive/${pkgver}.tar.gz)
sha256sums=('298431e08bd9179c082fd7b9b2d81cae41e57f6b6b07fee62a9b6f0b54afcc9d')

provides=(yaknewtab)

package() {
  cd "yaknewtab-${pkgver}"
  install -Dp --mode=755 --owner=root --group=root yaknewtab '#{pkgdir}/usr/local/bin/yaknewtab'
}

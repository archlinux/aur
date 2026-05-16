pkgname=flix-bin
pkgver=2.0.6.111
pkgrel=1
pkgdesc='Flix - 像聊天一样传文件. 跨平台文件传输工具，支持局域网内设备间快速分享文件。'
arch=('x86_64')
url='https://github.com/Tobiichi-Origuchi/flix-bin'
license=('custom:proprietary')
source=(
  "flix-bin-2.0.6.111-1-x86_64.pkg.tar.zst::https://github.com/Tobiichi-Origuchi/flix-bin/releases/download/v2.0.6.111/flix-bin-2.0.6.111-1-x86_64.pkg.tar.zst"
)
sha256sums=(
  '55216f9a39d9262a60807e751dc397a4ded8de498a82e82505d58948566d53f5'
)
noextract=(
  'flix-bin-2.0.6.111-1-x86_64.pkg.tar.zst'
)

package() {
  bsdtar --exclude='.PKGINFO' --exclude='.BUILDINFO' --exclude='.MTREE' --exclude='.INSTALL' -xpf "$srcdir/flix-bin-2.0.6.111-1-x86_64.pkg.tar.zst" -C "$pkgdir"
}

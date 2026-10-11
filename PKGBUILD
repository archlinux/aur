# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=ccstatus-bin
_pkgname=ccstatus
pkgver=0.3.1
pkgrel=1
pkgdesc="Customizable status line formatter for Claude Code CLI (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/moond4rk/ccstatus"
license=('Apache-2.0')
optdepends=('git: git branch, changes and worktree widgets')
provides=('ccstatus')
conflicts=('ccstatus')
options=('!strip' '!debug')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/moond4rk/$_pkgname/releases/download/v$pkgver/${_pkgname}_linux_x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/moond4rk/$_pkgname/releases/download/v$pkgver/${_pkgname}_linux_arm64.tar.gz")
sha256sums_x86_64=('5750668f71c56de3ea11a0af9c1509cba1c1cc12de730092833ae3bf8076f446')
sha256sums_aarch64=('abae63c956431e0823cfb2633ef8dfa29c16a528130ae6caa3fcc424342d7cb8')

package() {
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

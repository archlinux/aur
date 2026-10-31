# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=ccstatus-bin
_pkgname=ccstatus
pkgver=0.4.0
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
sha256sums_x86_64=('27c497005b667705c03bc7a085629a56e1dcbded2b4153ae2688e6b17df8571b')
sha256sums_aarch64=('624fbf754e6fda93fb9594cc7de10b3f08f357526a28a3ad7e1790021cd6d46f')

package() {
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=ccstatus-bin
_pkgname=ccstatus
pkgver=0.6.0
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
sha256sums_x86_64=('8646e459d8fd3814474b08ad5a1bd5b96b6544fdaf2004d975e777262d40f878')
sha256sums_aarch64=('b0efc29ac986e48a6b95d704eb28aa8ba2c124ab74e13acb88792b027be2f4f4')

package() {
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

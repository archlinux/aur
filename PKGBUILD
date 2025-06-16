# Maintainer: Daniele Basso <d dot bass05 at proton dot me>
# PKGBUILD_native_modules is broken
pkgname=code-electron-latest
pkgver=1.101.0
pkgrel=0
pkgdesc='Run Code - OSS on latest stable Electron (no native modules)'
arch=("any")
url=https://github.com/microsoft/vscode
license=('MIT')
depends=(code electron)
source=('https://gitlab.archlinux.org/archlinux/packaging/packages/code/-/raw/main/code.sh')
sha256sums=('5da1525b5fe804b9192c05e1cbf8d751d852e3717fb2787c7ffe98fd5d93e8c1')

package() {
  install -Dvm755 code.sh "${pkgdir}"/usr/bin/$pkgname
  #todo: sed desktop entries, alias shell completions
}

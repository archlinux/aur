# Maintainer: soymadip_1
pkgname=git-credential-keepassxc-bin
pkgver=0.14.1
pkgrel=1
pkgdesc="Helper that allows Git (and shell scripts) to use KeePassXC as credential store (prebuilt binary)"
arch=('x86_64')
url="https://github.com/Frederick888/git-credential-keepassxc"
license=('GPL3')
sha256sums=('SKIP')

provides=('git-credential-keepassxc')
conflicts=('git-credential-keepassxc')

depends=(
  'glibc'
  'gcc-libs'
)
source=("git-credential-keepassxc-${pkgver}.zip::https://github.com/Frederick888/git-credential-keepassxc/releases/download/v${pkgver}/ubuntu-latest-full.zip")

package() {
  cd "$srcdir"

  install -Dm755 git-credential-keepassxc \
    "$pkgdir/usr/bin/git-credential-keepassxc"
}

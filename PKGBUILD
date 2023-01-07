# Maintainer: moyiz <8603313+moyiz@users.noreply.github.com>
pkgname=wander-bin
pkgver=0.8.2
pkgrel=1
pkgdesc="An efficient terminal application/TUI for your HashiCorp Nomad cluster."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/robinovitch61/wander"
license=('MIT')
depends=('glibc')
provides=('wander')

source_i686=("https://github.com/robinovitch61/wander/releases/download/v${pkgver}/wander_${pkgver}_Linux_i386.tar.gz")
source_x86_64=("https://github.com/robinovitch61/wander/releases/download/v${pkgver}/wander_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("https://github.com/robinovitch61/wander/releases/download/v${pkgver}/wander_${pkgver}_Linux_arm64.tar.gz")
sha256sums_i686=('b4c367b7694674ba943d587bcf5b81b224fa73bcb533d978176fcf33bb3a2515')
sha256sums_x86_64=('95c20de45d6dd7c3f1f9636e095a0d31277e98ead821fb5dcd398e054267f057')
sha256sums_aarch64=('3fc3c9b1f8a3e8e629eeb07c3516b292222971811d234812b27a65cc1fc18ea9')

package() {
    cd $srcdir
    install -Dm755 wander $pkgdir/usr/bin/wander
}

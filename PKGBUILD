# Maintainer: moyiz <8603313+moyiz@users.noreply.github.com>
pkgname=wander-bin
pkgver=0.9.0
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
sha256sums_i686=('ac0e23b90b981aa45bc8b21165a2e866f905d92f29a39ea75d702b74e6012db43')
sha256sums_x86_64=('aea08e51b85b68a2a899b689f0e8d70cc8b0b54fe3883bd99c768894a7359dc8')
sha256sums_aarch64=('eec70ccd45ca1a278ed420ee476a86002406812c6a95a32180ac8fa4751a73dd')

package() {
    cd $srcdir
    install -Dm755 wander $pkgdir/usr/bin/wander
}

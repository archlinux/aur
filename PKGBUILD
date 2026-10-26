# Maintainer: Cleboost <clement.balarot@gmail.com>
# Contributor: missing-aur project <https://github.com/Cleboost/missing-aur>

pkgname=temper-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Stupidly fast open-source Minecraft server, written in Rust (precompiled binary)"
url="https://github.com/temper-mc/temper"
arch=("x86_64" "aarch64")
provides=("temper")
conflicts=("temper" "temper-git")
options=("!strip")
license=("GPL3")

source_x86_64=("temper-bin-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/temper-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("temper-bin-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/temper-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('006d1f9dd15a940c312d8b427c64c19e3695935609daa34bbbf0127c04ef8af7')
sha256sums_aarch64=('2b1d18762b209af64cc335698b567276a2143ffd022668847f087e684b8e874b')

package() {
  install -Dm755 "${srcdir}/temper" "${pkgdir}/usr/bin/temper"
}


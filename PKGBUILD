# Maintainer: czyt <czytcn@gmail.com>
pkgname=herdr-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="Supervise multiple coding agents in one terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/ogulcancelik/herdr"
license=('AGPL-3.0')
provides=('herdr')
conflicts=('herdr')
source_x86_64=("herdr-${pkgver}-x86_64::https://github.com/ogulcancelik/herdr/releases/download/v${pkgver}/herdr-linux-x86_64")
source_aarch64=("herdr-${pkgver}-aarch64::https://github.com/ogulcancelik/herdr/releases/download/v${pkgver}/herdr-linux-aarch64")
sha256sums_x86_64=('81ab706249875db345729df6437d72615d0f6909e8358c36803bcf3df13aba9e')
sha256sums_aarch64=('08e41334368170ada85d06300f7149831ffb56c08f07dcf49c823fbf22ac00a3')

package() {
    install -Dm755 herdr-${pkgver}-${CARCH} "${pkgdir}/usr/bin/herdr"
}

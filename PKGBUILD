# Maintainer: Wei Zixi <wellsgz@hotmail.com>
# Maintainer: Ivan Tiukov <ivan@tiukov.com>

pkgname=remotixqc
pkgver=1.0
pkgrel=24671
pkgdesc="Remotix QC is a tiny portable application with zero configuration. Run it on a computer that you want to observe or control remotely."
arch=('x86_64')
url="https://remotixcloud.com"
license=('custom:freeware')
depends=('qt5-base' 'wayland' 'libx11')

#source_x86_64=(https://eu.downloads.remotix.com/agent-linux/remotixagent-${pkgver}-${pkgrel}.x86_64.deb)
source_x86_64=(https://dl.acronis.com/u/acpc/AcronisCyberProtectConnectAgent-${pkgver}-${pkgrel}.x86_64.deb)

sha256sums_x86_64=('7f0082f614da9cbb6d0e3aabc3f1454c23defc1c425f80e0d6593bd4ec998668')

package() {
    cd "${pkgdir}"
    tar -xpJf "${srcdir}/data.tar.xz"
    printf '%s\n' " ============================================================================="
    printf '%s\n' " -> Please enable and start 'acroniscpcagent.service' service before start application..."
    printf '%s\n' " ============================================================================="
}

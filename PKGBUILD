# Maintainer: Wei Zixi <wellsgz@hotmail.com>
# Maintainer: Ivan Tiukov <ivan@tiukov.com>

pkgname=remotixqc
pkgver=1.0
pkgrel=24704
pkgdesc="Remotix QC is a tiny portable application with zero configuration. Run it on a computer that you want to observe or control remotely."
arch=('x86_64')
url="https://remotixcloud.com"
license=('custom:freeware')
depends=('qt5-base' 'wayland' 'libx11')

#source_x86_64=(https://eu.downloads.remotix.com/agent-linux/remotixagent-${pkgver}-${pkgrel}.x86_64.deb)
source_x86_64=(https://dl.acronis.com/u/acpc/AcronisCyberProtectConnect-${pkgver}-${pkgrel}-x86_64.deb)

sha256sums_x86_64=('01329b5b5035bc9d4dc9ae72db7c6275b6c2a75c3a6a0cfd795a2d34939653c2')

package() {
    cd "${pkgdir}"
    tar -xpJf "${srcdir}/data.tar.xz"
    printf '%s\n' " ============================================================================="
    printf '%s\n' " -> Please enable and start 'remotixagent' service before start application..."
    printf '%s\n' " ============================================================================="
}

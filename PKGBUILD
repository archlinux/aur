# Maintainer: Ivan Tiukov <ivan@tiukov.com>

pkgname=remotixqc
pkgver=1.4
pkgrel=331
pkgdesc="Remotix QC is a tiny portable application with zero configuration. Run it on a computer that you want to observe or control remotely."
arch=('x86_64')
url="https://remotixcloud.com"
license=('custom:freeware')
depends=('qt5-base' 'wayland' 'libx11')

source_x86_64=(https://eu.downloads.remotix.com/agent-linux/remotixagent-${pkgver}-${pkgrel}.x86_64.deb)

sha256sums_x86_64=('e7a2925cb98dbe17177fa8151f9cb8b4f9488ccfab4e1628899e8bf14a8eb8c8')

package() {
    cd "${pkgdir}"
    tar -xpJf "${srcdir}/data.tar.xz"
}

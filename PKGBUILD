# Maintainer: Ivan Tiukov <ivan(at)tiukov(dot)com>

pkgname=remotixqc
pkgver=1.2.15
pkgrel=312
pkgdesc="Remotix QC is a tiny portable application with zero configuration. Run it on a computer that you want to observe or control remotely."
arch=('x86_64')
url="https://remotixcloud.com"
license=('custom:Freeware')
depends=('qt5-base' 'wayland' 'libx11')

source_x86_64=(https://downloads.remotixcloud.com/qc-linux/${pkgname}-${pkgver}-${pkgrel}.x86_64.deb)

sha256sums_x86_64=('f3021ea6f26c393a7d208789c2c086810b7e202bbd2523ba1c75e4e679b9c69f')

package() {
    cd "${pkgdir}"
    tar -xpJf "${srcdir}/data.tar.xz"
}

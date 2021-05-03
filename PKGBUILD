# Maintainer: Marc Vidal <mvidaldp@gmail.com>

pkgname=adguardhome-bin
_pkgname=AdGuardHome
pkgver=0.106.1
_pkgver="v${pkgver}"
pkgrel=1
pkgdesc='Network-wide ads and trackers blocking DNS server (binary version).'
arch=('i686' 'x86_64' 'aarch64' 'armv5h' 'armv6h' 'armv7h')
url='https://github.com/AdguardTeam/AdGuardHome'
license=('GPL')
provides=($pkgname)
conflicts=('adguardhome')
install=adguardhome-bin.install
_releaseurl="${url}/releases/download/${_pkgver}"

source_i686=("${_pkgname}-${pkgver}.tar.gz::${_releaseurl}/${_pkgname}_linux_386.tar.gz")
source_x86_64=("${_pkgname}-${pkgver}.tar.gz::${_releaseurl}/${_pkgname}_linux_amd64.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}.tar.gz::${_releaseurl}/${_pkgname}_linux_arm64.tar.gz")
source_armv5h=("${_pkgname}-${pkgver}.tar.gz::${_releaseurl}/${_pkgname}_linux_armv5.tar.gz")
source_armv6h=("${_pkgname}-${pkgver}.tar.gz::${_releaseurl}/${_pkgname}_linux_armv6.tar.gz")
source_armv7h=("${_pkgname}-${pkgver}.tar.gz::${_releaseurl}/${_pkgname}_linux_armv7.tar.gz")

sha256sums_i686=('0888f3021123190760021a9ab4ad6fabdc5e9e785053cb295552ec497e62de2a')
sha256sums_x86_64=('8bbf034cff50f4cd3119db6707a879c5c87f3fb79c1ef9754c02ff963b215486')
sha256sums_aarch64=('f5c9e78bb664b3ef8714e98f6c0a270f662c005f3bfd3c04ac67e972a151b17a')
sha256sums_armv5h=('f399d6f662c5f4c50e2570248b4ae6abdbf88b6b8b440ea4206643fd229fd767')
sha256sums_armv6h=('0aaf7f7b280995bedfb1be7edcb1e408de76ac5250d7d48da99a6f14ad8a76b1')
sha256sums_armv7h=('ed14cb54ae50f0435c8853198df31218d1b4e458f1fb7a11a44460146db7de90')


package() {
    install -D -m755 "${_pkgname}/${_pkgname}" "${pkgdir}/var/lib/adguardhome/${_pkgname}"
}
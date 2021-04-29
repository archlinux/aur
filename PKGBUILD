# Maintainer: Marc Vidal <mvidaldp@gmail.com>

pkgname=adguardhome-bin
_pkgname=AdGuardHome
pkgver=0.106.0
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

sha256sums_i686=('031885347de54e29c9ae1911a9ad43c5beba48b68e3af114e7f9dc220d2b6566')
sha256sums_x86_64=('e09144ac735b60cdfd93ec56334bf14fbe41f0d6fc3751e0c238c5d177007792')
sha256sums_aarch64=('c01f26135951a47d1a8768140661ca563cfe24a9e39b304c9bf8e9acf6d676fe')
sha256sums_armv5h=('fe8283948321ba0180b5f5d6fb984981b73fffe324d111eccc3955d5d037c8d0')
sha256sums_armv6h=('5bb03bb205ba393f7e54d32ad5b816f74e6a0a3638b69d92f672a9a7dc835cd5')
sha256sums_armv7h=('87d1c188c11023c25932bb8b9872a560527dfda0fcb9bb56928dcec0c1b776a0')


package() {
    install -D -m755 "${_pkgname}/${_pkgname}" "${pkgdir}/var/lib/adguardhome/${_pkgname}"
}
# Maintainer: Marc Vidal <mvidaldp@gmail.com>

pkgname=adguardhome-bin
_pkgname=AdGuardHome
pkgver=0.105.2
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

sha256sums_i686=('62bd99ef3e02cf8f50fa3a4c5f680d3c8ccff7124c7597e073b0ca3f601058af')
sha256sums_x86_64=('8b89b9e2d1483f3830adb4b5166db47c733d10fb288c57003c5eb7f899c7eabe')
sha256sums_aarch64=('4f3ecccc4cd3042efcd648425a58b29c1fa2c0910dfc8cd17acdb0fab3031d7b')
sha256sums_armv5h=('d5cb77590d4b1a12747c0203b59a5d6176f41cc3feec7a35d51aaf044f4881f9')
sha256sums_armv6h=('98a1f09b44ac1011b6b9f015d2b04787603b4e875a1cf1dd1823b93bb53c34ce')
sha256sums_armv7h=('92347fecc69c38fe58cd96fe2d9565ca92ef03f947c223ee938ae44c5ed5fdb8')


package() {
    install -D -m755 "${_pkgname}/${_pkgname}" "${pkgdir}/var/lib/adguardhome/${_pkgname}"
}
# Maintainer: kuba09 <kuba09 at pm dot me>
pkgname=sampctl-bin
_pkgname=sampctl
pkgver=1.11.3
pkgrel=1
pkgdesc="Collection of tools for SA-MP developers"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/Southclaws/sampctl"
license=('GPL3')
provides=('sampctl')

sha512sums_i686=('3a8edbd2a807f978505b5d282b5567bdd6f958ac60206fdd1c5103da1254fa2d19b7efae04d4a6fdb6fb6b87c58541e02435d241983bfc6cf3972315acb4d884')
sha512sums_x86_64=('4471dfcc3ccfcf5193be9abfd20d58537df84270e290c2e745db9235f02471d54341b7da5facb144828aad822631a4c8abe04366394b0ce4316aecb94411bd05')
sha512sums_aarch64=('9aff523e4b5147759bd0b5ae914d711ca973579d8b54742c0814231d0524f76daa1632e0ad5a160b850a23a208e368b903c13320f9b2962e6f7d9e96dcf7c7e7')

source_i686=("https://github.com/Southclaws/${_pkgname}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_386.deb")
source_x86_64=("https://github.com/Southclaws/${_pkgname}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_amd64.deb")
source_aarch64=("https://github.com/Southclaws/${_pkgname}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_arm64.deb")

package() {
  tar -xzf data.tar.gz -C "${srcdir}"

  install -Dm 755 "${srcdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

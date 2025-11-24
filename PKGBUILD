# Maintainer: Hao Long <aur@esd.cc>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>

pkgname=subfinder-bin
_pkgname=${pkgname%-bin}
pkgver=2.10.1
pkgrel=1
pkgdesc="A subdomain discovery tool that discovers valid subdomains for websites"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/projectdiscovery/subfinder"
license=("MIT")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc')
source=("LICENSE.md::https://github.com/projectdiscovery/subfinder/raw/v${pkgver}/LICENSE.md")
source_i686=("${_pkgname}-${pkgver}-i686.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.zip")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm.zip")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip")
b2sums=('c699be7ccfc40564b59bfa217e254c9553678f343466becebad5017d81310d7b7519837a9a25df2e09e16b6e1bd5a209d7aeb039662a206dd8966b9697c02ede')
b2sums_i686=('28e382dc4d4b2ca49cf838e52d55e0d67103a984249e1bb159716a3e3a2cf44f5b9f7e66f5a4c0e26de2125f8e0d12dd42d344b0f1e338a6b7d0122880ac85a3')
b2sums_x86_64=('ed9d1ad22dbe9ef07bbdd1a842cb1f5709a72384660e6d47dbc09135b38cece95958327bc9aca6386f414f924effddab75b92a99e95259f9730492ca6975bc09')
b2sums_armv7h=('688166faa2ce27ce79c8a09cde28024dd9c2b0aa486d4d5ef4f78831f72c93c96dadd3eef1c255e37dcea214aa926648dad6f0b0c39160731b5bffc09b1ed80d')
b2sums_aarch64=('ee844619ce5dafb45632a5bc2e59e6c75ba7facf04d6e1c72048fb384dea3213f07cd299b7792d70e56152f93276e35119723d318c31b4ddec050467799a8146')

package() {
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
  install -Dm755 subfinder ${pkgdir}/usr/bin/subfinder
}

# vim: ts=2 sw=2 et:

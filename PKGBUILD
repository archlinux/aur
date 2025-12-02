# Maintainer: kuba09 <kuba09 at pm dot me>
pkgname=sampctl-bin
_pkgname=sampctl
pkgver=1.12.0
pkgrel=1
pkgdesc="Collection of tools for SA-MP developers"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/Southclaws/sampctl"
license=('GPL3')
provides=('sampctl')

sha512sums_i686=('705c57dbe6053053625248c916f8fb9ef651fda8072a170af970e84c5851498b5a3af7c383158f582879b87b0f520d6fa3bf43560ce8393b5bf47cc84d93c13b')
sha512sums_x86_64=('1d7e130201a2db4730102874b09d1f423667860dea539719ada9c4014b0878610f583fd840ca824510d73bfca72f722c5ba6a471debaad0a8e4098e336f79f15')
sha512sums_aarch64=('52ddf589f8cdb7645ed63d6351d5c81e9076e1e65107572b9bf24812f09b831ab29df0028bd015c491208fd2fef08b434603d44c982cd8e9fa4da9c5a4c0cf98')

source_i686=("https://github.com/Southclaws/${_pkgname}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_386.deb")
source_x86_64=("https://github.com/Southclaws/${_pkgname}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_amd64.deb")
source_aarch64=("https://github.com/Southclaws/${_pkgname}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_arm64.deb")

package() {
  tar -xzf data.tar.gz -C "${srcdir}"

  install -Dm 755 "${srcdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

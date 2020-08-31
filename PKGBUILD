# Maintainer: kuba09 <kuba09 at pm dot me>
pkgname=sampctl-bin
_pkgname=sampctl
pkgver=1.9.1
pkgrel=1
pkgdesc="Collection of tools for SA-MP developers"
arch=('i686' 'x86_64')
url="https://github.com/Southclaws/sampctl"
license=('GPL3')
provides=('sampctl')

sha512sums_i686=('3d679201afcf3306e6f047cb305d34213714f9c1628a27dda4a8ca492dbd2c32d943f1f8bd1d399957613382aaaabc1c4b30e98cca775a6a7cdaca4389f72dd9')
sha512sums_x86_64=('52b5be8aa16407c921486543129e947d57d79df698cfb1e589fb8fcb9e9d968a602bb49f6d7116adc2669c47d3503ae26f78720e96a6b2533e43e44248b88e15')

source_i686=("https://github.com/Southclaws/${_pkgname}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_386.deb")
source_x86_64=("https://github.com/Southclaws/${_pkgname}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_amd64.deb")

package() {
  tar -xzf data.tar.gz -C "${pkgdir}"

  install -Dm755 "${pkgdir}/usr/local/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

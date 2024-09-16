# Maintainer: kuba09 <kuba09 at pm dot me>
pkgname=sampctl-bin
_pkgname=sampctl
pkgver=1.11.3
pkgrel=2
pkgdesc="Collection of tools for SA-MP developers"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/Southclaws/sampctl"
license=('GPL3')
provides=('sampctl')

sha512sums_i686=('41882d4cfc6ba7a0b98b41de47c46ba518ae5973a6ea6ee4710792c033deb82d22445ed5ca068e222831ad9954a6f83de63e46d72eead1eef1f79f363f5a80df')
sha512sums_x86_64=('794216b2d9958349bb9873990df8d3e0b24ab6ad744c32d442072118a33e54e85fccac96f546907c318d05ba0ee4fca2ebeb079481429bea3e98bd3e8c1172df')
sha512sums_aarch64=('cbba86855d4bdb3d1df97619eb43241244483aa479f870cd5cfbb71080bd1af6b2e8f80fe3e4efaeb892bfdedae13b642c029af932c933ed791ed97b79be5796')

source_i686=("https://github.com/Southclaws/${_pkgname}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_386.deb")
source_x86_64=("https://github.com/Southclaws/${_pkgname}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_amd64.deb")
source_aarch64=("https://github.com/Southclaws/${_pkgname}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_arm64.deb")

package() {
  tar -xzf data.tar.gz -C "${srcdir}"

  install -Dm 755 "${srcdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

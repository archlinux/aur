# Maintainer: MrVantage <8395675-mrvantage at users.noreply.gitlab.com>
_pkgname=wallpaper-binge
pkgname="$_pkgname-bin"
pkgver=1.0.5
pkgrel=1
pkgdesc="wallpaper-binge is a small utility that fetches the image for 'Today on Bing'"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://gitlab.com/mrvantage/wallpaper-binge"
license=('Apache')
depends=()
optdepends=(
  'sudo: privilege elevation'
  'doas: privilege elevation'
)
provides=('wallpaper-binge')
conflicts=('wallpaper-binge')

source_x86_64=("${_pkgname}_v${pkgver}_linux_amd64.tgz::https://gitlab.com/api/v4/projects/51218294/packages/generic/linux_amd64/v${pkgver}/${_pkgname}_linux_amd64.tgz")
source_aarch64=("${_pkgname}_v${pkgver}_linux_arm64.tgz::https://gitlab.com/api/v4/projects/51218294/packages/generic/linux_arm64/v${pkgver}/${_pkgname}_linux_arm64.tgz")
source_armv7h=("${_pkgname}_v${pkgver}_linux_arm.tgz::https://gitlab.com/api/v4/projects/51218294/packages/generic/linux_arm/v${pkgver}/${_pkgname}_linux_arm.tgz")

sha256sums_x86_64=('b3ff1fe7e0b86f6ab94512ccb01603cb9e86281237194ce5521c784afb6961bd')
sha256sums_aarch64=('0f050636b51d56c9f814de18862bbe41ab8738bf62959a63033a181150bfd6e2')
sha256sums_armv7h=('e6fe99733c94518a2a00def3e01979eac9663106526b1b33bbac7759bc040da9')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

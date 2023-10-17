# Maintainer: MrVantage <8395675-mrvantage at users.noreply.gitlab.com>
_pkgname=wallpaper-binge
pkgname="$_pkgname-bin"
pkgver=1.0.2
pkgrel=1
pkgdesc="wallpaper-binge is a small utility that fetches the image for 'Today on Bing'"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://gitlab.com/mrvantage/wallpaper-binge"
license=('Apache 2.0')
depends=()
optdepends=(
  'sudo: privilege elevation'
  'doas: privilege elevation'
)
provides=('wallpaper-binge')
conflicts=('wallpaper-binge')

source_x86_64=("https://gitlab.com/api/v4/projects/51218294/packages/generic/linux_amd64/${pkgver}/${_pkgname}_linux_amd64.tgz")
source_aarch64=("https://gitlab.com/api/v4/projects/51218294/packages/generic/linux_arm64/${pkgver}/${_pkgname}_linux_arm64.tgz")
source_armv7h=("https://gitlab.com/api/v4/projects/51218294/packages/generic/linux_arm64/${pkgver}/${_pkgname}_linux_arm.tgz")

sha256sums_x86_64=('6dd965cdba9a998c3302ba043f48c56de3d8faba9889b2b7bc63208c5c6010fb')

sha256sums_aarch64=('c22d8565fbaf0ac74cb4d2d67839d08c3830353e25d1999b70eaf6929e594e3e')
sha256sums_armv7h=('a9753e1a7ef01e670d2fc40b3ab71bbd42a491c36b0fe7d8da3fea385173b739')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

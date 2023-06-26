# Contributor: MidAutumnMoon <mid.autumn0moon@gmail.com>

pkgname=assh-bin
_pkgname=${pkgname/-bin}
pkgver=2.15.0
pkgrel=1
pkgdesc="make your ssh client smarter"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/moul/assh"
license=( 'MIT' )
provides=( 'assh' )
source_x86_64=( https://github.com/moul/assh/releases/download/v${pkgver}/assh_${pkgver}_linux_amd64.tar.gz )
source_i686=( https://github.com/moul/assh/releases/download/v${pkgver}/assh_${pkgver}_linux_386.tar.gz )
source_aarch64=( https://github.com/moul/assh/releases/download/v${pkgver}/assh_${pkgver}_linux_arm64.tar.gz )
sha256sums_x86_64=('5140cc08768c019bfc5a6432d619b6f7bb234994243fd951a6d84b6b3229c8a0')
sha256sums_i686=('7da1c977142450860f429a4edc84de94fd90677fa3068731fb5e29a86afba9d7')
sha256sums_aarch64=('2cac9a3120c34282565196862cba00951da5bca24f723368b833bcb895928322')

package() {
  install -Dm755 "${srcdir}/assh" "${pkgdir}/usr/bin/assh"
}

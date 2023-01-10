# Maintainer: noobping <hello@noobping.dev>

pkgname=alpine-chroot-install
pkgver=0.14.0
pkgrel=1
pkgdesc="Install Alpine Linux in chroot with a breeze"
arch=(any)
url="https://github.com/alpinelinux/${pkgname}"
license=('GPL2')
depends=('coreutils' 'sh')
optdepends=(
  'qemu-user: for emulation of different architecture'
  'qemu-user-binfmt-provider: for emulation of different architecture'
)
source=("https://raw.githubusercontent.com/alpinelinux/${pkgname}/v${pkgver}/${pkgname}")
sha1sums=('ccbf65f85cdc351851f8ad025bb3e65bae4d5b06')

package() {
  install -Dm755 ${srcdir}/${pkgname} -t ${pkgdir}/usr/bin
}

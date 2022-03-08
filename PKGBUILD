# Maintainer: Ehsan Ghorbannezad <ehsan at disroot dot org>
_pkgname=tailscale
pkgname=$_pkgname-runit
pkgver=r1
pkgrel=1
pkgdesc="runit service scripts for $_pkgname"
url=https://gitea.artixlinux.org/packagesT/tailscale
arch=(any)
license=(BSD)
depends=(runit $_pkgname)
source=(tailscaled.run)
sha256sums=('70d7d12e07ac3654e9f90deb5d1ec2b15b11d6919736714f26eb96fd96e965ae')

package() {
    install -Dm755 tailscaled.run "$pkgdir/etc/runit/sv/tailscaled/run"
}

# Maintainer: Ehsan Ghorbannezad <ehsan at disroot dot org>
_pkgname=tailscale
pkgname=$_pkgname-runit
pkgver=r2
pkgrel=1
pkgdesc="runit service scripts for $_pkgname"
url=https://gitea.artixlinux.org/packagesT/tailscale
arch=(any)
license=(BSD)
depends=(runit $_pkgname)
source=(tailscaled.run)
sha256sums=('23f76dff9c581431cec4879ab3cb7ec9b4ff784960c569b74df368da6d660842')

package() {
    install -Dm755 tailscaled.run "$pkgdir/etc/runit/sv/tailscaled/run"
}

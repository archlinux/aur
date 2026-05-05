# Maintainer: ctech12 <https://aur.archlinux.org/account/ctech12>
pkgname=warp-svc-openrc
pkgver=1.0.0
pkgrel=1
pkgdesc="OpenRC service script for Cloudflare WARP (cloudflare-warp-bin)"
arch=('any')
url="https://aur.archlinux.org/packages/warp-svc-openrc"
license=('MIT')
depends=('openrc' 'cloudflare-warp-bin')
source=("warp-svc")
sha256sums=('29e1282c98fd6b2c2eca664eb866907933b8dec741a83745a56c6c7cefe66a1c')

package() {
    install -Dm755 "${srcdir}/warp-svc" "${pkgdir}/etc/init.d/warp-svc"
}
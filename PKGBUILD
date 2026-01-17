# Maintainer: Naimish Pandey <naimish@naimish.xyz>
pkgname=warp-svc-runit
pkgver=1.0.0
pkgrel=1
pkgdesc="runit service for Cloudflare WARP daemon (warp-svc)"
arch=('any')
url="https://github.com/TheRogueVigilante/warp-svc-runit"
license=('GPL')
depends=('runit' 'cloudflare-warp-bin')
conflicts=()
provides=()

source=(
  "run"
)
sha256sums=(
  "5f175c8e91c603e001966dd7c40867997e540c913b2bb00fe0f506b9fd62b634"
)

package() {
  install -d "$pkgdir/etc/runit/sv/warp-svc"
  install -m755 "$srcdir/run" "$pkgdir/etc/runit/sv/warp-svc/run"
}

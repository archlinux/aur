# Maintainer: Martin Wimpress <code@wimpress.io>
pkgname=stream-sprout
pkgver=0.1.7
pkgrel=1
pkgdesc="Restream a video source to multiple destinations such as Twitch, YouTube, Owncast, and PeerTube."
arch=('any')
url="https://stream-sprout.wimpys.world/"
license=('Apache-2.0')
depends=('bash' 'coreutils' 'ffmpeg' 'gawk' 'grep' 'sed')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wimpysworld/stream-sprout/archive/refs/tags/v0.1.7.tar.gz")
sha256sums=("d2e9f9ff90ed0f733eba987a41ba83b0a52237036ee913f5e9b1210c9e5b67d9")

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm0755 stream-sprout "${pkgdir}/usr/bin/stream-sprout"
  install -Dm0644 stream-sprout.yaml.example "${pkgdir}/usr/share/doc/${pkgname}/stream-sprout.yaml.example"
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

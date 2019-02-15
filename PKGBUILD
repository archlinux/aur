pkgname=firefox-extension-video-download-helper
pkgver=7.3.5
pkgrel=2
pkgdesc='The easy way to download and convert Web videos from hundreds of YouTube-like sites.'
arch=('any')
url='https://www.downloadhelper.net'
license=('custom:proprietary')
depends=('firefox')
optdepends=('firefox-extension-video-download-helper-companion-app: companion app, see https://www.downloadhelper.net/install-coapp')
source=("extension.xpi::https://addons.mozilla.org/firefox/downloads/file/1031851/video_downloadhelper-${pkgver}-an+fx.xpi")
noextract=("extension.xpi")
sha256sums=('d7031e6f5db343fcd625d50e93fafe4f0d017ae7a0a88316893fc85bb0930dec')

package() {
  install -Dm644 extension.xpi "${pkgdir}/usr/lib/firefox/browser/extensions/{b9db16a4-6edc-47ec-a1f4-b86292ed211d}.xpi"
}

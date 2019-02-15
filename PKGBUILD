pkgname=firefox-extension-video-download-helper
_file=1031851
pkgver=7.3.5
pkgrel=1
pkgdesc='The easy way to download and convert Web videos from hundreds of YouTube-like sites.'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/video-downloadhelper'
license=('custom:proprietary')
depends=('firefox')
optdepends=('firefox-extension-video-download-helper-companion-app: companion app, compiled from sources (see https://www.downloadhelper.net/install-coapp)'
            'firefox-extension-video-download-helper-companion-app-bin: companion app, using binary artifacts (see https://www.downloadhelper.net/install-coapp)')
source=("extension.xpi::https://addons.mozilla.org/firefox/downloads/file/${_file}/video_downloadhelper-${pkgver}-an+fx.xpi")
noextract=("extension.xpi")
sha256sums=('d7031e6f5db343fcd625d50e93fafe4f0d017ae7a0a88316893fc85bb0930dec')

package() {
  install -Dm644 extension.xpi "${pkgdir}/usr/lib/firefox/browser/extensions/{b9db16a4-6edc-47ec-a1f4-b86292ed211d}.xpi"
}

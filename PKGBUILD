pkgname=firefox-extension-video-download-helper
pkgver=7.3.6
pkgrel=1
pkgdesc='The easy way to download and convert Web videos from hundreds of YouTube-like sites.'
arch=('any')
url='https://www.downloadhelper.net'
license=('custom:proprietary')
depends=('firefox')
groups=('firefox-addons')
optdepends=('vdhcoapp: companion app, see https://www.downloadhelper.net/install-coapp'
            'vdhcoapp-bin: companion app (binary version)')
source=("extension.xpi::https://addons.mozilla.org/firefox/downloads/file/1031851/video_downloadhelper-${pkgver}-an+fx.xpi")
noextract=("extension.xpi")
sha512sums=('73c05acc8489acbb643208234b9504b7fc4762ca14e7e6a737300f83987edb5dad20d8274ba8fa451fd379fc52fd44a1bb0092ce7da3f421a6df6557b9477a36')

package() {
  install -Dm644 extension.xpi "${pkgdir}/usr/lib/firefox/browser/extensions/{b9db16a4-6edc-47ec-a1f4-b86292ed211d}.xpi"
}

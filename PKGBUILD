pkgname=firefox-esr-extension-download-with-aria2
pkgver=4.6.5.2382
pkgrel=1
pkgdesc='The Aria2 Download Manager for Firefox.'
arch=('any')
url='https://github.com/jc3213/download_with_aria2'
license=('LGPL-2.1')
depends=('firefox-esr')
groups=('firefox-esr-addons')
source=("extension.xpi::https://addons.mozilla.org/firefox/downloads/file/4234675/download_with_aria2-$pkgver.xpi")
sha512sums=('d1083de2765bd8340fc682a184cdde6b5f91c168788ec1e4d6f84c115f9471ba6b54902bc36c28222912cf6e4fcaa4580239d4f13821e2ca840a1fd331bed2e3')

package() {
  install -Dm644 extension.xpi "${pkgdir}/usr/lib/firefox-esr/browser/extensions/firefox@downloadWithAria2.xpi"
}

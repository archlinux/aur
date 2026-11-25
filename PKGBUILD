# Maintainer: fox1e <git@work.fox1e.dev>

pkgname=wizardchat-bin
_version=26.12.5
pkgver=26.12.5
pkgrel=1
pkgdesc='Simple, secure, magical Matrix client'
arch=('x86_64')
url='https://wizardchat.org'
license=('AGPL-3.0-only')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'gst-plugins-base' 'gst-plugins-good')
optdepends=('gst-plugins-bad: voice and video calls' 'gst-libav: more video formats')
provides=('wizardchat')
conflicts=('wizardchat')
options=('!debug')
source=("https://gitlab.com/api/v4/projects/wizardchat%2Fwizardchat/packages/generic/wizardchat-desktop/v${_version}/wizardchat-${_version}-linux-x86_64.tar.gz")
sha256sums=('ee66a802fcb7988151d2d75c26dbc499cae907504f2bf6955d9336232d16f275')

package() {
  cp -a "${srcdir}/usr" "${pkgdir}/"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

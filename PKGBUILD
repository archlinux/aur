# Maintainer: fox1e <git@work.fox1e.dev>

pkgname=wizardchat-bin
_version=26.12.3
pkgver=26.12.3
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
sha256sums=('6afccc8ab4f0634dbbfeff22b91896dc745edef2ea8158def9333a4bfc9bf206')

package() {
  cp -a "${srcdir}/usr" "${pkgdir}/"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

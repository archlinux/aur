# Maintainer: fox1e <git@work.fox1e.dev>

pkgname=wizardchat-bin
_version=26.12.2
pkgver=26.12.2
pkgrel=2
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
sha256sums=('1b5dadc400e906397374cae4c79d22b31556b1621b86abc15c96d477c07a360c')

package() {
  cp -a "${srcdir}/usr" "${pkgdir}/"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

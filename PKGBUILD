pkgname=codex-multi-account-switcher-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='GTK app for switching between ChatGPT accounts for Codex CLI'
arch=('x86_64')
url='https://github.com/jR4dh3y/codex-multi-account-switcher'
license=('MIT')
depends=(
  'glib2'
  'glibc'
  'gtk4'
  'json-glib'
  'libadwaita'
  'libsoup3'
)
provides=('codex-multi-account-switcher')
conflicts=('codex-multi-account-switcher')
source=(
  "${pkgname}-${pkgver}.tar.zst::${url}/releases/download/v${pkgver}/codex-multi-account-switcher-${pkgver}-x86_64.tar.zst"
)
sha256sums=('c146968f8a7f0ce3da466199f66b6635a2697c968eeaee38dc8225071e999327')

package() {
  install -d "${pkgdir}"
  cp -a "${srcdir}/codex-multi-account-switcher-${pkgver}-x86_64/usr" "${pkgdir}/"
}

pkgname=codex-account-switcher-bin
pkgver=0.2.4
pkgrel=1
pkgdesc='GTK app for switching between ChatGPT accounts for Codex CLI'
arch=('x86_64')
url='https://github.com/jR4dh3y/codex-account-switcher'
license=('MIT')
depends=(
  'glib2'
  'glibc'
  'gtk4'
  'json-glib'
  'libadwaita'
  'libsoup3'
)
provides=('codex-account-switcher')
conflicts=('codex-account-switcher')
source=(
  "${pkgname}-${pkgver}.tar.zst::${url}/releases/download/v${pkgver}/codex-account-switcher-${pkgver}-x86_64.tar.zst"
)
sha256sums=('1bd58df3cb20f1fa9b7073d2a7a315924d2f11364a2aa5a4f28c80e1c6383d50')

package() {
  install -d "${pkgdir}"
  cp -a "${srcdir}/codex-account-switcher-${pkgver}-x86_64/usr" "${pkgdir}/"
}

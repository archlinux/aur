pkgname=codex-account-switcher-bin
pkgver=0.2.2
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
sha256sums=('601469d2fa71540c3d8720a04b60a5492474e026d1ac4e43b53040900132d7fc')

package() {
  install -d "${pkgdir}"
  cp -a "${srcdir}/codex-account-switcher-${pkgver}-x86_64/usr" "${pkgdir}/"
}

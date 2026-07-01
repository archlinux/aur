pkgname=codex-account-switcher-bin
pkgver=0.2.9
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
sha256sums=('01c2273203cbde8ac5e277261d35876bd1393799b87c9eda7be1dd4e505caa80')

package() {
  install -d "${pkgdir}"
  cp -a "${srcdir}/codex-account-switcher-${pkgver}-x86_64/usr" "${pkgdir}/"
}

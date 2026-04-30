pkgname=worklog-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Local-first desktop project manager for small dev teams"
arch=('x86_64')
url="https://github.com/regisx001/worklog"
license=('MIT')
depends=(
  'gtk3'
  'webkit2gtk-4.1'
  'libsoup3'
  'glib2'
  'gcc-libs'
)
source=("https://github.com/regisx001/worklog/releases/download/app-v${pkgver}/worklog_${pkgver}_amd64.deb")
sha256sums=('5eff94b549464307621631f98c7a6e674cf23a2d7e2c4707407a759f0ec7c6fc')

package() {
  cd "$srcdir"
  ar x "worklog_${pkgver}_amd64.deb"
  tar -xf data.tar.* -C "$pkgdir"
}

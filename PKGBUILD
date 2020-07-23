# Maintainer: Sergey M <tz4678@gmail.com>
pkgname=procmon
pkgver=1.0
pkgrel=1
pkgdesc='ProcMon for Linux'
arch=('any')
url="https://github.com/microsoft/ProcMon-For-Linux"
license=('MIT')
# в debian все файлы с преффиксом -dev включают исходники, в арче они
# по-умолчанию поставляются с пакетом
depends=('libedit' 'libelf' 'sqlite' 'zlib')
optdepends=(
  'bcc'
  'ncurses5-compat-libs'
)
# base-devel не рекомендуется включать в зависимости
makedepends=()
source=('https://github.com/microsoft/ProcMon-for-Linux/releases/download/1.0/procmon_1.0.0-291_amd64.deb')
md5sums=('SKIP')

package() {
  cd "${srcdir}"
  bsdtar -xf data.tar.gz -C "$pkgdir"
}

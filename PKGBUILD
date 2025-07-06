# Mainter: HaoZeke <HaoZeke@yandex.com>
pkgname=klfc-bin
_pkgname=${pkgname%-bin}
provides=("$_pkgname")
conflicts=("$_pkgname")
pkgver=1.5.7
pkgrel=1
pkgdesc="Tool to create advanced keyboard layouts in various formats (binary version)"
url="https://github.com/39aldo39/klfc"
license=("GPL-3.0-only")
arch=("x86_64")
source=("https://github.com/39aldo39/klfc/releases/download/v$pkgver/klfc-linux-amd64-v$pkgver.zip")
md5sums=('caee40a181d7d64092058850eabd8f97')

package() {
  install -Dm755 $_pkgname ${pkgdir}/usr/bin/$_pkgname
}

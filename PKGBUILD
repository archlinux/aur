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
sha256sums=('712851d448beb2301cd60f6c04a557f007eb59731fb481e41f7755b41da4f519')

package() {
  install -Dm755 $_pkgname ${pkgdir}/usr/bin/$_pkgname
}

# Maintainer: zu1k <i@zu1k.com>

pkgname=nali-go-bin
_pkgname=nali
pkgver=0.7.0
pkgrel=1
pkgdesc='An offline tool for querying IP geographic information and CDN provider. (Pre-compiled)'
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/zu1k/nali"
license=('MIT')
provides=('nali')
conflicts=('nali')

source_i686=("https://github.com/zu1k/nali/releases/download/v${pkgver}/$_pkgname-linux-386-v$pkgver.gz")
source_x86_64=("https://github.com/zu1k/nali/releases/download/v${pkgver}/$_pkgname-linux-amd64-v$pkgver.gz")
source_aarch64=("https://github.com/zu1k/nali/releases/download/v${pkgver}/$_pkgname-linux-armv8-v$pkgver.gz")
source_armv6h=("https://github.com/zu1k/nali/releases/download/v${pkgver}/$_pkgname-linux-armv6-v$pkgver.gz")
source_armv7h=("https://github.com/zu1k/nali/releases/download/v${pkgver}/$_pkgname-linux-armv7-v$pkgver.gz")
source_arm=("https://github.com/zu1k/nali/releases/download/v${pkgver}/$_pkgname-linux-armv5-v$pkgver.gz")

sha256sums_i686=('cbb23112c99452e5fe04707cbfb3ca67b0809345b4c74a7dd9f0072fd26c7661')
sha256sums_x86_64=('e7fd9b7247ac3d38cc476a6e63ce0cab3e950b6991a9a85ee7050fa51601cbaa')
sha256sums_arm=('6d693d40dd22275897a6656c761f1c782218faa841a66b7d1bc5d8b9c2382d0c')
sha256sums_armv7h=('14d6282e83d94994fa33a9d7474e770348d68ff656cd532fb6169c0fb0451b2e')
sha256sums_armv6h=('793234bd082c8125e5c1b60cf37af9f1a71f5b9c73dff44f26ea2b8be459da36')
sha256sums_aarch64=('a6913404a1b9abc21da8993b04cdda4df8f9e8860fe182c5a996ff7a9d020a46')


package() {
  cd "$srcdir"
  install -Dm755 $_pkgname-linux-*-v$pkgver "$pkgdir"/usr/bin/$_pkgname
}

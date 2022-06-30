# Maintainer: zu1k <i@zu1k.com>

pkgname=nali-go-bin
_pkgname=nali
pkgver=0.4.6
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

sha256sums_i686=('4f232e770010980986a2320c761883caa40bff8c8ca76922230413b8959fbc77')
sha256sums_x86_64=('a1fc798c534328b0a447f01970f4de1de2e0556a87e595f717f03d95b15e4b59')
sha256sums_arm=('3feba0ac06e711120716f2e968969dca9bcf8845823ccadef371441ac5ea947f')
sha256sums_armv7h=('ba9de194df471f048b25dbd129f03132c4daf575cf036648aa9457dfe7f1d716')
sha256sums_armv6h=('ddd495b3c3d2c3a13338b797b683089ddb5194f65730319f25094ec6e6f729c9')
sha256sums_aarch64=('a8fc9d7b6f6eadfed85502313b3956e72540a60e5be32d9e50252a30a8c4474d')


package() {
  cd "$srcdir"
  install -Dm755 $_pkgname-linux-*-v$pkgver "$pkgdir"/usr/bin/$_pkgname
}

pkgname=enumctl-bin
pkgver=2026.08.2
pkgrel=1
pkgdesc="CLI tool for enum"
arch=('x86_64' 'aarch64')
url="https://enum.co/"
keywords=('enum' 'cli' 'command-line' 'enumctl')
license=('custom')
depends=('glibc')

source_x86_64=("enumctl-x86_64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-amd64")
source_aarch64=("enumctl-aarch64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-arm64")

sha256sums_x86_64=('96a33e0dbef2709a5c0ff2bba3fad9a4955229af465a5293abe746994f0d50dc')
sha256sums_aarch64=('56ad4068ee4480e37baf1e862a69b00e55c0e7a251be7668fb05038135864be9')

package() {
  install -Dm755 enumctl-$CARCH "$pkgdir/usr/bin/enumctl"
}

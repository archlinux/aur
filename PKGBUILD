# Maintainer: xihale <xihale.top@qq.com>

## options
: ${_pkgtype:=-bin}

pkgname="unlock-music-cli$_pkgtype"
pkgver=0.2.17
pkgrel=1
pkgdesc="Unlock Music Project - CLI Edition"
arch=("aarch64" "x86_64")
license=('MIT')
url="https://git.um-react.app/um/cli"

source_aarch64=(
  "um-linux-arm64-v$pkgver.tar.gz::$url/releases/download/v$pkgver/um-linux-arm64-v$pkgver.tar.gz"
)
source_x86_64=(
  "um-linux-amd64-v$pkgver.tar.gz::$url/releases/download/v$pkgver/um-linux-amd64-v$pkgver.tar.gz"
)

sha256sums_aarch64=('7a9fc5fec9ec2dd060ed7558789c908539399b9f1f3b26f17db3f3b959e1a427')
sha256sums_x86_64=('748791a962da6492f1d468b30064a83cdfe7dad02ccec913ab5f2b82366d83b2')

package() {

  install -Dm755 "$srcdir/um" -t "$pkgdir/usr/bin/"

}

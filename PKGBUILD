# Maintainer: Saurabh Kushwah <saurabhkushwahjnv@gmail.com>

pkgname=dash-mpd-cli-bin
pkgver=0.2.27
pkgrel=1
pkgdesc="Download media content from a DASH-MPEG or DASH-WebM MPD manifest "
arch=('x86_64' 'aarch64')
url="https://github.com/emarsden/dash-mpd-cli"
license=('MIT')
depends=()
provides=('dash-mpd-cli')
conflicts=('dash-mpd-cli')

source_x86_64=("dash-mpd-cli::https://github.com/emarsden/dash-mpd-cli/releases/download/v${pkgver}/dash-mpd-cli-linux-amd64")
sha256sums_x86_64=('b65fb38a7a74db356c0f0d23c2f072759d665a008871ab37f785cd3768263da3')

source_aarch64=("dash-mpd-cli::https://github.com/emarsden/dash-mpd-cli/releases/download/v${pkgver}/dash-mpd-cli-linux-aarch64")
sha256sums_aarch64=('a2ca4645190c66d814e76c74256c29b18a6d29d6a0b554f30f8094022d6d8ec2')

package() {
  install -Dm755 "$srcdir/dash-mpd-cli" "$pkgdir/usr/bin/dash-mpd-cli"
}

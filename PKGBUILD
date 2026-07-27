# Maintainer: Ayan De <deayan252@gmail.com>
pkgname=tokentracker-bin
pkgver=0.1.11
pkgrel=1
# the .deb is attached to a release tag that may differ from pkgver
_tag=v0.1.12
pkgdesc="AI provider quota monitor — track usage, rate limits, and spend across 40+ LLM providers"
arch=('x86_64')
url="https://github.com/ayan-de/Token-Tracker"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
provides=('tokentracker')
conflicts=('tokentracker')
options=('!strip')
source=("$pkgname-$pkgver.deb::$url/releases/download/$_tag/TokenTracker_${pkgver}_amd64.deb")
sha256sums=('f3d37bd56843d90025448a77a9d0667f35de636ce87dd9d142ab304d5cfeff70')

package() {
  bsdtar -xf data.tar.gz -C "$pkgdir"
}

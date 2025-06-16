# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.61
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.61/opencode-linux-arm64.zip")
sha256sums_aarch64=('f963b2b213c2d03d47eaf0abba2f53fe3aba5f2c2bf6f4c7c295a7464a3ad9f8')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.61/opencode-linux-x64.zip")
sha256sums_x86_64=('11b82854f612ed5a2752fc421af6919bd45fdc103068aab9457c2f2ef28430d9')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}

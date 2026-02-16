  # Maintainer: AntoineGS <antoinegaudreau@users.noreply.github.com>
  pkgname=tidydots-bin
  pkgver=0.1.0
  pkgrel=1
  pkgdesc="Cross-platform dotfile management tool"
  arch=('x86_64' 'aarch64')
  url="https://github.com/AntoineGS/tidydots"
  license=('MIT')
  provides=('tidydots')
  conflicts=('tidydots')
  source_x86_64=("https://github.com/AntoineGS/tidydots/releases/download/v${pkgver}/tidyd
  ots_${pkgver}_linux_amd64.tar.gz")
  source_aarch64=("https://github.com/AntoineGS/tidydots/releases/download/v${pkgver}/tidy
  dots_${pkgver}_linux_arm64.tar.gz")
  sha256sums_x86_64=('SKIP')
  sha256sums_aarch64=('SKIP')

  package() {
      install -Dm755 tidydots "${pkgdir}/usr/bin/tidydots"
  }


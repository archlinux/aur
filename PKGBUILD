  pkgname=teabag-bin
  pkgver=0.0.1
  pkgrel=1
  pkgdesc="AppImage installer tool with centralized management and desktop integration"
  arch=('x86_64' 'aarch64')
  url="https://github.com/sivepanda/teabag"
  license=('MIT')
  provides=('teabag')
  conflicts=('teabag')
  source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sivepanda/teabag/releases/download/v${pkgver}/teabag_${pkgver}_linux_amd64.tar.gz")
  sha256sums=('SKIP')

  package() {
      install -Dm755 teabag "${pkgdir}/usr/bin/teabag"
  }


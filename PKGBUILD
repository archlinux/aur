  # Maintainer: AntoineGS
  pkgname=waybar-ai-usage-go-bin
  pkgver=0.0.1
  pkgrel=1
  pkgdesc="Waybar module showing Claude and Codex AI usage"
  arch=('x86_64')
  url="https://github.com/AntoineGS/waybar-ai-usage-go"
  license=('MIT')
  provides=('waybar-ai-usage')
  conflicts=('waybar-ai-usage')
  depends=('glibc')
  source=("${pkgname}-${pkgver}::https://github.com/AntoineGS/waybar-ai-usage-go/releases/d
  ownload/v${pkgver}/waybar-ai-usage-linux-amd64")
  noextract=("${pkgname}-${pkgver}")
  sha256sums=('SKIP')

  package() {
      install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/waybar-ai-usage"
  }


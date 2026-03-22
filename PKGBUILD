# Maintainer: lewta <77890109+lewta@users.noreply.github.com>
  pkgname=sendit-bin
  pkgver=0.14.2
  pkgrel=1
  pkgdesc="Traffic generation tool for HTTP, DNS, WebSocket, and headless-browser targets."
  arch=('x86_64' 'aarch64')
  url="https://github.com/lewta/sendit"
  license=('MIT')
  provides=('sendit')
  conflicts=('sendit')
  source_x86_64=("https://github.com/lewta/sendit/releases/download/v${pkgver}/sendit_${pkgver}_linux_amd64.tar.gz")
  source_aarch64=("https://github.com/lewta/sendit/releases/download/v${pkgver}/sendit_${pkgver}_linux_arm64.tar.gz")
  sha256sums_x86_64=('SKIP')
  sha256sums_aarch64=('SKIP')

  package() {
      install -Dm755 "./sendit" "${pkgdir}/usr/bin/sendit"
      install -Dm644 "./completions/sendit.bash" "${pkgdir}/usr/share/bash-completion/completions/sendit"
      install -Dm644 "./completions/sendit.zsh" "${pkgdir}/usr/share/zsh/site-functions/_sendit"
      install -Dm644 "./completions/sendit.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/sendit.fish"
  }


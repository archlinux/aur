# Maintainer: Wimpy <vvinn.py[AT]email.com>
pkgname=codes-bin
pkgver=0.24.1
pkgrel=2
pkgdesc="A powerful CLI tool for managing multiple Claude Code configurations with ease. Switch between different Claude API endpoints, manage authentication tokens, and streamline your AI-powered development workflow."
arch=('x86_64' 'i686' 'armv7h' 'aarch64' 'mips' 'mips64' 'mips64le' 'mipsle' 'ppc64le' 'riscv64' 's390x')
url="https://github.com/ourines/codes"
license=('MIT')
provides=('codes')
conflicts=('codes')

# 架构下载映射
source_x86_64=("${url}/releases/download/v${pkgver}/codes-v${pkgver}-linux-amd64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/codes-v${pkgver}-linux-386.tar.gz")
source_armv7h=("${url}/releases/download/v${pkgver}/codes-v${pkgver}-linux-arm.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/codes-v${pkgver}-linux-arm64.tar.gz")
source_mips=("${url}/releases/download/v${pkgver}/codes-v${pkgver}-linux-mips.tar.gz")
source_mips64=("${url}/releases/download/v${pkgver}/codes-v${pkgver}-linux-mips64.tar.gz")
source_mips64le=("${url}/releases/download/v${pkgver}/codes-v${pkgver}-linux-mips64le.tar.gz")
source_mipsle=("${url}/releases/download/v${pkgver}/codes-v${pkgver}-linux-mipsle.tar.gz")
source_ppc64le=("${url}/releases/download/v${pkgver}/codes-v${pkgver}-linux-ppc64le.tar.gz")
source_riscv64=("${url}/releases/download/v${pkgver}/codes-v${pkgver}-linux-riscv64.tar.gz")
source_s390x=("${url}/releases/download/v${pkgver}/codes-v${pkgver}-linux-s390x.tar.gz")

# 建议在构建前运行 updpkgsums 更新校验
sha256sums_x86_64=('SKIP')
sha256sums_i686=('SKIP')
sha256sums_armv7h=('SKIP')
sha256sums_aarch64=('SKIP')
sha256sums_mips=('SKIP')
sha256sums_mips64=('SKIP')
sha256sums_mips64le=('SKIP')
sha256sums_mipsle=('SKIP')
sha256sums_ppc64le=('SKIP')
sha256sums_riscv64=('SKIP')
sha256sums_s390x=('SKIP')

package() {
  install -Dm755 "${srcdir}/codes" "${pkgdir}/usr/bin/codes"
  if [ -f "${srcdir}/LICENSE" ]; then
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}

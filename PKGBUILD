# Maintainer: Zhong Lufan <lufanzhong@gmail.com>

# shellcheck shell=bash
# shellcheck disable=SC2034,SC2154,SC2164

pkgname=wsl2-ssh-agent-bin
pkgver=0.9.2
pkgrel=1
pkgdesc="A bridge from WSL2 ssh client to Windows ssh-agent.exe service"
arch=('x86_64' 'aarch64')
url="https://github.com/mame/wsl2-ssh-agent"
license=('MIT')
source_x86_64=("${pkgname}-${pkgver}::https://github.com/mame/wsl2-ssh-agent/releases/download/v${pkgver}/wsl2-ssh-agent")
source_aarch64=("${pkgname}-${pkgver}::https://github.com/mame/wsl2-ssh-agent/releases/download/v${pkgver}/wsl2-ssh-agent-arm64")
sha256sums_x86_64=('e03c0ff55aa30887f578b2f594b6b0c4e2aed6eb73f728c194fccb01e8eb6457')
sha256sums_aarch64=('144859d24e26373f5d987e566dd6e374966bd779cee90aa75692ba8bd643b3cd')

package() {
  install -Dm 755 ${pkgname}-${pkgver} "$pkgdir"/usr/bin/wsl2-ssh-agent
}

# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=1.0.14
pkgrel=1
pkgdesc="CLI for the usectl self-hosted deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('4105f49ba8aeccc27efb510eb3ce5bfb659db6eaef0f1ad271881e047dd7aa76')
sha256sums_aarch64=('3c50247963bffdb3517caf2edeaeaadb1149532ad3c6c6be22d4e9384b403d1b')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}

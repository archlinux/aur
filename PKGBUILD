# Maintainer: 1Conan <me@1conan.com>

pkgname=checkra1n-cli
pkgver=0.9.8
pkgrel=4
pkgdesc="checkra1n is a semi-tethered jailbreak, developed primarily by Luca Todesco (qwertyoruiop). It's based on the checkm8 bootrom exploit released by axi0mx. checkra1n supports iOS 12.3 and newer."
license=('unknown')
url="https://checkra.in"
conflicts=('checkra1n-ubuntu-bin')
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')

source_x86_64=('https://assets.checkra.in/downloads/linux/cli/x86_64/eda98d55f500a9de75aee4e7179231ed828ac2f5c7f99c87442936d5af4514a4/checkra1n')
sha256sums_x86_64=('eda98d55f500a9de75aee4e7179231ed828ac2f5c7f99c87442936d5af4514a4')

source_arm=('https://assets.checkra.in/downloads/linux/cli/arm/5f7d4358971eb2823413801babbac0158524da80c103746e163605d602ff07bf/checkra1n')
sha256sums_arm=('5f7d4358971eb2823413801babbac0158524da80c103746e163605d602ff07bf')

source_armv6h=('https://assets.checkra.in/downloads/linux/cli/arm/5f7d4358971eb2823413801babbac0158524da80c103746e163605d602ff07bf/checkra1n')
sha256sums_armv6h=('5f7d4358971eb2823413801babbac0158524da80c103746e163605d602ff07bf')

source_arm7h=('https://assets.checkra.in/downloads/linux/cli/arm/5f7d4358971eb2823413801babbac0158524da80c103746e163605d602ff07bf/checkra1n')
sha256sums_arm7h=('5f7d4358971eb2823413801babbac0158524da80c103746e163605d602ff07bf')

source_aarch64=('https://assets.checkra.in/downloads/linux/cli/arm64/0a640fd52276d5640bbf31c54921d1d266dc2303c1ed26a583a58f66a056bfea/checkra1n')
sha256sums_aarch64=('0a640fd52276d5640bbf31c54921d1d266dc2303c1ed26a583a58f66a056bfea')

source_i686=('https://assets.checkra.in/downloads/linux/cli/i486/26952e013ece4d0e869fc9179bfd2b1f6c319cdc707fadf44fdb56fa9e62f454/checkra1n')
sha256sums_i686=('26952e013ece4d0e869fc9179bfd2b1f6c319cdc707fadf44fdb56fa9e62f454')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  cp checkra1n "${pkgdir}/usr/bin"
  chmod +x "${pkgdir}/usr/bin/checkra1n"
}


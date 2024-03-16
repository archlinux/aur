# Maintainer: Chase 李 <me@chase.ninja>

pkgname=tenv-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="OpenTofu / Terraform / Terragrunt version manager"
arch=('x86_64' 'i386' 'armv6' 'arm64')
url="https://github.com/tofuutils/tenv"
license=('Apache-2.0')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=('cosign: package validation for OpenTofu'
            'gnupg: package validation for Terraform')
provides=("tf" "tofu" "terraform" "terragrunt")
conflicts=('terraform' 'tofu' 'terragrunt')
replaces=()
backup=()
options=()
install=
changelog=
source_x86_64=("https://github.com/tofuutils/tenv/releases/download/v${pkgver}/tenv_v${pkgver}_Linux_x86_64.tar.gz")
source_i386=("https://github.com/tofuutils/tenv/releases/download/v${pkgver}/tenv_v${pkgver}_Linux_i386.tar.gz")
source_armv6=("https://github.com/tofuutils/tenv/releases/download/v${pkgver}/tenv_v${pkgver}_Linux_armv6.tar.gz")
source_arm64=("https://github.com/tofuutils/tenv/releases/download/v${pkgver}/tenv_v${pkgver}_Linux_arm64.tar.gz")
noextract=()
md5sums=()

package() {
  install -Dm 0755 "tenv" "${pkgdir}/usr/bin/tenv"
  install -Dm 0755 "terraform" "${pkgdir}/usr/bin/terraform"
  install -Dm 0755 "terragrunt" "${pkgdir}/usr/bin/terragrunt"
  install -Dm 0755 "tf" "${pkgdir}/usr/bin/tf"
  install -Dm 0755 "tofu" "${pkgdir}/usr/bin/tofu"
}

sha256sums_x86_64=('85925f8bf2a7fe11c09dd666f564a551d41dd52a465d5a2932170695169d3b5b')
sha256sums_i386=('52250e2633e982d89e115ea807c2a1111a75a6f7963dfcb7dab5f4abfcc9d2a6')
sha256sums_armv6=('0fb04b58580c791f09bcb2ae3c9db13628f16999b6d2484d362356f457b3733e')
sha256sums_arm64=('0c868cf94d47ee08ecb3486e4c5d99d6bb36f3a06f830634a0d75a9cad7bc638')

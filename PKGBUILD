# Maintainer: Chase 李 <aur@chase.ninja>

pkgname=tenv-bin
pkgver=1.10.2
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

sha256sums_x86_64=('c1fd8a7a6f14cf6e319ac569b8e0f9925dc0d91c43875c5641b8126f853004cb')
sha256sums_i386=('d4dc095406375c798c6285a20cee72e52bfc66208ce3a7af952b3f241d758841')
sha256sums_armv6=('b1dec899b11c389992181fe5bc3c740cde64c67cec1e43a08cd7a301e6b93452')
sha256sums_arm64=('a002787a412fbaed15bee7afa713556c4f0ca5e7d41dec2f4ccc4196e335fc80')
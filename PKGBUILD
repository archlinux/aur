# Maintainer: Chase 李 <aur@chase.ninja>

pkgname=tenv-bin
pkgver=1.11.8
pkgrel=1
pkgdesc="OpenTofu / Terraform / Terragrunt and Atmos version manager"
arch=('x86_64' 'i386' 'armv6' 'arm64')
url="https://github.com/tofuutils/tenv"
license=('Apache-2.0')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=('cosign: package validation for OpenTofu')
provides=("atmos" "tenv" "terraform" "terragrunt" "tf" "tofu")
conflicts=('atmos' 'atmos-bin' 'opentofu' 'opentofu-bin' 'opentofu-bin-stable' 'opentofu-git' 'terraform' 'terragrunt' 'tfenv' 'tgenv' 'tofuenv')
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
  install -Dm 0755 "atmos" "${pkgdir}/usr/bin/atmos"
  install -Dm 0755 "tenv" "${pkgdir}/usr/bin/tenv"
  install -Dm 0755 "terraform" "${pkgdir}/usr/bin/terraform"
  install -Dm 0755 "terragrunt" "${pkgdir}/usr/bin/terragrunt"
  install -Dm 0755 "tf" "${pkgdir}/usr/bin/tf"
  install -Dm 0755 "tofu" "${pkgdir}/usr/bin/tofu"
  install -Dm 0644 "LICENSE" "${pkgdir}/usr/share/doc/tenv/LICENSE"
  install -Dm 0644 "README.md" "${pkgdir}/usr/share/doc/tenv/README.md"
}

sha256sums_x86_64=('dbe99712774ca824ee5113cf3e2ec49a856f01b9c1fe767963fef7977aad1b81')
sha256sums_i386=('08a32acab56ba12a1f60556b2a4b1db82155bad8472b49a7ed0c1da479f9e79b')
sha256sums_armv6=('7be4afe3c650b66b33b02e9fd539c4f2683330e1d31f4553d157a1f6194d6310')
sha256sums_arm64=('65429874a45a0e7f5b26c0be94562335fc4cf74b09c49113a1724c29cfb44256')

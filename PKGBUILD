# Maintainer: Chase 李 <aur@chase.ninja>

pkgname=tenv-bin
pkgver=1.11.6
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

sha256sums_x86_64=('f19cb53b8e4fc95917402ea4f4f171e8fc1c99ea38b72c2d653c3b29711e8b70')
sha256sums_i386=('ec626f5f02b7fa5ca3daa4ba8af870327daad642e7d13f84a79184d4b206ac2a')
sha256sums_armv6=('ec9b7820b83b22d4b43908038ba17a0d5b0416a14b64b332f5e5107f3f58133b')
sha256sums_arm64=('272504dbf93942bb503fe078b85577359b5c44ad2906bc7ecbbef1d4ca77c289')

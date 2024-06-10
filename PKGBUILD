# Maintainer: Chase 李 <aur@chase.ninja>

pkgname=tenv-bin
pkgver=2.0.3
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

sha256sums_x86_64=('a0fe7e008b52c1f9c3cbeb1cdef97cc3b37a65c4b6075869ce55e78ad815446a')
sha256sums_i386=('33469125d90e6eced4b75e007f222a74bba73107dbbb5ee9b247a08744b7772b')
sha256sums_armv6=('09653115ded3b48e1e83e32d83e53e322df4ae60697e66502f5dfabec6a23f8e')
sha256sums_arm64=('81a257391947eb6518376068a330825d8339329acb1604285acf3a7f4ee5e986')

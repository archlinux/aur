# Maintainer: Chase 李 <aur@chase.ninja>

pkgname=tenv-bin
pkgver=1.11.0
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

sha256sums_x86_64=('ea51477cb2dd8f0de06e00d6487d71221528e304b53c0ac52e337d8ad02b57af')
sha256sums_i386=('458c7ef4818611dab87bc7ecc570ffda992fac779d425f9d030f2d8d7b41431f')
sha256sums_armv6=('41b47581542cdbcd8fdf74679b51a4a470ffcc684a80ad842b697145dba426a6')
sha256sums_arm64=('ed2849d340e252ca6b3af0bb73570fc5a7891b4a24032128a08c028b44ecf6b1')

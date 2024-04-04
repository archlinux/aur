# Maintainer: Chase 李 <aur@chase.ninja>

pkgname=tenv-bin
pkgver=1.4.0
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

sha256sums_x86_64=('74a6a60b45ac73c8f377480f3b93581e8cda64b40b311cc0a33b346f9cfbdb6b')
sha256sums_i386=('a15c3a57599c08a7c274aad6074d2c05c69788bb2e2d1fe6327cb479724660e0')
sha256sums_armv6=('a9acc501cab34116555d57c2f8c4bf10d431f611eebb9340a1bfaf8f3fc172e0')
sha256sums_arm64=('efb117c329a26090abd402ee6c0a68c7139cd2d6a2d0c58d2be5ccbf110412ad')

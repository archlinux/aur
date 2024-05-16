# Maintainer: Chase 李 <aur@chase.ninja>

pkgname=tenv-bin
pkgver=1.10.1
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

sha256sums_x86_64=('5d43ebd9ba26f3ecd8471b0528b6ee3f976aa6b937b1bd4a4b75c84efb448ebe')
sha256sums_i386=('a9f83722b5de9a5d528b093e1bd3f02bac8639528f7e0e3bafbe2cd13eecfea1')
sha256sums_armv6=('89cd3a8897e6df96afa709d6ff80f569f7e8848d4df77afa3c81148aa3994bc2')
sha256sums_arm64=('14c62e4b7f0cee090176e0b712d23a43df72d13b66ed5cb8b82c7d94932e1844')

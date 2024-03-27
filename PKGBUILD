# Maintainer: Chase 李 <aur@chase.ninja>

pkgname=tenv-bin
pkgver=1.3.0
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

sha256sums_x86_64=('aa85779eed7aaf05232b07df67815914a2eeef250989c1ae2946bd9194f7b791')
sha256sums_i386=('77df7ecb8031fde1ec4956320d065fb393cd2124079d7dfb442e2214af4bcec4')
sha256sums_armv6=('b5bf8cdf6b9c67543a1677a0aef1a82f2eb5f12240c58a2135ef058919673f06')
sha256sums_arm64=('12f58289e2a97dc8ea975f98550b06781c1126cd956165100f071825585dbb36')

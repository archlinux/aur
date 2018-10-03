# Maintainer: Sam Whited <xmpp:sam@samwhited.com>

pkgname=terraform-provider-acme-bin
pkgver=1.0.1
pkgrel=2
pkgdesc='Terraform provider for ACME certificate provisioning (Lets Encrypt)'
url='https://github.com/vancluever/terraform-provider-acme'
arch=('x86_64'
      'i686'
      'arm')
license=('apache')
optdepends=('terraform: uses this plugin')
source_x86_64=("https://releases.hashicorp.com/${pkgname%-bin}/${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.zip")
source_i686=("https://releases.hashicorp.com/${pkgname%-bin}/${pkgver}/${pkgname%-bin}_${pkgver}_linux_386.zip")
source_arm=("https://releases.hashicorp.com/${pkgname%-bin}/${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm.zip")
sha256sums_x86_64=('91666ae8da5e9dc891f03ec51da89bf53a8b8dfe545b5b0244e8a1b799f2f597')
sha256sums_i686=('f837de4f3039bf1f759c806ce7af3003a2e8a2a54fac2adaa251cd9dc810d634')
sha256sums_arm=('c5511c078f579ea9f4a60e14226a7b50287bb83acac9bb21bbd9628e852849f0')


package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}_v${pkgver}_x4" "${pkgdir}/usr/bin/${pkgname%-bin}_v${pkgver}"
}

# vim:set ts=2 sw=2 et:

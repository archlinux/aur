# Maintainer: Sam Whited <xmpp:sam@samwhited.com>
# Based on https://aur.archlinux.org/packages/terraform-provider-libvirt/

pkgname=terraform-provider-acme-bin
_pkgname=terraform-provider-acme
pkgver=0.5.0
pkgrel=2
pkgdesc='Terraform provider for ACME certificate provisioning (Lets Encrypt)'
url='https://github.com/vancluever/terraform-provider-acme'
arch=('x86_64')
license=('apache')
depends=('glibc')
optdepends=('terraform: uses this plugin')
source=("https://github.com/vancluever/terraform-provider-acme/releases/download/v${pkgver}/terraform-provider-acme_v${pkgver}_linux_amd64.zip")
sha256sums=('5399b90969733b036117a7e6b37955bf88e144054df8314ef4cbaa37759924e8')
_importpath='github.com/vancluever'


package() {
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}_v${pkgver}"
}

# vim:set ts=2 sw=2 noexpandtab:

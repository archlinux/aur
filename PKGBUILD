# Maintainer: Sam Whited <xmpp:sam@samwhited.com>
# Based on https://aur.archlinux.org/packages/terraform-provider-libvirt/

pkgname=terraform-provider-acme-bin
_pkgname=terraform-provider-acme
pkgver=1.0.0
pkgrel=1
pkgdesc='Terraform provider for ACME certificate provisioning (Lets Encrypt)'
url='https://github.com/vancluever/terraform-provider-acme'
arch=('x86_64')
license=('apache')
optdepends=('terraform: uses this plugin')
source=("https://github.com/vancluever/terraform-provider-acme/releases/download/v${pkgver}/terraform-provider-acme_v${pkgver}_linux_amd64.zip")
sha256sums=('c768d536ae8a739e9b7c1b77f08abf357fae979c33638569f60f227ecf80504a')
_importpath='github.com/vancluever'


package() {
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}_v${pkgver}"
}

# vim:set ts=2 sw=2 noexpandtab:

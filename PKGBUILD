# Maintainer: Amaan Hashmi-Ubhi <amaanhub at protonmail dot com>

pkgname=ovhcloud-cli-bin
_pkgname=ovhcloud
pkgver=0.9.0
pkgrel=1
pkgdesc="ovhcloud is a single, unified command‑line interface for managing OVHCloud"
arch=('x86_64')
url="https://github.com/ovh/ovhcloud-cli"
license=('Apache-2.0')
source=("$url/releases/download/v$pkgver/ovhcloud-cli_Linux_x86_64.tar.gz")
sha512sums=('a1e3d0ec55f3f437ebfa5c8a44619a59f78167dcc0d63214d5b0b9170a0116ed8e911310931ae4995ab0cf25634dc4dcef6fbe83e7b78856c29c86ad3c72edf3')

package(){
	install -Dm755 "$srcdir"/"$_pkgname" "$pkgdir"/usr/bin/"$_pkgname"
}

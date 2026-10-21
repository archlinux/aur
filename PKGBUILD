# Maintainer: Amaan Hashmi-Ubhi <amaanhub at protonmail dot com>

pkgname=ovhcloud-cli-bin
_pkgname=ovhcloud
pkgver=0.16.0
pkgrel=1
pkgdesc="ovhcloud is a single, unified command‑line interface for managing OVHCloud"
arch=('x86_64')
url="https://github.com/ovh/ovhcloud-cli"
license=('Apache-2.0')
source=("$url/releases/download/v$pkgver/ovhcloud-cli_Linux_x86_64.tar.gz")
sha512sums=('da11bb4e77741fa2ecdc5eecb7c7271ead0cb267e2eddc10ef7232f3541154217a1abe3bb1bc362f55b35baa203be7f6babe48971bc89cc44c4edd00158861ca')

package(){
	install -Dm755 "$srcdir"/"$_pkgname" "$pkgdir"/usr/bin/"$_pkgname"
}

# Maintainer: Amaan Hashmi-Ubhi <amaanhub at protonmail dot com>

pkgname=ovhcloud-cli-bin
_pkgname=ovhcloud
pkgver=0.14.0
pkgrel=1
pkgdesc="ovhcloud is a single, unified command‑line interface for managing OVHCloud"
arch=('x86_64')
url="https://github.com/ovh/ovhcloud-cli"
license=('Apache-2.0')
source=("$url/releases/download/v$pkgver/ovhcloud-cli_Linux_x86_64.tar.gz")
sha512sums=('0985b40068399efb5389c7ddb4e6e14da075610fa72e711175562c17990d105db93bff2936508e81b838dc8cbfb6aab9ebf9f281572c4944f4f97ad74837498a')

package(){
	install -Dm755 "$srcdir"/"$_pkgname" "$pkgdir"/usr/bin/"$_pkgname"
}

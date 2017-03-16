# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: David Mikalova <dmikalova (at) gmail.com>

_shell_=zsh
_app_=packer-color
pkgname=${_shell_}-${_app_}
pkgver=1
pkgrel=2
pkgdesc="Adds Zsh autocompletion definitions for packer-color"
url="https://gist.github.com/dmikalova/6103111"
arch=("any")
license=("GPL3")
depends=("zsh")
source=(http://public.files.xavion.name/Software/Shell/_${_app_})

package() {
	cd "${srcdir}"

	# Install
	install -D -m644 _${_app_} "${pkgdir}/usr/share/zsh/site-functions/_${_app_}"
}

sha1sums=('0305c6dd776b39ce5917e380b4211c0ece9610fa')

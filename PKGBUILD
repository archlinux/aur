# Maintainer: ivanmara
# Contributor: ivanmara
pkgname=gentoo-color-bash
pkgver=2024.06.20
_id=68c208ecd6b805ebc7796d2b71ceef4614179a2d  # 2024-06-20 size: 2209 latest commit
pkgrel=2

pkgdesc='Gentoo color terminal and bash command prompt. Looks very nice.'
arch=('any')
url='https://www.gentoo.org'
license=('GPL')
optdepends=('bash: Shell needed to make use of this package')
source=("gentoo-color-bash-${pkgver}::https://gitweb.gentoo.org/repo/gentoo.git/plain/app-shells/bash/files/bashrc.d/10-gentoo-color.bash?id=${_id}")
sha256sums=('579af0d935be990abc00fc54eeb7439d64b49ca4a1636e16eff950a91a8c76f2')
install=${pkgname}.install

package() {

    install -D -m=644 ${pkgname}-${pkgver} "${pkgdir}/usr/share/${pkgname}/10-gentoo-color.bash"

}



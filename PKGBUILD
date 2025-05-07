# Maintainer: ivanmara
# Contributor: ivanmara
pkgname=gentoo-color-bash
pkgver=2025.05.10
_id=68c208ecd6b805ebc7796d2b71ceef4614179a2d  # 2024-06-20 size: 2209 latest commit
pkgrel=1

pkgdesc='Gentoo color terminal and bash command prompt. Looks very nice.'
arch=('any')
url='https://www.gentoo.org'
license=('GPL')
optdepends=('bash: Shell needed to make use of this package')
source=("gentoo-color-bash-${pkgver}::https://gitweb.gentoo.org/repo/gentoo.git/plain/app-shells/bash/files/bashrc.d/10-gentoo-color.bash?id=${_id}")
sha256sums=('579af0d935be990abc00fc54eeb7439d64b49ca4a1636e16eff950a91a8c76f2')
install=${pkgname}.install

_usage="\
#--------------------------------------------------------------------------------------------------

    USAGE:
        after install, you can enable it:
        A. globaly:
            1. in users: ~/.bashrc and /etc/skel/.bashrc remove\comment var PS1 or empty this files
            2. add line:
                   source /usr/share/gentoo-color-bash/10-gentoo-color.bash
               to global: /etc/bash.bashrc
        B. localy:
               add line:
                   source /usr/share/gentoo-color-bash/10-gentoo-color.bash
               to users: ~/.bashrc and /etc/skel/.bashrc

        Now you can add (if needed) you own ~/.dir_colors or /etc/DIR_COLORS for perfect ls.
        See arch wiki or github for examples.

#--------------------------------------------------------------------------------------------------
"
package() {

    install -D -m=644 ${pkgname}-${pkgver} "${pkgdir}/usr/share/${pkgname}/10-gentoo-color.bash"

    msg "${_usage}"

}



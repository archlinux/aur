# Maintainer: ivanmara
# Contributor: ivanmara
pkgname=gentoo-color-bash
pkgver=2025.08.18 # 2025-05-04 size: 2190
#_id=b39e66dce51adbe2ccef98dbd7e321c6c2e6b835
pkgrel=1

pkgdesc='Gentoo color terminal and bash command prompt. Looks very nice.'
arch=('any')
url='https://www.gentoo.org'
license=('GPL')
optdepends=('bash: Shell needed to make use of this package')
options=('!debug')
#source=("gentoo-color-bash-${pkgver}::https://gitweb.gentoo.org/repo/gentoo.git/plain/app-shells/bash/files/bashrc.d/10-gentoo-color-r2.bash?id=${_id}")
source=("gentoo-color-bash-${pkgver}::https://gitweb.gentoo.org/repo/gentoo.git/plain/app-shells/bash/files/bashrc.d/10-gentoo-color-r2.bash")
sha256sums=('189766ac49f48880ce2507971fc3d8e15449976042d938bf6c6ad77e73793958')
install=${pkgname}.install.sh

_usage='
    USAGE:
        after install, you can enable it:
        A. for local users:
               add line:
                   source /usr/share/gentoo-color-bash/10-gentoo-color.bash
               to users: ~/.bashrc and /etc/skel/.bashrc
        B. for system globaly:
            1. in users: ~/.bashrc and /etc/skel/.bashrc remove\comment var PS1 or empty this files
            2. add line:
                   source /usr/share/gentoo-color-bash/10-gentoo-color.bash
               to global: /etc/bash.bashrc
            3. relogin

        Now you can add (if needed) you own ~/.dir_colors or /etc/DIR_COLORS for perfect ls.
        See arch wiki or github for examples.
'

package() {

    install -D -m=644 ${pkgname}-${pkgver} "${pkgdir}/usr/share/${pkgname}/10-gentoo-color.bash"

}



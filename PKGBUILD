# Packager: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
pkgname=vim-assistant
pkgver=1.5.8
_scriptid=22247
pkgrel=1
pkgdesc="Display the definition of functions, variables, etc. (Tags, PHP/JS/Vim/...)"
arch=(any)
url="http://www.vim.org/scripts/script.php?script_id=2805"
license=('unknown')
depends=(vim)
groups=('vim-plugins')
source=(${pkgname}-${pkgver}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid})
md5sums=('a12e2cffa436e58f48c12491be32c970')

package() {
    cd "${srcdir}"
    install -dm755 ${pkgdir}/usr/share/vim/vimfiles/plugin/assistant
    #unzip ${pkgname}-${pkgver} -d ${srcdir}
    install -Dm644 ${srcdir}/${pkgname}-master/plugin/assistant.vim ${pkgdir}/usr/share/vim/vimfiles/plugin/
    install -Dm644 ${srcdir}/${pkgname}-master/plugin/assistant/* ${pkgdir}/usr/share/vim/vimfiles/plugin/assistant
}


# Maintainer: apkawa <apkawa@gmail.com>

pkgname=vim-zencoding
pkgver=0.80
pkgrel=1
pkgdesc="vim plugins for HTML and CSS hi-speed coding"
arch=(any)
url="http://github.com/mattn/zencoding-vim"
license=('custom')
depends=(vim)
groups=('vim-plugins')
source=(zencoding-vim-${pkgver}.zip::http://www.vim.org/scripts/download_script.php?src_id=18992)

build() {
    install -d ${pkgdir}/usr/share/vim/vimfiles/
    cp -r ${srcdir}/{autoload,doc,plugin} ${pkgdir}/usr/share/vim/vimfiles/

}

md5sums=('42d70260b7fb640f036900239a0261ab')

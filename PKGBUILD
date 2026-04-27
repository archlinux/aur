# Maintainer: Hyacinthe Cartiaux <hyacinthe dot cartiaux at free dot fr>
# Contributor: Mario Finelli <mario at finel dot li>

pkgname=vim-puppet
pkgver=1.0.0
pkgrel=1
epoch=3
pkgdesc='Puppet language syntax highlighting for vim.'
arch=('any')
url='https://github.com/rodjek/vim-puppet'
license=('Apache-2.0')
depends=('vim')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rodjek/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6d56d2260507482a48cded0b24191a15a3fb7b71f82df1ecbb2d4d036859a6be')

package() {
    cd "${pkgname}-${pkgver}"
    _vimdir="${pkgdir}/usr/share/vim/vimfiles"

    install -Dm644 after/plugin/gutentags.vim  "${_vimdir}/after/plugin/gutentags.vim"
    install -Dm644 after/ftplugin/puppet.vim   "${_vimdir}/after/ftplugin/puppet.vim"
    install -Dm644 autoload/puppet/format.vim  "${_vimdir}/autoload/puppet/format.vim"
    install -Dm644 autoload/puppet/ctags.vim   "${_vimdir}/autoload/puppet/ctags.vim"
    install -Dm644 autoload/puppet/align.vim   "${_vimdir}/autoload/puppet/align.vim"
    install -Dm644 compiler/puppet-lint.vim    "${_vimdir}/compiler/puppet-lint.vim"
    install -Dm644 ctags/puppet.ctags          "${_vimdir}/ctags/puppet.ctags"
    install -Dm644 ctags/puppet_u.ctags        "${_vimdir}/ctags/puppet_u.ctags"
    install -Dm644 ftdetect/puppet.vim         "${_vimdir}/ftdetect/puppet.vim"
    install -Dm644 ftplugin/puppet.vim         "${_vimdir}/ftplugin/puppet.vim"
    install -Dm644 ftplugin/puppet_tagbar.vim  "${_vimdir}/ftplugin/puppet_tagbar.vim"
    install -Dm644 ftplugin/epuppet.vim        "${_vimdir}/ftplugin/embeddedpuppet.vim"
    install -Dm644 indent/puppet.vim           "${_vimdir}/indent/puppet.vim"
    install -Dm644 syntax/puppet.vim           "${_vimdir}/syntax/puppet.vim"
    install -Dm644 syntax/epuppet.vim          "${_vimdir}/syntax/embeddedpuppet.vim"
}

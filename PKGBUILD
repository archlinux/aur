# Contributor: github.com/mitsuhiko
# Maintainer: Adam Russell <adamlr6+arch@gmail.com>
# Maintainer: Mikhail felixoid Shiryaev <mr.felixoid na gmail d com>

pkgname=vim-jinja-git
pkgver=20140319
pkgrel=1
pkgdesc="Adds Jinja2 highlighting support to Vim"
arch=('any')
url="https://github.com/mitsuhiko/vim-jinja"
license=('custom:BSD')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
source=("git+https://github.com/mitsuhiko/vim-jinja.git")
md5sums=('SKIP')

package() {
    cd ${srcdir}/vim-jinja

	installpath="${pkgdir}/usr/share/vim/vimfiles"

    install -Dm644 ftplugin/htmljinja.vim ${installpath}/ftplugin/htmljinja.vim
    install -Dm644 indent/htmljinja.vim ${installpath}/indent/htmljinja.vim
    install -Dm644 plugin/htmljinja.vim ${installpath}/plugin/htmljinja.vim
    install -Dm644 syntax/htmljinja.vim ${installpath}/syntax/htmljinja.vim
    install -Dm644 syntax/jinja.vim ${installpath}/syntax/jinja.vim

    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

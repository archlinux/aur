#Maintainer: Popolon <popolon aL popolon d0t org>
# generated with  pip2pkgbuild
# modified by hand

pkgname='python-sphinx-lua-ls'
_module='sphinx-lua-ls'
_src_folder='sphinx_lua_ls-3.8.1'
pkgver='3.8.1'
pkgrel=1
pkgdesc="Automatic documentation generation via EmmyLua/LuaLs, usable with sphinx"
url="None"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/45/16/06ffa4589938698a8a50bee1397429282e7c61d000967cb85a867eea9416/sphinx_lua_ls-3.8.1.tar.gz")
sha256sums=('d167beb28cfbb21681440f78edf64748aad3a571cfc9b5a9a9cbd148f7d614d0')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

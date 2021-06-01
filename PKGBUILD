# Maintainer: micouy <m.powierza@tutanota.com>
pkgname=kn
pkgver=0.2.2
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="cd alternative. Navigate by typing abbreviation of paths."
license=('MIT')

build() {
    return 0
}

package() {
    cd $srcdir
    sudo cargo install --root="/usr" --git=https://github.com/micouy/kn
    echo ""
    echo -e "\033[0;41m\033[1;37mUpdate Your shell scripts before using this app!\033[0m"
    echo "Fish:"
    echo "  Append \"_kn init fish \| source\" in \"~/.config/fish/config.fish\""
    echo "Bash:"
    echo "  Append \"eval \"\$(_kn init bash)\"\" in \"~/.bashrc\""
    echo "Zsh:"
    echo "  Append \"eval \"\$(_kn init zsh)\"\" in \"~/.zshrc\""
    echo ""
}

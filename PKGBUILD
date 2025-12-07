# Maintainer: ⭐️NINIKA⭐️ <moslike6@gmail.com>                                                                                                                                                                              
pkgname=git-pages-cli-bin
pkgver=1.5.1
pkgrel=1
pkgdesc='Command-line application for publishing sites to git-pages'
url='https://codeberg.org/git-pages/git-pages-cli'
source_x86_64=("git-pages-cli::https://codeberg.org/git-pages/git-pages-cli/releases/download/v$pkgver/git-pages-cli.linux-amd64")
source_aarch64=("git-pages-cli::https://codeberg.org/git-pages/git-pages-cli/releases/download/v$pkgver/git-pages-cli.linux-arm64")
noextract=('git-pages-cli')
arch=('x86_64' 'aarch64')
license=('0BSD')
sha256sums_x86_64=('8a8c047ff8fed28531bdeae9021e19196ba2a707a50c15cd8b898d3ad34766f8')
sha256sums_aarch64=('894dee793bded47a92d83c4d621b7422f0cf4b87e4871d227d927617e0fadb37')

package() {
    cd "$srcdir/"
    
    install -Dm755 git-pages-cli "${pkgdir}/usr/bin/git-pages-cli"
}

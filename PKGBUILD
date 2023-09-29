# Maintainer: dfgh <rrrrre123@foxmail.com>
pkgname=otf-serious-sans-nerd-git
pkgver=r179.a23f2b3
pkgrel=1
pkgdesc="A legible monospace font for playful professionals. Comic Sans for hackers with Nerd Font patch"
arch=('any')
conflicts=("otf-serious-sans-nerd-git")
provides=("otf-serious-sans-nerd-git")
url="https://github.com/kaBeech/serious-sans"
license=('MIT')
depends=()
makedepends=('git')
_commit="a23f2b303fa3b1ec8788c5abba67b44ca5a3cc0"
source=("repo::git+https://github.com/kaBeech/serious-sans#commit=${_commit}")
md5sums=(SKIP)

package()
{
    cd "$srcdir/repo"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "SeriousSans/otf/SeriousSansNerd.otf" "$pkgdir/usr/share/fonts/OTF/SeriousSansNerd.otf"

}

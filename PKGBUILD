# Maintainer: Murat <murat@muwat.org>

pkgname=ttf-lythmono-nerd-font
pkgver=0.10.0
pkgrel=1
pkgdesc="Patched Nerd Font aiming square-ish technical look and legibility at small sizes"
arch=('any')
url="https://github.com/why-trv/LythMono"
license=('OFL-1.1')
source=(
        "$url/releases/download/v$pkgver/LythMonoNerdFont.zip"
        "$url/releases/download/v$pkgver/LythMonoRoundNerdFont.zip"
        "$url/releases/download/v$pkgver/LythMonoSquareNerdFont.zip"
        "$url/releases/download/v$pkgver/LythMonoTermNerdFont.zip"
        "$url/releases/download/v$pkgver/LythMonoTermRoundNerdFont.zip"
        "$url/releases/download/v$pkgver/LythMonoTermSquareNerdFont.zip"
        "LICENSE::https://raw.githubusercontent.com/why-trv/LythMono/refs/heads/main/LICENSE.md"
)
sha256sums=('3500e7deefc4a36acda597655249ba95e2f660ec187131f26d10e3a966033573'
            '58e0c0bcde1b76b0dda9d7d91c7eb3b4ff7829797e29c7b6b7d1e911f5fec73b'
            '3b5d9f846b7e38e4f3efdfba38f4c4188aa40365ad73413827571004352f3e4d'
            '28c5e3657604141a5e10a1efd16f4c791163bb676998fb927a5445488448ff97'
            '46c3a84ca5fdd86a21888670bd2e56f208ff318d97c7945296c6b8620c087cdb'
            '74bb2a23e32312d7e4d6d0e3782bbc21c1e18eb36446e9b7351ec5c33934423a'
            '81b8afed5a258c059368f5df783ac2697d0d5062c6acefe2a8f70708a583f68e')

package() {
    install -d ${pkgdir}/usr/share/fonts/LythMono-Nerd-Font
    cp LythMonoNerdFont/TTF/*.ttf ${pkgdir}/usr/share/fonts/LythMono-Nerd-Font
    cp LythMonoRoundNerdFont/TTF/*.ttf ${pkgdir}/usr/share/fonts/LythMono-Nerd-Font
    cp LythMonoSquareNerdFont/TTF/*.ttf ${pkgdir}/usr/share/fonts/LythMono-Nerd-Font
    cp LythMonoTermNerdFont/TTF/*.ttf ${pkgdir}/usr/share/fonts/LythMono-Nerd-Font
    cp LythMonoTermRoundNerdFont/TTF/*.ttf ${pkgdir}/usr/share/fonts/LythMono-Nerd-Font
    cp LythMonoTermSquareNerdFont/TTF/*.ttf ${pkgdir}/usr/share/fonts/LythMono-Nerd-Font

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

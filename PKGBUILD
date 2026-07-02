# Maintainer: fridge <echo dW5sb3ZhYmxlX2ZyaWRnZTM1NkBhbGVlYXMuY29tCg== | base64 -d>
pkgname="plymouth-theme-manjaro-mac-style"
pkgver="1.0.0"
pkgrel="1"
pkgdesc="Boot animation with Manjaro logo, inspired by the boot animation of MacOS."
url="https://store.kde.org/p/2112595"
license=("GPL-3.0-only")
source=("images.tar.gz" "manjaro-mac-style.plymouth" "preview.png")
b2sums=("b1399d51056a3ff1baff324829acc1a3c6aed9541396fa13f3412dbb9bc2b50a4be0672ba5766993f04b8a8984fbf599583a182d3fe08ba65affe3c016edb9ff" "d7c4755148ace73c22ed26d259b99086c99c9f5ad2e8d56d5b776378770170c25d00e8ddcda8c2cb2d44c391d788b73030fa6f099055125fac32bdc121bf4e74" "3b92953069173cfc7a8d4043adc76f852dc41ba9f1c2d6a95ef19bcd97141dcb1dac7db86d86df37de8ae9259a5dbe9ed5f71f20f91fee8a2e7a651ba109db16")
arch=("any")
depends=("plymouth" "cantarell-fonts")
makedepends=("coreutils")
install="${pkgname}.install"
provides=("$pkgname=$pkgver")

package()
{
    local themeFolder; themeFolder="$pkgdir/usr/share/plymouth/themes/manjaro-mac-style"
    install -dv "$themeFolder"
    cp -afv {"images","manjaro-mac-style.plymouth","preview.png"} "$themeFolder"
}

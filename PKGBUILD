# Maintainer: Jian Wei Cheong <aur at jianwei dot anonaddy dot com>

pkgname=bibiman-bin
pkgver=0.15.0
pkgrel=1
pkgdesc='A TUI for fast and simple interacting with your BibLaTeX database.'
url='https://codeberg.org/lukeflo/bibiman'
license=('GPL-3.0-or-later')
provides=('bibiman')
conflicts=('bibiman' 'bibiman-git')
arch=('x86_64' 'aarch64')
source_x86_64=("https://codeberg.org/lukeflo/bibiman/releases/download/v$pkgver/bibiman-x86_64-gnu")
source_aarch64=("https://codeberg.org/lukeflo/bibiman/releases/download/v$pkgver/bibiman-aarch64-gnu")
b2sums_x86_64=('28b8668b255e95f7d01b8e43167b054879f6b5716b805b9fc0567692a5a12f73bde49dd533a107b4713a8c5bafd593958c47006bd36ce39283a81d0936ccf343')
b2sums_aarch64=('bfce3e13787be062ec0f4b90ab01e769eea42594f559c46d47abdf54b8747dae7a575097bdc82e15d2acaaa4e96cac72b8a6e7eeeae889428c5532e2d6000c38')

package() {
    cd "$srcdir/"

    install -Dm0755 "bibiman-${CARCH}-gnu" "$pkgdir/usr/bin/bibiman"
}

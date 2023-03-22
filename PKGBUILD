# Maintainer: Ayush Agarwal <ayush at ayushnix dot com>

pkgname=tessen
pkgver=2.2.0
pkgrel=1
pkgdesc="An interactive menu to autotype and copy password-store and gopass data"
arch=(any)
url="https://sr.ht/~ayushnix/tessen/"
_url="https://git.sr.ht/~ayushnix/tessen"
license=('GPL2')
makedepends=('scdoc')
optdepends=('pass: supported pass backend'
            'gopass: supported pass backend'
            'wtype: to autotype data'
            'wl-clipboard: to copy data'
            'libnotify: to send notifications about copied data'
            'fuzzel: wayland native dmenu backend'
            'tofi: wayland native dmenu backend'
            'bemenu: wayland native dmenu backend'
            'yofi: wayland native dmenu backend'
            'wofi: wayland native dmenu backend'
            'rofi-lbonn-wayland-git: the wayland native fork of rofi'
            'pass-otp: to generate OTP'
            'xdg-utils: to open URLs in default web browser')
source=("$_url/refs/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('138a75490fab00d2ffce3950dab4314f61449bb9800f5fbab4d131e4f81fa1f1')
install=tessen.install

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="${pkgdir}" install
}

# Maintainer: berberman <hatsue@typed.icu>

pkgname=nix-prefetch-git
pkgver=0.0.0
pkgrel=2
arch=('x86_64')
depends=('bash' 'nix')
source=('nix-prefetch-git::https://raw.githubusercontent.com/NixOS/nixpkgs/bb149eb1192f278f95d0b870140750aac1bd81c0/pkgs/build-support/fetchgit/nix-prefetch-git')
md5sums=('b6614f23e4b4d3f8523d79972daad135')

package (){
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}

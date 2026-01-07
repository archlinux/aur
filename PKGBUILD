# Maintainer: RayZ3R0 <rayz3r0@example.com>
pkgname=sonami-bin
pkgver=0.1.1_alpha.7  # Arch uses underscore, GitHub uses hyphen
pkgrel=1
pkgdesc="A lightweight, cross-platform music player built with Tauri"
arch=('x86_64')
url="https://github.com/RayZ3R0/sonami"
license=('AGPL-3.0')
provides=('sonami')
conflicts=('sonami')
depends=('webkit2gtk' 'gtk3' 'libappindicator-gtk3')

# This logic handles the translation between Arch version (_) and GitHub version (-)
_realver="${pkgver//_/-}"
source=("${url}/releases/download/v${_realver}/sonami_${_realver}_amd64.deb")
sha256sums=('b1590afee7e9e7537cefcbc0ed63c20e8bc60a84695c0fd98906d7303d204fb9')

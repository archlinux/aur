# Maintainer: Hiro <31057166+HiroGitea@users.noreply.github.com>
# Generated from PKGBUILD-bin.in by .github/workflows/release.yml -- do not edit by hand.
pkgname=ksystemstats-infiniband-bin
_pkgname=ksystemstats-infiniband
pkgver=1.0.1
pkgrel=1
pkgdesc="KDE System Monitor sensor plugin exposing InfiniBand port counters (RDMA-aware) (prebuilt)"
arch=('x86_64')
url="https://github.com/HiroGitea/ksystemstats-infiniband"
license=('GPL-2.0-or-later')
depends=('libksysguard' 'kcoreaddons' 'qt6-base')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "$_pkgname-git")
source=("$pkgname-$pkgver.pkg.tar.zst::https://github.com/HiroGitea/ksystemstats-infiniband/releases/download/v1.0.1/ksystemstats-infiniband-1.0.1-1-x86_64.pkg.tar.zst")
sha256sums=('e1a8ddc33a194fe5bda72edc8cbe0603623d0489242e9b4eb8a1dce0ecc010b6')
noextract=("$pkgname-$pkgver.pkg.tar.zst")

package() {
  # The upstream artifact is already a pacman package; unpack its payload.
  bsdtar -x -f "$srcdir/$pkgname-$pkgver.pkg.tar.zst" -C "$pkgdir" --exclude '.*' usr
}

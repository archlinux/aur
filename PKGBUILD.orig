# Maintainer: Echo J. <aidas957 at gmail dot com>
# shellcheck shell=bash disable=SC2034

# Note: I hope wael is a nice woman now :troll:

_pkgname=vinegar
pkgname=vinegar-git
pkgver=1.0.1.r2.ge817411
pkgrel=1
pkgdesc="A transparent wrapper for Roblox Player and Roblox Studio (Git version)"
arch=("x86_64")
url="https://github.com/vinegarhq/vinegar"
license=("GPL3")
depends=("glibc" "hicolor-icon-theme")
makedepends=("git" "go")
conflicts=("vinegar")
source=("git+${url}")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"

  # Interesting Go boilerplate (this is my first time packaging Go stuff)
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=vendor -modcacherw"

  make VERSION="${pkgver}" DESTDIR="${pkgdir}" PREFIX="/usr" vinegar
}

package() {
  cd "${srcdir}/${_pkgname}"

  # This does all the work (except for the optional LICENSE file)
  make VERSION="${pkgver}" DESTDIR="${pkgdir}" PREFIX="/usr" install

  # Fix up the .desktop files (as I expected, Vinegar is a mess)
  _player=io.github.vinegarhq.Vinegar.player.desktop
  _studio=io.github.vinegarhq.Vinegar.studio.desktop
  _playermime="x-scheme-handler/roblox;x-scheme-handler/roblox-player;"
  _studiomime="application/x-roblox-rbxl;application/x-roblox-rbxlx;x-scheme-handler/roblox-studio;x-scheme-handler/roblox-studio-auth;"

  desktop-file-edit --remove-key="MimeType" "${pkgdir}/usr/share/applications/${_player}"
  desktop-file-edit --remove-key="MimeType" "${pkgdir}/usr/share/applications/${_studio}"
  desktop-file-edit --set-key="MimeType" --set-value="${_playermime}" "${pkgdir}/usr/share/applications/${_player}"
  desktop-file-edit --set-key="MimeType" --set-value="${_studiomime}" "${pkgdir}/usr/share/applications/${_studio}"

  # Install GPLv3 license (just in case)
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

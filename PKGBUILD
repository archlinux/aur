# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer:  Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Maintainer:  Truocolo <truocolo@aol.com>

_py="python"
_pkg="grok"
pkgname="${_pkg}"
pkgver=0.0.1
pkgrel=1
_pkgdesc=(
  ohoh
)
pkgdesc="${_pkgdesc[*]}"
arch=(
  'x86_64'
  'i686'
  'pentium4'
  'arm'
  'armv7h'
  'aarch64'
  'mips'
)
_http="https://github.com"
_ns="openai"
url="${_http}/${_ns}/${_pkg}"
license=(
  'lol'
)
depends=(
  # "${_py}-futures"
  # "${_py}-singledispatch"
  # "${_py}-backports-abc"
)
optdepends=(
  # "${_py}-monotonic: enable support for a monotonic clock"
  # "${_py}-pycurl: for ${_pkg}.curl_httpclient"
  # "${_py}-twisted: for ${_pkg}.platform.twisted"
  # "${_py}-pycares: an alternative non-blocking DNS resolver"
)
makedepends=(
  "${_py}-setuptools"
)
checkdepends=(
  # "${_py}-pycurl"
  # "${_py}-mock"
  # "${_py}-twisted"
  # "${_py}-trollius"
  # "${_py}-monotonic"
)
provides=(
  "${_py}-${_pkg}=${pkgver}"
)
conflicts=(
  "${_py}-${_pkg}=${pkgver}"
)
_commit="3d64b1d8c1d595dd8ebdb7771998823f1b14c7b3"
source=(
  "${pkgname}-${pkgver}.zip::${url}/archive/${_commit}.zip"
)
sha512sums=(
  'hijess'
)

build() {
  cd \
    "${_pkg}-${pkgver}"
  "${_py}" \
    setup.py \
      build
}

package() {
  cd \
    "${_pkg}-${pkgver}"
  "${_py}" \
    setup.py \
      install \
        --root="${pkgdir}" \
        --optimize=1
}

# vim:set sw=2 sts=-1 et:

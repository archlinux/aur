# Maintainer: silentnoodle
pkgbase=johncena141-meta
pkgname=('johncena141-meta-intel' 'johncena141-meta-nvidia' 'johncena141-meta-amd')
pkgver=1
pkgrel=1
pkgdesc="meta package for johncena141"
arch=('any')
url="https://johncena141.eu.org:8141/reqs"
license=('GLP')

depends=(
  'zpaq'
  'giflib'
  'gnutls'
  'gst-plugins-bad'
  'gst-plugins-base'
  'gst-plugins-base-libs'
  'gst-plugins-good'
  'gst-plugins-ugly'
  'jq'
  'lib32-giflib'
  'lib32-gnutls'
  'lib32-gst-plugins-base-libs'
  'lib32-libjpeg-turbo'
  'lib32-libldap'
  'lib32-libpng'
  'lib32-libxcomposite'
  'lib32-libxinerama'
  'lib32-libxslt'
  'lib32-mpg123'
  'lib32-opencl-icd-loader'
  'lib32-sdl2'
  'lib32-v4l-utils'
  'libgphoto2'
  'libjpeg-turbo'
  'libldap'
  'libpng'
  'libxcomposite'
  'libxinerama'
  'libxslt'
  'mono'
  'mpg123'
  'opencl-icd-loader'
  'sdl2'
  'v4l-utils'
  'wine-staging'
  'libxcrypt-compat'
)

package_johncena141-meta-nvidia() {
  depends=(
    'lib32-libglvnd'
    'lib32-nvidia-utils'
    'lib32-vulkan-icd-loader'
    'libglvnd'
    'vulkan-icd-loader'
    'vulkan-driver'
  )
  optdepends=(
    'nvidia: for the stanard kernel'
    'nvidia-dmks: for dynamic kernel module'
  )
}

package_johncena141-meta-amd() {
  depends=(
    'gamescope'
    'lib32-vulkan-icd-loader'
    'lib32-vulkan-radeon'
    'vulkan-icd-loader'
    'vulkan-radeon'
  )
}

package_johncena141-meta-intel() {
  depends=(
    'lib32-libglvnd'
    'lib32-vulkan-icd-loader'
    'lib32-vulkan-intel'
    'vulkan-icd-loader'
    'vulkan-intel'
  )
}

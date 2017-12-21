# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Command line tools for managing SROS2 keys."
url='http://www.ros.org/'

pkgname='ros-ardent-sros2'
pkgver='0.4.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('Apache License 2.0')

ros_makedepends=()
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-ardent-ros2cli)
depends=(${ros_depends[@]}
  openssl)

# Git version (e.g. for debugging)
# _tag=release/ardent/sros2/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros2-gbp/sros2-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="sros2-release-release-ardent-sros2-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros2-gbp/sros2-release/archive/release/ardent/sros2/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('63e0f19bfabb05012a9484c58674295347e108e0a73385eeb1ff5ae65797349f')

package() {
  cd "${srcdir}/${_dir}"
  python setup.py install --root="$pkgdir" --prefix="/opt/ros/ardent" --optimize=1
}

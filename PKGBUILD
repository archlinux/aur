# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - The command line tools for the ament buildsystem."
url='http://www.ros.org/'

pkgname='ros-ardent-ament-tools'
pkgver='0.4.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('Apache License 2.0')

ros_makedepends=()
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-ardent-ament-package
  ros-ardent-osrf-pycommon)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/ardent/ament_tools/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros2-gbp/ament_tools-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ament_tools-release-release-ardent-ament_tools-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros2-gbp/ament_tools-release/archive/release/ardent/ament_tools/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('99292e3bd164d05a29a9b0b21091e5806b7fe4b85b43856991d0b7e8b3caf4a8')

package() {
  cd "${srcdir}/${_dir}"
  python setup.py install --root="$pkgdir" --prefix="/opt/ros/ardent" --optimize=1
}

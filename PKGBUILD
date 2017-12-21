# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Examples of creating and using exectors to run multiple nodes in the same process."
url='http://www.ros.org/'

pkgname='ros-ardent-examples-rclpy-executors'
pkgver='0.4.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('Apache License 2.0')

ros_makedepends=()
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-ardent-std-msgs
  ros-ardent-rclpy)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/ardent/examples_rclpy_executors/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros2-gbp/examples-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="examples-release-release-ardent-examples_rclpy_executors-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros2-gbp/examples-release/archive/release/ardent/examples_rclpy_executors/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('922bb76d7dfcc2d2ad5e6541f1f47db4e803d238b006eb0681e0d9de99ccac0b')

package() {
  cd "${srcdir}/${_dir}"
  python setup.py install --root="$pkgdir" --prefix="/opt/ros/ardent" --optimize=1
}

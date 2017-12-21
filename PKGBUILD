# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - A robot-agnostic teleoperation node to convert keyboard commands to Twist messages."
url='http://wiki.ros.org/teleop_twist_keyboard'

pkgname='ros-ardent-teleop-twist-keyboard'
pkgver='2.0.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD License 2.0')

ros_makedepends=()
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-ardent-rclpy
  ros-ardent-geometry-msgs)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/ardent/teleop_twist_keyboard/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros2-gbp/teleop_twist_keyboard-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="teleop_twist_keyboard-release-release-ardent-teleop_twist_keyboard-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros2-gbp/teleop_twist_keyboard-release/archive/release/ardent/teleop_twist_keyboard/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('6e85af1a3949be3a30bcc56536cbde6942352ab3fbb6a3e0a5508cde6bada653')

package() {
  cd "${srcdir}/${_dir}"
  python setup.py install --root="$pkgdir" --prefix="/opt/ros/ardent" --optimize=1
}

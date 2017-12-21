# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Package containing tools for monitoring ROS 2 topics."
url='http://www.ros.org/'

pkgname='ros-ardent-topic-monitor'
pkgver='0.4.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('Apache License 2.0')

ros_makedepends=()
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-ardent-launch
  ros-ardent-std-msgs
  ros-ardent-rclpy
  ros-ardent-ros2run)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/ardent/topic_monitor/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros2-gbp/demos-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="demos-release-release-ardent-topic_monitor-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros2-gbp/demos-release/archive/release/ardent/topic_monitor/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('c4dbf536534a409254a744c0b7403c96712c8e5038039432b31a58138bac6172')

package() {
  cd "${srcdir}/${_dir}"
  python setup.py install --root="$pkgdir" --prefix="/opt/ros/ardent" --optimize=1
}

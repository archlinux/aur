# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - The ability to check code against the style conventions in PEP 8 and generate xUnit test result files."
url='http://www.ros.org/'

pkgname='ros-ardent-ament-pep257'
pkgver='0.4.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('Apache License 2.0, MIT')

ros_makedepends=()
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=()
depends=(${ros_depends[@]}
  pydocstyle)

# Git version (e.g. for debugging)
# _tag=release/ardent/ament_pep257/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros2-gbp/ament_lint-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ament_lint-release-release-ardent-ament_pep257-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros2-gbp/ament_lint-release/archive/release/ardent/ament_pep257/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('a88be8e660873d783733af45d6c6a0e685b6cc3ca2969389163fb7dd4bc1d726')

package() {
  cd "${srcdir}/${_dir}"
  python setup.py install --root="$pkgdir" --prefix="/opt/ros/ardent" --optimize=1
}

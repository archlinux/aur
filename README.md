# README for Qt 5 mingw-w64 packages
## Development, building, issues
* All PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where you also find the URL of a binary repository.
* Issues are tracks there as well.
* All patches are managed at https://github.com/Martchus/qtbase, https://github.com/Martchus/qttools, ...

### Build order
Qt packages can be built in the following order (for example):
```
qt5-base qt5-base-static qt5-svg qt5-declarative qt5-tools qt5-xmlpatterns qt5-script qt5-imageformats qt5-location qt5-multimedia qt5-sensors qt5-webchannel qt5-3d qt5-quickcontrols qt5-quickcontrols2 qt5-translations qt5-websockets qt5-winextras qt5-serialport qt5-canvas3d qt5-connectivity qt5-charts qt5-graphicaleffects qt5-gamepad qt5-scxml qt5-datavis3d qt5-virtualkeyboard qt5-activeqt qt5-speech qt5-remoteobjects qt5-networkauth qt5-webkit
```

### Executables
By default, executables will be present in the package because I find them useful for testing. To remove executables,
set NO_EXECUTABLES (or NO_STATIC_EXECUTABLES to remove statically linked executables only) when building the package.
If Qt modules containing tools are built as static and as dynamic library only the dynamically linked tools will be present
in the package.

## Variants
There are different variants of the package which can be selected by simply adjusting pkgname:

| Package name                                            | Customization                                                          |
| ------------------------------------------------------- | -----------------------------------------------------------------------|
| mingw-w64-qt5-base-dynamic, mingw-w64-qt5-base-dynamic  | allows choosing between ANGLE and native OpenGL dynamically at runtime |
| mingw-w64-qt5-base-opengl                               | using native OpenGL                                                    |
| mingw-w64-qt5-base-angle                                | using ANGLE rather than native OpenGL                                  |
| mingw-w64-qt5-base-noopenql                             | no OpenGL support                                                      |

* The variants are conflicting (and hence can not be installed at the same time).
* It is also possible to use the software rasterizer provided by mingw-w64-mesa as a drop-in replacement for the regular OpenGL libraries.
* See also: http://doc.qt.io/qt-5/windows-requirements.html#dynamically-loading-graphics-drivers

## Static libraries
The variants listed above only contain dynamic libraries. For building static libraries
just append `-static` to the package name, eg. `mingw-w64-qt5-base-static` or `mingw-w64-qt5-base-angle-static`.

The static variants rely on the corresponding dynamic variant for headers and tools.
I only tested the static variant using native OpenGL so far (`mingw-w64-qt5-base-static`).
Note that ANGLE will still be loaded as dynamic library in `mingw-w64-qt5-base-dynamic-static`.

Further Qt modules (those not found in the base repository) include by default static and dynamic libraries; if only one
version is requried, just set `NO_STATIC_LIBS` or `NO_SHARED_LIBS` when building the package, eg. by adding `NO_STATIC_LIBS=1`
to `/etc/makepkg.conf`.

### Using static libraries
By default, CMake and qmake will link against the dynamic Qt libraries.

#### CMake
To use the static Qt libraries with CMake prepend the Qt module name with Static, eg.:
```
find_package(Qt5Core) becomes find_package(StaticQt5Core)
```

To use a static module, add the corresponding imported target, eg.:
```
target_link_libraries(target ... StaticQt5::Core)
```

This approach allows installing dynamic and static Qt in the same prefix
and using both variants in the same CMake project.

To use a static plugin, add the corresponding imported target, eg.:
```
target_link_libraries(target ... StaticQt5::QWindowsIntegrationPlugin)
```

Automatically importing static plugins is currently not possible, though.
Hence it is required to use Q_IMPORT_PLUGIN, eg.:
```
#include<QtPlugin>
Q_IMPORT_PLUGIN(QWindowsIntegrationPlugin)
```

It is also possible to use static Qt libraries with CMake by setting the
variable `USE_STATIC_QT_BY_DEFAULT`: `set(USE_STATIC_QT_BY_DEFAULT ON)`

In this case the regular imported targets (eg. `Qt5::Core`) will be static.
This approach does *not* allow to use dynamic and static Qt in the same
CMake project.

#### qmake
To use the static Qt libraries with qmake add 'static' to the project config (either inside the *.pro file or as qmake argument):
```
CONFIG+=static
```

Currently qmake is messing with linker flags for cyclic dependencies and static MariaDB is unavailable due to clashing symbols.
To workaround these issues, use the following arguments:
```
CONFIG+=no_smart_library_merge QTPLUGIN.sqldrivers=qsqlite  QTPLUGIN.sqldrivers+=qsqlpsql QTPLUGIN.sqldrivers+=qsqlodbc
```

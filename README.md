# openpilot-cabana

AUR package for [Cabana](https://github.com/commaai/openpilot/tree/master/openpilot/tools/cabana), the CAN bus visualizer and DBC editor from comma.ai openpilot. It is maintained at [P6g9YHK6/openpilot-cabana-arch](https://github.com/P6g9YHK6/openpilot-cabana-arch).

## Install size

Cabana calls Python at runtime for remote routes, login, log migration and the WebRTC device bridge. The package therefore bundles Python 3.12, its dependencies and the openpilot modules under `/opt/openpilot-cabana`, about 700 MB installed.

## Changes in 2.0

The package now builds the official imgui Cabana from `commaai/openpilot` rather than the Qt app from `deanlee/openpilot-cabana`. Vector ASC, candump and PEAK TRC log files are no longer supported. Supported sources are openpilot routes, Panda, SocketCAN and msgq.

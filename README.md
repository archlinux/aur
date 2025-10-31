# mqtt_console_client

A simple C++ MQTT console client with JSON parsing, wildcard topics, and QoS support.

## Build

```bash
mkdir build && cd build
cmake ..
make
:


./mqtt_client -s test.mosquitto.org -p 1883 -t "sensors/#" -Q 1

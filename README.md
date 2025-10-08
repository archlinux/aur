# ESP8266 nonOS SDK (Extended Version)

This package provides the ESP8266 nonOS SDK with several enhancements:

- **Python3 support** for build scripts and tools.
- **New LED blink example project** (`led_blink`) included as a template for future projects.
- **Improved Makefile** in the `led_blink` example, allowing you to build the project from any location (out-of-tree builds).
- **Minor changes in the main Makefile** in the root `ESP8266_NONOS_SDK` folder to improve compatibility. These changes were necessary for the improved Makefile in the `led_blink` example to support out-of-tree builds.

## How to Use Out-of-Tree Builds

To take advantage of building projects outside the main SDK folder:

1. **Copy the `led_blink` example project** from `/opt/esp8266-nonos-sdk/examples` to your desired location.
2. Develop your own project based on this template.
3. Build your project using the provided Makefile.

Alternatively, for existing projects that use the old Makefile:

- **Copy the improved Makefile** from the `led_blink` example folder into your project directory.
- Adjust the Makefile as needed for your project files.

## Compilation Instructions

To compile your project in the simplest way, run:

```
make COMPILE=gcc BOOT=new APP=1 SPI_SPEED=40 SPI_MODE=DIO SPI_SIZE_MAP=6
```

You may need to adjust these parameters to match your specific ESP8266 module.

## Output Files

- The compilation results, including firmware files ready for flashing, are located in the `bin` folder of your project (e.g., `led_blink/bin`).
- Additional files such as the bootloader are available in `/opt/esp8266-nonos-sdk/bin`.

## Note

Minor changes have also been made to the main Makefile in the root `ESP8266_NONOS_SDK` folder.  
If you use the provided package, everything should work out of the box.

## Requirements

- Python 3
- [xtensa-lx106-elf-gcc-bin](https://aur.archlinux.org/packages/xtensa-lx106-elf-gcc-bin) toolchain (optional, for building firmware)

## Repositories

- [Official ESP8266_NONOS_SDK](https://github.com/espressif/ESP8266_NONOS_SDK)
- [My fork ESP8266_NONOS_SDK](https://github.com/krzkuc1985/ESP8266_NONOS_SDK)

## License

Espressif MIT

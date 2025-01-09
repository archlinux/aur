# Ditana KoboldCpp

Ditana KoboldCpp is a systemd service that runs [KoboldCpp](https://github.com/LostRuins/koboldcpp) with the [Gemma language model](https://huggingface.co/bartowski/gemma-2-2b-it-GGUF) locally, providing you with private AI chat capabilities on your PC.

## Features

- Installs and configures KoboldCpp with the Gemma 2-2b-it model
- Includes a custom `logical_sampler_gemma_instruct.json` for optimal performance
- Provides a desktop icon for easy access
- Runs as a background service, eliminating the need for manual management
- Automatic service management, including updates
- Low resource usage, suitable for systems without dedicated GPUs
- Requires AVX2 support

## Installation

This package is available both in the Ditana Arch Repository and [in the Arch User Repository (AUR)](https://aur.archlinux.org/packages/ditana-koboldcpp). You can install it using an AUR helper like `pikaur`:

```
pikaur -S ditana-koboldcpp
```

The service will be automatically enabled and started after installation.

## Usage

After installation, the KoboldCpp service should be running automatically. You can:

1. Check the service status:
   ```
   systemctl status koboldcpp.service
   ```

2. Access the KoboldCpp interface by opening your web browser and navigating to:
   ```
   http://localhost:5001
   ```

   Alternatively, you can use the desktop icon installed in your applications menu.

## Installation Details

The package implements a sophisticated installation process to ensure optimal user experience while maintaining reasonable package sizes:

- The KoboldCpp binary is pre-built and included in the package to avoid lengthy compilation times on the user's system.
- The Gemma model (approximately 2GB) is automatically downloaded during package installation rather than being included in the package itself. This approach:
  - Keeps the package size manageable
  - Reduces server bandwidth usage
  - Ensures immediate usability after installation
  - Avoids the need for additional user intervention
- The downloaded model is verified using SHA256 checksum to ensure integrity
- All necessary permissions are automatically set for the koboldcpp service user

This design balances package size, installation time, and immediate usability while following best practices for Linux package management.

## Integration with Ditana Assistant

This package can be optionally used with the [Ditana Assistant](https://github.com/acrion/ditana-assistant) project to provide a local server alternative to the OpenAI API.

## Technical Details

- Based on [KoboldCpp](https://github.com/LostRuins/koboldcpp)
- Uses the [Gemma 2-2b-it model (Q6_K quantization)](https://huggingface.co/bartowski/gemma-2-2b-it-GGUF)
- Includes a systemd service for automatic management
- Desktop entry for easy access
- Custom icon for better integration with your desktop environment
- Automatic service management script for handling installation, upgrades, and removal
- Requires CPU with AVX2 support (checked during installation)

## License

This project is licensed under the AGPL-3.0-only License.

## Acknowledgements

- KoboldCpp by LostRuins Concedo
- Gemma model by Google, converted by Bartowski (Hugging Face)
- Systemd service and packaging by Stefan Zipproth

## Support

For issues, feature requests, or contributions, please use the GitHub issue tracker or submit a pull request.

---

Ditana KoboldCpp is part of the [Ditana GNU/Linux project](https://ditana.org), aiming to provide sophisticated customization options for enthusiasts interested in optimizing their workflows and exploring Linux.

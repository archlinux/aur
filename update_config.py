#!/usr/bin/env python3
# Update the `zls.json` file with our added configuration
import json
import sys

# Additional configuration, as definied here:
# https://github.com/zigtools/zls#configuration-options
ADDITIONAL_CONFIGURATION = {
    # We install the build runner globally
    "build_runner_path": "/usr/share/zls/build_runner.zig",
}

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Insufficient arguments", file=sys.stderr)
        sys.exit(1)
    zls_config_file = sys.argv[1]
    print(f"Updating ZLS config file: {zls_config_file}")
    with open(zls_config_file, 'rt') as f:
        original_data = json.load(f)
    # If there is any overlapping keys, we fail-fast
    # If the `zls.json` file conflicts with this that is a big problem 
    overlapping_keys = set(original_data.keys()) & ADDITIONAL_CONFIGURATION.keys()
    if overlapping_keys:
        print(f"Overlapping keys: {overlapping_keys}", file=sys.stderr)
        sys.exit(1)
    updated_data = dict(original_data)  # Copy
    updated_data.update(ADDITIONAL_CONFIGURATION)
    # Overwite in place
    with open(zls_config_file, 'wt') as f:
        json.dump(updated_data, f, indent=4)

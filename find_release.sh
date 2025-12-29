#!/usr/bin/env bash

# Use Python script with Playwright to extract version from dynamically loaded page
# The download link is loaded via JavaScript, so we need a headless browser
# The script now handles version comparison and build.env writing internally
# Use virtual environment if it exists (for local development)
if [ -d ".venv" ]; then
    .venv/bin/python find_release.py
else
    python3 find_release.py
fi

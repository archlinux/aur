# routekit

A tool for managing and visualizing Linux routing tables.

## Features

- Displays routing tables in a structured and colored format
- Supports alternative routing tables (e.g. `local`, `main`, etc.)
- Root check and graceful error handling

## Usage

```bash
routekit show                # Show main routing table
routekit show table local   # Show local routing table
```

## Installation

Install from AUR:
```bash
yay -S routekit
```
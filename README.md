# Kronos

Kronos is a smarter file transfer wrapper that unifies `rsync`, `rclone`, and related Unix tools under a single command. It provides safe defaults, automatic mode selection, and integrity checks to make moving files over SSH reliable and efficient.

## Overview

Traditional tools such as `scp`, `rsync`, and `rclone` are powerful but require manual decision-making and detailed flags. Kronos removes that friction:

- Small files and directories are transferred directly with `rsync`.
- Large single files are split into parts and fetched in parallel using `rclone` over SFTP.
- All transfers are verified against SHA-256 checksums for data integrity.
- Resume is supported: already-downloaded parts are skipped on re-run.
- Temporary parts are automatically cleaned up after a successful transfer.

Kronos is designed to be predictable and transparent. It chooses the right strategy based on file size and user options, while giving clear warnings about thresholds, ports, and part counts.

## Key Features

- **Automatic mode selection**  
  - `rsync` for directories and small files.  
  - Split and parallel transfer for large files.  

- **Parallel transfers**  
  - User-selectable number of parts (`--parts N`).  
  - Size-based chunking (`--size CHUNK`).  

- **Safe defaults**  
  - Default port 22 (with a warning if unspecified).  
  - Default to 1 part (rsync).  
  - `--parts` without a number defaults to 8 equal parts.  

- **Integrity verification**  
  - SHA-256 checksums ensure merged files match the original.  

- **Resumable and clean**  
  - Skips completed parts.  
  - Cleans up remote and local cache on success.  

## Why Kronos

- **Simpler**: one command instead of remembering when to use `scp`, `rsync`, or `rclone`.  
- **Safer**: checksum verification and resume support reduce the risk of silent corruption or wasted bandwidth.  
- **Faster**: large files are transferred in parallel streams, often saturating available bandwidth better than single-stream tools.  
- **Transparent**: clear warnings about thresholds, defaults, and potential rate limiting.  

Kronos does not replace `rsync` or `rclone` but builds on them, offering a unified interface that covers common use cases with less effort and fewer mistakes.
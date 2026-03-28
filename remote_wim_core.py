from __future__ import annotations

import os
import tempfile
import threading
from concurrent.futures import ThreadPoolExecutor, as_completed
import ctypes
import ctypes.util
import fnmatch
import hashlib
import math
import struct
from collections.abc import Callable
from dataclasses import dataclass
from pathlib import Path

from remote_udf import (
    ExtentMappedReader,
    HttpRangeReader,
    ProbeError,
    TimingStats,
    align_up,
    find_named_child,
    find_udf_file_entry,
    sample_names,
    split_path,
)


DEFAULT_ISO_URL = (
    "https://software-static.download.prss.microsoft.com/dbazure/"
    "888969d5-f34g-4e03-ac9d-1f9786c66749/"
    "26100.1742.240906-0331.ge_release_svc_refresh_"
    "CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso"
)

WIM_MAGIC = b"MSWIM\0\0\0"
WIM_RESHDR_FLAG_METADATA = 0x02
WIM_RESHDR_FLAG_COMPRESSED = 0x04
WIM_RESHDR_FLAG_SOLID = 0x10

WIM_COMPRESSION_NONE = 0
WIM_COMPRESSION_XPRESS = 1
WIM_COMPRESSION_LZX = 2
WIM_COMPRESSION_LZMS = 3

WIM_HDR_FLAG_COMPRESS_XPRESS = 0x00020000
WIM_HDR_FLAG_COMPRESS_LZX = 0x00040000
WIM_HDR_FLAG_COMPRESS_LZMS = 0x00080000
WIM_HDR_FLAG_COMPRESS_XPRESS2 = 0x00200000

FILE_ATTRIBUTE_DIRECTORY = 0x10


@dataclass(frozen=True)
class WimResource:
    size_in_wim: int
    flags: int
    offset_in_wim: int
    uncompressed_size: int

    @property
    def is_compressed(self) -> bool:
        return bool(self.flags & WIM_RESHDR_FLAG_COMPRESSED)

    @property
    def is_metadata(self) -> bool:
        return bool(self.flags & WIM_RESHDR_FLAG_METADATA)

    @property
    def is_solid(self) -> bool:
        return bool(self.flags & WIM_RESHDR_FLAG_SOLID)


@dataclass(frozen=True)
class BlobEntry:
    resource: WimResource
    sha1: bytes


@dataclass(frozen=True)
class ExtractTask:
    path: str
    blob: BlobEntry
    destination: Path


@dataclass(frozen=True)
class WimHeader:
    version: int
    flags: int
    chunk_size: int
    blob_table: WimResource


@dataclass(frozen=True)
class WimDentry:
    name: str
    attributes: int
    subdir_offset: int
    main_hash: bytes

    @property
    def is_dir(self) -> bool:
        return bool(self.attributes & FILE_ATTRIBUTE_DIRECTORY)


class WimlibDecompressor:
    def __init__(self) -> None:
        libname = ctypes.util.find_library("wim")
        if not libname:
            raise ProbeError("libwim not found; install wimlib")

        self.lib = ctypes.CDLL(libname)
        self.lib.wimlib_create_decompressor.argtypes = [
            ctypes.c_int,
            ctypes.c_size_t,
            ctypes.POINTER(ctypes.c_void_p),
        ]
        self.lib.wimlib_create_decompressor.restype = ctypes.c_int
        self.lib.wimlib_decompress.argtypes = [
            ctypes.c_void_p,
            ctypes.c_size_t,
            ctypes.c_void_p,
            ctypes.c_size_t,
            ctypes.c_void_p,
        ]
        self.lib.wimlib_decompress.restype = ctypes.c_int
        self.lib.wimlib_free_decompressor.argtypes = [ctypes.c_void_p]
        self.lib.wimlib_free_decompressor.restype = None
        self._cache: dict[tuple[int, int], ctypes.c_void_p] = {}

    def _get_handle(self, compression_type: int, chunk_size: int) -> ctypes.c_void_p:
        key = (compression_type, chunk_size)
        handle = self._cache.get(key)
        if handle is not None:
            return handle

        out = ctypes.c_void_p()
        result = self.lib.wimlib_create_decompressor(
            compression_type, chunk_size, ctypes.byref(out)
        )
        if result != 0:
            raise ProbeError(
                f"failed to create decompressor for type={compression_type} chunk_size={chunk_size}: {result}"
            )

        self._cache[key] = out
        return out

    def decompress(
        self, compression_type: int, chunk_size: int, data: bytes, out_size: int
    ) -> bytes:
        handle = self._get_handle(compression_type, chunk_size)
        in_buf = ctypes.create_string_buffer(data)
        out_buf = ctypes.create_string_buffer(out_size)
        result = self.lib.wimlib_decompress(
            ctypes.cast(in_buf, ctypes.c_void_p),
            len(data),
            ctypes.cast(out_buf, ctypes.c_void_p),
            out_size,
            handle,
        )
        if result != 0:
            raise ProbeError(f"wimlib decompression failed with code {result}")
        return out_buf.raw[:out_size]

    def close(self) -> None:
        for handle in self._cache.values():
            self.lib.wimlib_free_decompressor(handle)
        self._cache.clear()

    def __del__(self) -> None:
        try:
            self.close()
        except Exception:
            pass


def parse_wim_resource(data: bytes, offset: int) -> WimResource:
    return WimResource(
        size_in_wim=int.from_bytes(data[offset : offset + 7], "little"),
        flags=data[offset + 7],
        offset_in_wim=struct.unpack_from("<Q", data, offset + 8)[0],
        uncompressed_size=struct.unpack_from("<Q", data, offset + 16)[0],
    )


def compression_type_from_flags(flags: int) -> int:
    if flags & WIM_HDR_FLAG_COMPRESS_LZMS:
        return WIM_COMPRESSION_LZMS
    if flags & WIM_HDR_FLAG_COMPRESS_LZX:
        return WIM_COMPRESSION_LZX
    if flags & WIM_HDR_FLAG_COMPRESS_XPRESS2:
        return WIM_COMPRESSION_XPRESS
    if flags & WIM_HDR_FLAG_COMPRESS_XPRESS:
        return WIM_COMPRESSION_XPRESS
    return WIM_COMPRESSION_NONE


def parse_wim_header(data: bytes) -> WimHeader:
    if len(data) < 80:
        raise ProbeError("short WIM header")
    if data[:8] != WIM_MAGIC:
        raise ProbeError(f"unexpected WIM magic: {data[:8]!r}")

    return WimHeader(
        version=struct.unpack_from("<I", data, 12)[0],
        flags=struct.unpack_from("<I", data, 16)[0],
        chunk_size=struct.unpack_from("<I", data, 20)[0],
        blob_table=parse_wim_resource(data, 48),
    )


def chunk_entry_size(uncompressed_size: int) -> int:
    return 4 if uncompressed_size <= 0xFFFFFFFF else 8


def parse_security_length(metadata: bytes) -> int:
    if len(metadata) < 8:
        raise ProbeError("short metadata resource")
    total_length = struct.unpack_from("<I", metadata, 0)[0]
    return 8 if total_length == 0 else align_up(total_length, 8)


def parse_dentry(metadata: bytes, offset: int) -> tuple[WimDentry, int]:
    if offset + 102 > len(metadata):
        raise ProbeError(f"dentry at offset {offset} is out of bounds")

    length = struct.unpack_from("<Q", metadata, offset)[0]
    if length == 0:
        raise ProbeError(f"unexpected end-of-directory marker at offset {offset}")
    if offset + length > len(metadata):
        raise ProbeError(
            f"dentry length {length} at offset {offset} exceeds metadata size"
        )

    attributes = struct.unpack_from("<I", metadata, offset + 8)[0]
    subdir_offset = struct.unpack_from("<Q", metadata, offset + 16)[0]
    main_hash = metadata[offset + 64 : offset + 84]
    extra_stream_count = struct.unpack_from("<H", metadata, offset + 96)[0]
    short_name_nbytes = struct.unpack_from("<H", metadata, offset + 98)[0]
    name_nbytes = struct.unpack_from("<H", metadata, offset + 100)[0]

    cursor = offset + 102
    if name_nbytes:
        name = metadata[cursor : cursor + name_nbytes].decode("utf-16le")
        cursor += name_nbytes + 2
    else:
        name = ""

    if short_name_nbytes:
        cursor += short_name_nbytes + 2

    next_offset = offset + length
    for _ in range(extra_stream_count):
        if next_offset + 8 > len(metadata):
            raise ProbeError("extra stream record exceeds metadata size")
        stream_length = struct.unpack_from("<Q", metadata, next_offset)[0]
        if stream_length == 0:
            raise ProbeError(f"invalid extra stream length at offset {next_offset}")
        next_offset += stream_length

    return WimDentry(
        name=name,
        attributes=attributes,
        subdir_offset=subdir_offset,
        main_hash=main_hash,
    ), next_offset


class RemoteWim:
    def __init__(
        self,
        url: str = DEFAULT_ISO_URL,
        path: str = "sources/install.wim",
        timing: bool = False,
    ) -> None:
        self.timing = TimingStats(enabled=timing)
        self.reader = HttpRangeReader(url, timing=self.timing)
        self.path = path
        self._thread_state = threading.local()
        self.wim_reader: ExtentMappedReader | None = None
        self.header: WimHeader | None = None
        self.blobs_by_sha1: dict[bytes, BlobEntry] | None = None
        self.metadata_data: bytes | None = None
        self.root_entry: WimDentry | None = None

    def ensure_open(self) -> None:
        if self.wim_reader is not None:
            return

        entry = find_udf_file_entry(self.reader, self.path)
        self.wim_reader = ExtentMappedReader(
            self.reader, entry.extents, entry.info_length
        )
        self.header = parse_wim_header(self.wim_reader.read_at(0, 80))
        if self.header.version != 0x10D00:
            raise ProbeError(
                f"unsupported WIM version 0x{self.header.version:x}; only default non-solid WIMs are supported"
            )

    def wim(self) -> ExtentMappedReader:
        self.ensure_open()
        if self.wim_reader is None:
            raise ProbeError("WIM reader is not initialized")
        return self.wim_reader

    def require_header(self) -> WimHeader:
        self.ensure_open()
        if self.header is None:
            raise ProbeError("WIM header is not initialized")
        return self.header

    def require_metadata(self) -> bytes:
        self.load_blob_table()
        if self.metadata_data is None:
            raise ProbeError("WIM metadata is not initialized")
        return self.metadata_data

    def require_root_entry(self) -> WimDentry:
        self.load_blob_table()
        if self.root_entry is None:
            raise ProbeError("WIM root entry is not initialized")
        return self.root_entry

    def decompressor(self) -> WimlibDecompressor:
        decompressor = getattr(self._thread_state, "decompressor", None)
        if decompressor is None:
            decompressor = WimlibDecompressor()
            self._thread_state.decompressor = decompressor
        return decompressor

    def decompress_resource(self, resource: WimResource) -> bytes:
        raw = self.wim().read_at(resource.offset_in_wim, resource.size_in_wim)
        if resource.is_solid:
            raise ProbeError("solid WIM resources are not supported in this extractor")
        if not resource.is_compressed:
            return raw

        header = self.require_header()
        chunk_size = header.chunk_size
        compression_type = compression_type_from_flags(header.flags)
        chunk_count = math.ceil(resource.uncompressed_size / chunk_size)
        entry_size = chunk_entry_size(resource.uncompressed_size)
        table_size = max(chunk_count - 1, 0) * entry_size
        table = raw[:table_size]
        payload = raw[table_size:]

        offsets = [0]
        for index in range(chunk_count - 1):
            if entry_size == 4:
                offsets.append(struct.unpack_from("<I", table, index * 4)[0])
            else:
                offsets.append(struct.unpack_from("<Q", table, index * 8)[0])
        offsets.append(len(payload))

        parts: list[bytes] = []
        for index in range(chunk_count):
            chunk = payload[offsets[index] : offsets[index + 1]]
            out_size = min(chunk_size, resource.uncompressed_size - index * chunk_size)
            if len(chunk) == out_size:
                parts.append(chunk)
            else:
                parts.append(
                    self.decompressor().decompress(
                        compression_type, chunk_size, chunk, out_size
                    )
                )

        data = b"".join(parts)
        if len(data) != resource.uncompressed_size:
            raise ProbeError(
                f"decompressed size mismatch: expected {resource.uncompressed_size}, got {len(data)}"
            )
        return data

    def load_blob_table(self) -> dict[bytes, BlobEntry]:
        if self.blobs_by_sha1 is not None:
            return self.blobs_by_sha1

        blob_resource = self.require_header().blob_table
        if blob_resource.is_compressed:
            raise ProbeError("compressed blob tables are not supported")

        blob_table = self.wim().read_at(
            blob_resource.offset_in_wim, blob_resource.size_in_wim
        )
        if len(blob_table) % 50 != 0:
            raise ProbeError(f"unexpected blob table length {len(blob_table)}")

        blobs: dict[bytes, BlobEntry] = {}
        metadata_entry: BlobEntry | None = None
        for offset in range(0, len(blob_table), 50):
            entry = BlobEntry(
                resource=parse_wim_resource(blob_table, offset),
                sha1=blob_table[offset + 30 : offset + 50],
            )
            blobs[entry.sha1] = entry
            if (
                metadata_entry is None
                and entry.resource.is_metadata
                and entry.resource.offset_in_wim
            ):
                metadata_entry = entry

        if metadata_entry is None:
            raise ProbeError("metadata blob entry not found in blob table")

        self.blobs_by_sha1 = blobs
        self.metadata_data = self.decompress_resource(metadata_entry.resource)
        self.root_entry, _ = parse_dentry(
            self.metadata_data,
            parse_security_length(self.metadata_data),
        )
        return blobs

    def metadata(self) -> bytes:
        return self.require_metadata()

    def iter_directory(self, subdir_offset: int) -> list[WimDentry]:
        metadata = self.metadata()
        entries: list[WimDentry] = []
        offset = subdir_offset
        while True:
            if offset + 8 > len(metadata):
                raise ProbeError("directory walk exceeded metadata size")
            if struct.unpack_from("<Q", metadata, offset)[0] == 0:
                return entries
            entry, offset = parse_dentry(metadata, offset)
            entries.append(entry)

    def resolve_path(self, path: str) -> WimDentry:
        current = self.require_root_entry()
        for part in split_path(path):
            if not current.is_dir or not current.subdir_offset:
                raise ProbeError(f"{part!r} cannot be resolved below a non-directory")
            children = self.iter_directory(current.subdir_offset)
            match = find_named_child(children, part)
            if match is None:
                raise ProbeError(
                    f"path component {part!r} not found; sample entries: {sample_names(children)}"
                )
            current = match
        return current

    def walk(self):
        stack: list[tuple[str, WimDentry]] = [("", self.require_root_entry())]
        while stack:
            current_path, current_entry = stack.pop()
            yield current_path, current_entry
            if not current_entry.is_dir or not current_entry.subdir_offset:
                continue
            children = self.iter_directory(current_entry.subdir_offset)
            for child in reversed(children):
                child_path = (
                    child.name if not current_path else f"{current_path}/{child.name}"
                )
                stack.append((child_path, child))

    def find_paths(self, pattern: str) -> list[str]:
        has_separator = "/" in pattern.replace("\\", "/")
        folded_pattern = pattern.casefold()
        matches: list[str] = []
        for path, entry in self.walk():
            if entry.is_dir:
                continue
            subject = path.casefold() if has_separator else Path(path).name.casefold()
            if fnmatch.fnmatchcase(subject, folded_pattern):
                matches.append(path)
        return matches

    def resolve_paths(self, paths: list[str], patterns: list[str]) -> list[str]:
        resolved = list(paths)
        for pattern in patterns:
            resolved.extend(self.find_paths(pattern))
        return list(dict.fromkeys(resolved))

    def blob_for_path(self, path: str) -> BlobEntry:
        entry = self.resolve_path(path)
        if entry.is_dir:
            raise ProbeError(f"{path!r} is a directory")
        if entry.main_hash == b"\x00" * 20:
            raise ProbeError(f"{path!r} has no unnamed data stream")

        blobs = self.load_blob_table()
        try:
            return blobs[entry.main_hash]
        except KeyError as exc:
            raise ProbeError(f"blob for {path!r} not found in blob table") from exc

    def build_extract_tasks(
        self, paths: list[str], output_dir: Path
    ) -> list[ExtractTask]:
        self.load_blob_table()
        tasks: list[ExtractTask] = []
        for path in paths:
            tasks.append(
                ExtractTask(
                    path=path,
                    blob=self.blob_for_path(path),
                    destination=output_dir / Path(*split_path(path)),
                )
            )
        return tasks

    def extract_task(self, task: ExtractTask) -> Path:
        data = self.decompress_resource(task.blob.resource)
        if hashlib.sha1(data).digest() != task.blob.sha1:
            raise ProbeError(f"SHA-1 mismatch for {task.path!r}")

        task.destination.parent.mkdir(parents=True, exist_ok=True)
        temp_name = None
        try:
            with tempfile.NamedTemporaryFile(
                dir=task.destination.parent,
                prefix=f".{task.destination.name}.",
                suffix=".part",
                delete=False,
            ) as handle:
                handle.write(data)
                temp_name = handle.name
            os.replace(temp_name, task.destination)
        finally:
            if temp_name and os.path.exists(temp_name):
                os.unlink(temp_name)
        return task.destination

    def extract_paths(
        self,
        paths: list[str],
        output_dir: Path,
        jobs: int = 8,
        on_complete: Callable[[ExtractTask, Path], None] | None = None,
    ) -> list[Path]:
        if jobs < 1:
            raise ProbeError(f"invalid job count {jobs}; expected at least 1")

        tasks = self.build_extract_tasks(paths, output_dir)
        if jobs == 1 or len(tasks) <= 1:
            results: list[Path] = []
            for task in tasks:
                result = self.extract_task(task)
                if on_complete is not None:
                    on_complete(task, result)
                results.append(result)
            return results

        with ThreadPoolExecutor(max_workers=jobs) as executor:
            future_to_task = {
                executor.submit(self.extract_task, task): task for task in tasks
            }
            results: list[Path] = []
            for future in as_completed(future_to_task):
                result = future.result()
                task = future_to_task[future]
                if on_complete is not None:
                    on_complete(task, result)
                results.append(result)
            return results

    def extract_path(self, path: str, output_dir: Path) -> Path:
        return self.extract_task(
            ExtractTask(
                path=path,
                blob=self.blob_for_path(path),
                destination=output_dir / Path(*split_path(path)),
            )
        )

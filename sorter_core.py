import os
import shutil
import json
import hashlib
from datetime import datetime

MONTHS_EN = {
    1: "January", 2: "February", 3: "March", 4: "April", 5: "May", 6: "June", 
    7: "July", 8: "August", 9: "September", 10: "October", 11: "November", 12: "December"
}

class FileSorterCore:
    def __init__(self, config_path="sorter_config.json"):
        self.config_path = config_path
        self.defaults = {
            "extensions": {
                'Images': '.jpg,.jpeg,.png,.gif,.bmp,.svg,.webp,.tiff,.ico',
                'Documents': '.pdf,.doc,.docx,.txt,.xlsx,.pptx,.csv,.odt,.rtf',
                'Video': '.mp4,.mkv,.avi,.mov,.webm,.flv,.wmv',
                'Music': '.mp3,.wav,.flac,.aac,.ogg,.m4a',
                'Archives': '.zip,.rar,.7z,.tar,.tar.xz,.gz,.bz2,.xz',
                'Programming': '.py,.html,.css,.js,.cpp,.c,.h,.java,.php,.json,.xml,.sb3,.rb,.go,.rs,.swift',
                'System': '.exe,.msi,.deb,.run,.appimage,.sh,.bat,.com'
            },
            "move_unknown": True,
            "date_sort": False,
            "clean_empty": True,
            "overwrite": False,
            "auto_dupes": False,
            "include_target_root": False,
            "excluded_files": "sorter_config.json,sorter_log.txt",
            "multi_sources": [],
            "multi_target": "",
            "last_path": "",
            "dry_run": False,
            "ignore_hidden": True,
            "min_size_mb": 0.0,
            "max_size_mb": 0.0
        }
        self.config = self.load_config()

    def load_config(self):
        if os.path.exists(self.config_path):
            try:
                with open(self.config_path, "r", encoding="utf-8") as f:
                    return {**self.defaults, **json.load(f)}
            except Exception:
                return self.defaults
        return self.defaults

    def save_config(self, new_config):
        self.config.update(new_config)
        with open(self.config_path, "w", encoding="utf-8") as f:
            json.dump(self.config, f, indent=4, ensure_ascii=False)

    def get_file_hash(self, filepath):
        """Безопасное поблочное вычисление MD5-хеша для файлов любого объема"""
        hasher = hashlib.md5()
        try:
            with open(filepath, 'rb') as f:
                for chunk in iter(lambda: f.read(65536), b""):
                    hasher.update(chunk)
            return hasher.hexdigest()
        except (OSError, PermissionError):
            return None

    def _clean_empty_folders(self, path):
        for root, dirs, _ in os.walk(path, topdown=False):
            for d in dirs:
                dp = os.path.join(root, d)
                try: 
                    if not os.listdir(dp): 
                        os.rmdir(dp)
                except Exception: 
                    pass

    def _is_size_allowed(self, filepath):
        try:
            sz_bytes = os.path.getsize(filepath)
            sz_mb = sz_bytes / (1024 * 1024)
            min_size = float(self.config.get("min_size_mb", 0.0))
            max_size = float(self.config.get("max_size_mb", 0.0))

            if min_size > 0 and sz_mb < min_size:
                return False
            if max_size > 0 and sz_mb > max_size:
                return False
            return True
        except (OSError, PermissionError):
            return False

    # --- 1. SORTING (Single & Multi) ---
    def sort_directory_generator(self, src_dir, target_dir=None):
        if not target_dir: 
            target_dir = src_dir
        if not os.path.exists(src_dir):
            yield "error", f"Specified path does not exist: {src_dir}"
            return
            
        dry_run_mode = self.config.get("dry_run", False)
        prefix = "[SIMULATION] " if dry_run_mode else ""
        
        yield "info", f"{prefix}Analyzing directory: {src_dir}"
        
        try:
            files = [f for f in os.listdir(src_dir) if os.path.isfile(os.path.join(src_dir, f))]
        except Exception as e:
            yield "error", f"Failed to read directory: {str(e)}"
            return

        total = len(files)
        if total == 0:
            yield "skip", f"No files to sort in: {src_dir}"
            yield "success", f"No files to sort in: {src_dir}"
            return

        # Оптимизация: компиляция списков исключений и расширений ДО входа в цикл
        excl = {x.strip().lower() for x in self.config.get("excluded_files", "").split(",") if x.strip()}
        excl.add("sorter_config.json")
        excl.add("sorter_log.txt")

        ext_to_category = {}
        for cat, exts in self.config.get("extensions", {}).items():
            for e in exts.split(','):
                clean_ext = e.strip().lower()
                if clean_ext:
                    if not clean_ext.startswith('.'):
                        clean_ext = '.' + clean_ext
                    ext_to_category[clean_ext] = cat

        count = 0
        for index, f in enumerate(files):
            yield "progress", {"current": index + 1, "total": total}
            
            if self.config.get("ignore_hidden", True) and f.startswith('.'):
                yield "skip", f"Skipped (Hidden file): {f}"
                continue

            if f.lower() in excl:
                yield "skip", f"Skipped (in exceptions): {f}"
                continue
                
            src_path = os.path.join(src_dir, f)

            if not self._is_size_allowed(src_path):
                yield "skip", f"Skipped (Size out of boundaries): {f}"
                continue

            ext = os.path.splitext(f)[1].lower()
            category = ext_to_category.get(ext)
            
            if not category and self.config.get("move_unknown", True):
                category = "Other"
            
            if not category:
                yield "skip", f"Category not found, file left intact: {f}"
                continue

            dest_dir = os.path.join(target_dir, category)
            if self.config.get("date_sort", False):
                try:
                    dt = datetime.fromtimestamp(os.path.getmtime(src_path))
                    m_name = MONTHS_EN.get(dt.month, "Unknown")
                    dest_dir = os.path.join(dest_dir, str(dt.year), m_name)
                except Exception:
                    pass
            
            dest_path = os.path.join(dest_dir, f)
            
            if os.path.exists(dest_path):
                if self.config.get("overwrite", False):
                    if not dry_run_mode:
                        try: 
                            os.remove(dest_path)
                        except Exception: 
                            pass
                else:
                    # Оптимизация: инкрементальное имя во избежание коллизий времени
                    n, e = os.path.splitext(f)
                    counter = 1
                    while os.path.exists(dest_path):
                        dest_path = os.path.join(dest_dir, f"{n}_{counter}{e}")
                        counter += 1
                    yield "conflict", f"{prefix}Name conflict. Target will be renamed to {os.path.basename(dest_path)}"

            try:
                if not dry_run_mode:
                    os.makedirs(dest_dir, exist_ok=True)
                    shutil.move(src_path, dest_path)
                count += 1
                yield "move", f"{prefix}Processed: {f} -> {category}"
            except Exception as e:
                yield "error", f"Move error for {f}: {str(e)}"
        
        if self.config.get("clean_empty", True) and not dry_run_mode:
            self._clean_empty_folders(src_dir)
            
        yield "success", f"{prefix}Processing completed for {src_dir}! Actions: {count} files"

    # --- 2. REVERSE SORTING (Unsort) ---
    def unsort_directory_generator(self, target_dir):
        if not target_dir or not os.path.exists(target_dir):
            yield "error", "Specified path not found!"
            return

        dry_run_mode = self.config.get("dry_run", False)
        prefix = "[SIMULATION] " if dry_run_mode else ""

        yield "info", f"{prefix}Starting reverse sorting (extraction) for: {target_dir}"
        all_files = []
        cats = list(self.config.get("extensions", {}).keys()) + ["Other"]
        
        for c in cats:
            cp = os.path.join(target_dir, c)
            if os.path.isdir(cp):
                for r, _, fs in os.walk(cp):
                    for f in fs: 
                        if self.config.get("ignore_hidden", True) and f.startswith('.'):
                            continue
                        all_files.append(os.path.join(r, f))
                        
        total = len(all_files)
        yield "info", f"Found files in categories: {total}"
        if total == 0:
            yield "success", "No files to extract."
            return

        count = 0
        for i, fp in enumerate(all_files):
            yield "progress", {"current": i + 1, "total": total}
            fname = os.path.basename(fp)
            dst = os.path.join(target_dir, fname)
            
            if os.path.exists(dst):
                n, e = os.path.splitext(fname)
                counter = 1
                while os.path.exists(dst):
                    dst = os.path.join(target_dir, f"{n}_old_{counter}{e}")
                    counter += 1
                yield "conflict", f"{prefix}Conflict. Target will be renamed to: {os.path.basename(dst)}"
                
            try:
                if not dry_run_mode:
                    shutil.move(fp, dst)
                count += 1
                yield "move", f"{prefix}Extracted: {fname}"
            except Exception as e:
                yield "error", f"Extraction error for {fname}: {str(e)}"

        if self.config.get("clean_empty", True) and not dry_run_mode:
            yield "info", "Cleaning up empty category folders..."
            self._clean_empty_folders(target_dir)

        yield "success", f"{prefix}Reverse sorting completed! Processed files: {count}"

    # --- 3. DUPLICATE FINDER ---
    def scan_duplicates_generator(self, path):
        if not path or not os.path.exists(path):
            yield "error", "Specified path not found!"
            return
            
        yield "info", f"Scanning for duplicates in: {path}"
        
        size_groups = {}
        for root_dir, _, files in os.walk(path):
            for f in files:
                if self.config.get("ignore_hidden", True) and f.startswith('.'):
                    continue
                fp = os.path.join(root_dir, f)
                try:
                    sz = os.path.getsize(fp)
                    size_groups.setdefault(sz, []).append(fp)
                except (OSError, PermissionError):
                    continue
                    
        potential_files = []
        for sz, paths in size_groups.items():
            if len(paths) > 1:
                potential_files.extend(paths)
                
        total = len(potential_files)
        yield "info", f"Analyzing potential duplicates: {total} candidates matching sizes"
        
        if total == 0:
            yield "success", "No duplicate file sizes found."
            return

        hashes = {}
        for i, fp in enumerate(potential_files):
            yield "progress", {"current": i + 1, "total": total}
            h = self.get_file_hash(fp)
            if h: 
                hashes.setdefault(h, []).append(fp)

        groups = [ps for ps in hashes.values() if len(ps) > 1]
        
        if not groups:
            yield "success", "No absolute duplicates found."
            return

        if self.config.get("auto_dupes", False):
            to_del = []
            for g in groups: 
                # Сохраняем первый элемент как оригинал, остальные на удаление
                to_del.extend(g[1:])
            yield "info", f"Found {len(to_del)} duplicates. Starting auto-deletion..."
            count = 0
            for i, p in enumerate(to_del):
                try:
                    os.remove(p)
                    count += 1
                    yield "move", f"Deleted duplicate: {p}"
                except Exception as e:
                    yield "error", f"Deletion error: {str(e)}"
                yield "progress", {"current": i + 1, "total": len(to_del)}
            yield "success", f"Auto-deletion completed. Destroyed: {count}"
        else:
            yield "progress", {"current": total, "total": total}
            yield "dupe_groups", groups
            yield "info", "Review the duplicates above. Run with --auto-dupes to automatically delete copies."
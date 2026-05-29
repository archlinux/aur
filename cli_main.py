#!/usr/bin/env python3

import argparse
import sys
import json
from sorter_core import FileSorterCore

def main():
    parser = argparse.ArgumentParser(description="MogDop File Utils - Core Engine CLI")
    
    # Режимы
    parser.add_argument("mode", choices=["single", "multi", "unsort", "dupes"], 
                        help="Operation mode to run")
    
    # Пути
    parser.add_argument("-p", "--path", type=str, 
                        help="Path to folder (for single, unsort, and dupes modes)")
    parser.add_argument("-t", "--target", type=str, 
                        help="Target folder path (for multi mode)")
    parser.add_argument("-s", "--sources", type=str, nargs="+", 
                        help="Multiple source folders (for multi mode)")
    
    # Переопределение настроек
    parser.add_argument("--date-sort", action="store_true", help="Sort into Year/Month subfolders")
    parser.add_argument("--clean-empty", action="store_true", help="Delete empty folders after operation")
    parser.add_argument("--overwrite", action="store_true", help="Overwrite conflicting files")
    parser.add_argument("--auto-dupes", action="store_true", help="Auto-delete duplicates without confirmation")
    parser.add_argument("--ignore-unknown", action="store_true", help="Do not move files with unknown extensions")
    
    # Если аргументы не переданы, выводим справку автоматически
    if len(sys.argv) == 1:
        parser.print_help()
        sys.exit(0)
        
    args = parser.parse_args()
    
    # Инициализация ядра
    core = FileSorterCore()
    
    # Применение флагов к конфигурации
    if args.date_sort: core.config['date_sort'] = True
    if args.clean_empty: core.config['clean_empty'] = True
    if args.overwrite: core.config['overwrite'] = True
    if args.auto_dupes: core.config['auto_dupes'] = True
    if args.ignore_unknown: core.config['move_unknown'] = False

    print("=== MogDop File Utils CLI ===")
    
    def process_generator(generator):
        """Вспомогательная функция для вывода логов и прогресса"""
        last_was_progress = False
        
        for e_type, msg in generator:
            if e_type == "progress":
                percent = int((msg["current"] / msg["total"]) * 100) if msg["total"] > 0 else 100
                sys.stdout.write(f"\r[PROGRESS] {percent}% ({msg['current']}/{msg['total']})     ")
                sys.stdout.flush()
                last_was_progress = True
            elif e_type == "dupe_groups":
                if last_was_progress:
                    print()
                    last_was_progress = False
                print("\n[DUPLICATES FOUND]")
                for i, group in enumerate(msg):
                    print(f"  Group {i+1} ({len(group)} files):")
                    for fp in group:
                        print(f"    - {fp}")
                print("\nRun with --auto-dupes to automatically delete these copies.")
            else:
                if last_was_progress:
                    print() # Сброс строки после прогресс-бара
                    last_was_progress = False
                print(f"[{e_type.upper()}] {msg}")

    # Логика режимов
    if args.mode == "single":
        if not args.path:
            print("[ERROR] --path (-p) is required for single mode.")
            return
        process_generator(core.sort_directory_generator(args.path))
        
    elif args.mode == "unsort":
        if not args.path:
            print("[ERROR] --path (-p) is required for unsort mode.")
            return
        process_generator(core.unsort_directory_generator(args.path))
        
    elif args.mode == "dupes":
        if not args.path:
            print("[ERROR] --path (-p) is required for dupes mode.")
            return
        process_generator(core.scan_duplicates_generator(args.path))
        
    elif args.mode == "multi":
        if not args.target or not args.sources:
            print("[ERROR] Both --target (-t) and --sources (-s) are required for multi mode.")
            return
        
        print(f"[INFO] Multi-source target: {args.target}")
        for src in args.sources:
            print(f"\n--- Processing source: {src} ---")
            process_generator(core.sort_directory_generator(src, target_dir=args.target))
            
    print("\n=============================")

if __name__ == "__main__":
    main()
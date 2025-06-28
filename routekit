#!/usr/bin/env python3

import subprocess
import sys
import argparse
import re
from typing import List, Dict, Optional
from dataclasses import dataclass

class Colors:
    HEADER = '\033[95m'
    BLUE = '\033[94m'
    CYAN = '\033[96m'
    GREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'
    
@dataclass
class Route:
    destination: str
    gateway: str
    device: str
    metric: str
    scope: str
    proto: str
    source: str = ""
    
class RouteKit:
    def __init__(self):
        self.check_permissions()
    
    def check_permissions(self):
        import os
        self.is_root = os.geteuid() == 0
        
    def run_command(self, cmd: List[str]) -> tuple:
        try:
            result  = subprocess.run(cmd, capture_output=True, text=True, check=True)
            return True, result.stdout.strip()
        except subprocess.CalledProcessError as e:
            return False, e.stderr.strip()
        except FileNotFoundError:
            return False, f"Coomand not found: {cmd[0]}. Make sure that iproute2 installed."
        
    def parse_route_line(self, line: str) -> Optional[Route]:
        if not line.strip():
            return None
        
        parts = line.split()
        if not parts:
            return None
        
        route = Route(
            destination=parts[0] if parts[0] != "default" else "0.0.0.0/0",
            gateway="",
            device="",
            metric="",
            scope="",
            proto="",
        )
        
        i = 1
        while i < len(parts):
            if parts[i] == "via" and i + 1 < len(parts):
                route.gateway = parts[i + 1]
                i += 2
            elif parts[i] == "dev" and i + 1 < len(parts):
                route.device = parts[i + 1]
                i += 2
            elif parts[i] == "metric" and i + 1 < len(parts):
                route.metric = parts[i + 1]
                i += 2
            elif parts[i] == "scope" and i + 1 < len(parts):
                route.scope = parts[i + 1]
                i += 2
            elif parts[i] == "proto" and i + 1 < len(parts):
                route.proto = parts[i + 1]
                i += 2
            elif parts[i] == "src" and i + 1 < len(parts):
                route.source = parts[i + 1]
                i += 2
            else:
                i += 1
        return route
    
    def format_table_header(self, title: str) -> str:
        line = "=" * 80
        return f"\n{Colors.BOLD}{Colors.CYAN}{line}{Colors.ENDC}\n{Colors.BOLD}{Colors.HEADER}{title:^80}{Colors.ENDC}\n{Colors.BOLD}{Colors.CYAN}{line}{Colors.ENDC}"
    
    def show_routes(self, table: str = "main") -> None:
        print(self.format_table_header(f" Routing Table: ({table}) "))
        
        cmd = ["ip", "route", "show"]
        if table != "main":
            cmd.extend(["table", table])
            
        success, output = self.run_command(cmd)
        if not success:
            print(f"{Colors.FAIL}Error: {output}{Colors.ENDC}")
            return
        
        if not output:
            print(f"{Colors.WARNING}No routes found in table '{table}'.{Colors.ENDC}")
            return
        
        print(f"\n{Colors.BOLD}{Colors.BLUE}{'Destination':<20} {'Gateway':<15} {'Interface':<10} {'Metric':<8} {'Scope':<10} {'Proto':<10}{Colors.ENDC}")
        print(f"{Colors.BOLD}{'-' * 20} {'-' * 15} {'-' * 10} {'-' * 8} {'-' * 10} {'-' * 10}{Colors.ENDC}")
        
        for line in output.split('\n'):
            route = self.parse_route_line(line)
            if route:
                dest_color = Colors.GREEN if route.destination == "0.0.0.0/0" else Colors.CYAN
                gw_color = Colors.WARNING if route.gateway else Colors.ENDC
                
                print(f"{dest_color}{route.destination:<20}{Colors.ENDC} "
                      f"{gw_color}{route.gateway:<15}{Colors.ENDC} "
                      f"{Colors.BLUE}{route.device:<10}{Colors.ENDC} "
                      f"{route.metric:<8} "
                      f"{route.scope:<10} "
                      f"{route.proto:<10}")
        
def main():
    parser = argparse.ArgumentParser(
        description="routekit - visual utility for routing table",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
routekit show  # Show routing table
routekit show table local  # Show local routing table

        """
    )
    
    subparsers = parser.add_subparsers(dest='command', help="Available commands")
    
    show_parser = subparsers.add_parser('show', help="Show routing table")
    show_parser.add_argument('table', nargs='?', default='main', help="Specify routing table (default: main)")
    show_parser.add_argument('table_name', nargs='?', help="Name of the routing table to show")
    
    args = parser.parse_args()
    
    if not args.command:
        args.command = 'show'
        
    routekit = RouteKit()
    
    try:
        if args.command == 'show':
            table = 'main'
            if hasattr(args, 'table') and args.table == 'table' and hasattr(args, 'table_name') and args.table_name:
                table = args.table_name
            elif hasattr(args, 'table') and args.table != 'main':
                table = args.table
            routekit.show_routes(table)
    except KeyboardInterrupt:
        print(f"\n{Colors.WARNING}Operation cancelled by user.{Colors.ENDC}")
        sys.exit(1)
    except Exception as e:
        print(f"{Colors.FAIL}Error: {e}{Colors.ENDC}")
        sys.exit(1)
        
if __name__ == "__main__":
    main()
    
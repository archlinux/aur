#!/usr/bin/env python3
"""
Extract the latest Twos AppImage version from twosapp.com/home
Uses Playwright with headless browser to wait for JavaScript to load the download link
Compares with current version in PKGBUILD and writes to build.env if different
"""
import re
import sys
import os
HEADLESS = True

try:
    from playwright.sync_api import sync_playwright
except ImportError:
    print("Error: playwright not installed. Install with: pip install playwright && playwright install chromium", file=sys.stderr)
    sys.exit(1)

def find_version():
    """Extract version from twosapp.com/home using headless browser"""
    global HEADLESS
    pattern = r'https://twos\.s3\.us-west-2\.amazonaws\.com/mac/Twos-(\d+\.\d+\.\d+)\.AppImage'
    pattern2 = r'Twos-(\d+\.\d+\.\d+)\.AppImage'
    
    browser = None
    context = None
    page = None
    headless_mode = HEADLESS  # Use local variable to avoid issues
    
    with sync_playwright() as p:
        try:
            # Launch browser (Playwright automatically downloads it if needed)
            launch_options = {
                'headless': headless_mode,
            }
            if not headless_mode:
                # Add options for non-headless mode
                launch_options['args'] = ['--disable-blink-features=AutomationControlled']
            
            import time
            try:
                browser = p.chromium.launch(**launch_options)
                time.sleep(0.2)  # Small delay to let browser stabilize
                # Check if browser is actually connected
                if not browser.is_connected():
                    raise Exception("Browser launched but not connected - may have crashed")
            except Exception as e:
                print(f"Error launching browser in {'non-headless' if not headless_mode else 'headless'} mode: {e}", file=sys.stderr)
                # If non-headless fails, try headless as fallback
                if not headless_mode:
                    print("Falling back to headless mode...", file=sys.stderr)
                    headless_mode = True
                    try:
                        browser = p.chromium.launch(headless=True)
                        time.sleep(0.2)
                        if not browser.is_connected():
                            print("Browser still not connected in headless mode", file=sys.stderr)
                            return None
                    except Exception as e2:
                        print(f"Error launching headless browser: {e2}", file=sys.stderr)
                        return None
                else:
                    return None
            
            # Double-check browser is connected right before creating context
            if not browser.is_connected():
                print("Browser disconnected before context creation", file=sys.stderr)
                if not headless_mode:
                    print("Falling back to headless mode...", file=sys.stderr)
                    headless_mode = True
                    browser = p.chromium.launch(headless=True)
                    time.sleep(0.2)
                    if not browser.is_connected():
                        print("Browser still not connected in headless mode", file=sys.stderr)
                        return None
                else:
                    return None
            
            try:
                context = browser.new_context(
                    viewport={'width': 1920, 'height': 1080},
                    user_agent='Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36'
                )
            except Exception as e:
                print(f"Error creating context: {e}", file=sys.stderr)
                # If non-headless failed, try headless
                if not headless_mode and "closed" in str(e).lower():
                    print("Falling back to headless mode...", file=sys.stderr)
                    headless_mode = True
                    if browser:
                        try:
                            browser.close()
                        except:
                            pass
                    browser = p.chromium.launch(headless=True)
                    time.sleep(0.2)
                    context = browser.new_context(
                        viewport={'width': 1920, 'height': 1080},
                        user_agent='Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36'
                    )
                else:
                    if browser:
                        try:
                            browser.close()
                        except:
                            pass
                    return None
            
            try:
                page = context.new_page()
            except Exception as e:
                print(f"Error creating page: {e}", file=sys.stderr)
                print(f"Browser connected: {browser.is_connected() if browser else 'N/A'}", file=sys.stderr)
                # If non-headless failed, try headless as fallback
                if not headless_mode and "closed" in str(e).lower():
                    print("Falling back to headless mode...", file=sys.stderr)
                    headless_mode = True
                    try:
                        if context:
                            context.close()
                        if browser:
                            browser.close()
                    except:
                        pass
                    # Restart with headless
                    browser = p.chromium.launch(headless=True)
                    time.sleep(0.2)
                    context = browser.new_context(
                        viewport={'width': 1920, 'height': 1080},
                        user_agent='Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36'
                    )
                    page = context.new_page()
                else:
                    if context:
                        context.close()
                    if browser:
                        browser.close()
                    return None
            
            # Navigate to the page
            page.goto('https://www.twosapp.com/home', wait_until='networkidle')
            
            # Wait for JavaScript to fully load
            page.wait_for_timeout(5000)
            
            # Try to click on "home" or any download-related button if it exists
            try:
                # Look for download buttons or links
                download_buttons = page.query_selector_all('a[href*="download"], button:has-text("Download"), a:has-text("Download"), a:has-text("Get"), button:has-text("Get")')
                if download_buttons:
                    download_buttons[0].click()
                    page.wait_for_timeout(2000)
            except Exception:
                pass
            
            # Scroll to trigger lazy loading
            page.evaluate("window.scrollTo(0, document.body.scrollHeight)")
            page.wait_for_timeout(2000)
            page.evaluate("window.scrollTo(0, 0)")
            page.wait_for_timeout(2000)
            
            # Scroll through the page more thoroughly
            for i in range(3):
                page.evaluate(f"window.scrollTo(0, {i * 500})")
                page.wait_for_timeout(1000)
            
            # Get page content
            page_source = page.content()
            
            # Look for AppImage URL pattern in page source
            match = re.search(pattern, page_source)
            if match:
                version = match.group(1)
                if not headless_mode:
                    page.wait_for_timeout(2000)  # Keep browser open briefly in non-headless mode
                return version
            
            # Try to find download links
            try:
                # Look for links containing AppImage or twos.s3
                links = page.query_selector_all('a[href*="AppImage"], a[href*="twos.s3"]')
                for link in links:
                    href = link.get_attribute('href')
                    if href:
                        match = re.search(pattern, href)
                        if match:
                            version = match.group(1)
                            if not headless_mode:
                                page.wait_for_timeout(2000)  # Keep browser open briefly in non-headless mode
                            return version
            except Exception as e:
                pass
            
            # Try alternative pattern
            match = re.search(pattern2, page_source)
            if match:
                version = match.group(1)
                if not headless_mode:
                    page.wait_for_timeout(2000)  # Keep browser open briefly in non-headless mode
                return version
            
            print("Version not found in page", file=sys.stderr)
            if not headless_mode:
                page.wait_for_timeout(2000)  # Keep browser open briefly in non-headless mode
            return None
            
        except Exception as e:
            print(f"Error: {e}", file=sys.stderr)
            import traceback
            traceback.print_exc()
            return None
        finally:
            # Clean up browser resources
            if browser and browser.is_connected():
                try:
                    if context:
                        context.close()
                    browser.close()
                except Exception as e:
                    pass

def get_current_version():
    """Read current version from PKGBUILD"""
    try:
        with open('PKGBUILD', 'r') as f:
            content = f.read()
            match = re.search(r'^pkgver=(\S+)', content, re.MULTILINE)
            if match:
                return match.group(1)
    except FileNotFoundError:
        print("Error: PKGBUILD not found", file=sys.stderr)
    except Exception as e:
        print(f"Error reading PKGBUILD: {e}", file=sys.stderr)
    return None

def main():
    """Main function that compares versions and writes build.env if needed"""
    current_version = get_current_version()
    if current_version is None:
        print("Could not read current version from PKGBUILD", file=sys.stderr)
        return 1
    
    # Find the latest version from the website
    found_version = find_version()
    if found_version is None:
        print("Could not find version from website", file=sys.stderr)
        return 1
    
    print(f"current version is {current_version}")
    print(f"found version {found_version}")
    
    # Compare versions
    if current_version != found_version:
        print("Build the thing")
        # Write to build.env
        try:
            with open('build.env', 'w') as f:
                f.write(f"pkgver={found_version}\n")
            return 0
        except Exception as e:
            print(f"Error writing build.env: {e}", file=sys.stderr)
            return 1
    else:
        print("No new version")
        return 0

if __name__ == '__main__':
    # If called with --version-only flag, just print version (for backward compatibility)
    if len(sys.argv) > 1 and sys.argv[1] == '--version-only':
        version = find_version()
        if version:
            print(version)
            sys.exit(0)
        else:
            sys.exit(1)
    else:
        # Full mode: compare versions and write build.env
        sys.exit(main())

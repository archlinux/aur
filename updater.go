package main

import (
	"bufio"
	"context"
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"os"
	"os/exec"
	"os/signal"
	"regexp"
	"strings"
	"syscall"
	"time"
)

// Constants
const (
	RepoAPIURL   = "https://api.github.com/repos/Voxelum/x-minecraft-launcher/releases/latest"
	ReleaseURL   = "https://github.com/Voxelum/x-minecraft-launcher/releases"
	PkgbuildFile = "PKGBUILD"
	SrcinfoFile  = ".SRCINFO"

	// HTTP client timeout
	HTTPTimeout = 10 * time.Second
)

// ANSI color codes
const (
	ColorReset  = "\033[0m"
	ColorRed    = "\033[91m"
	ColorGreen  = "\033[92m"
	ColorYellow = "\033[93m"
	ColorBlue   = "\033[94m"
)

// GitHubRelease represents the GitHub API response structure
type GitHubRelease struct {
	TagName string `json:"tag_name"`
}

// PackageUpdater handles the package update operations
type PackageUpdater struct {
	httpClient *http.Client
	reader     *bufio.Reader
}

// NewPackageUpdater creates a new PackageUpdater instance
func NewPackageUpdater() *PackageUpdater {
	return &PackageUpdater{
		httpClient: &http.Client{Timeout: HTTPTimeout},
		reader:     bufio.NewReader(os.Stdin),
	}
}

// Logger provides colored output methods
type Logger struct{}

func (l *Logger) Success(format string, args ...any) {
	fmt.Printf(ColorGreen+format+ColorReset+"\n", args...)
}

func (l *Logger) Error(format string, args ...any) {
	fmt.Fprintf(os.Stderr, ColorRed+"Error: "+format+ColorReset+"\n", args...)
}

func (l *Logger) Info(format string, args ...any) {
	fmt.Printf(ColorYellow+format+ColorReset+"\n", args...)
}

func (l *Logger) Action(format string, args ...any) {
	fmt.Printf(ColorBlue+format+ColorReset+"\n", args...)
}

var logger = &Logger{}

// FetchLatestVersion retrieves the latest release tag from GitHub API
func (u *PackageUpdater) FetchLatestVersion(ctx context.Context) (string, error) {
	logger.Action("Fetching latest version info from %s...", RepoAPIURL)

	req, err := http.NewRequestWithContext(ctx, http.MethodGet, RepoAPIURL, nil)
	if err != nil {
		return "", fmt.Errorf("creating request: %w", err)
	}

	// Set User-Agent to avoid rate limiting
	req.Header.Set("User-Agent", "xmcl-package-updater/1.0")

	resp, err := u.httpClient.Do(req)
	if err != nil {
		return "", fmt.Errorf("fetching release info: %w", err)
	}
	defer resp.Body.Close()

	if resp.StatusCode != http.StatusOK {
		return "", fmt.Errorf("HTTP %d: %s", resp.StatusCode, resp.Status)
	}

	var release GitHubRelease
	if err := json.NewDecoder(resp.Body).Decode(&release); err != nil {
		return "", fmt.Errorf("decoding JSON response: %w", err)
	}

	if release.TagName == "" {
		return "", fmt.Errorf("tag_name not found in API response")
	}

	return release.TagName, nil
}

// UpdatePkgbuild updates the pkgver line in the PKGBUILD file
func (u *PackageUpdater) UpdatePkgbuild(versionTag string) error {
	logger.Action("Updating %s...", PkgbuildFile)

	versionNum := strings.TrimPrefix(versionTag, "v")

	content, err := os.ReadFile(PkgbuildFile)
	if err != nil {
		return fmt.Errorf("reading %s: %w", PkgbuildFile, err)
	}

	// Use regex to replace pkgver line
	pkgverRegex := regexp.MustCompile(`^pkgver=.*$`)
	lines := strings.Split(string(content), "\n")

	for i, line := range lines {
		if pkgverRegex.MatchString(strings.TrimSpace(line)) {
			lines[i] = fmt.Sprintf("pkgver=%s", versionNum)
			break
		}
	}

	updatedContent := strings.Join(lines, "\n")
	if err := os.WriteFile(PkgbuildFile, []byte(updatedContent), 0644); err != nil {
		return fmt.Errorf("writing %s: %w", PkgbuildFile, err)
	}

	return nil
}

// CreateSrcinfo creates or overwrites the .SRCINFO file
func (u *PackageUpdater) CreateSrcinfo(versionTag string) error {
	logger.Action("Updating %s...", SrcinfoFile)

	versionNum := strings.TrimPrefix(versionTag, "v")
	srcinfoContent := u.generateSrcinfoContent(versionNum, versionTag)

	if err := os.WriteFile(SrcinfoFile, []byte(srcinfoContent), 0644); err != nil {
		return fmt.Errorf("creating %s: %w", SrcinfoFile, err)
	}

	return nil
}

// generateSrcinfoContent generates the .SRCINFO file content
func (u *PackageUpdater) generateSrcinfoContent(versionNum, versionTag string) string {
	return fmt.Sprintf(`pkgbase = xmcl-launcher
	pkgdesc = X Minecraft Launcher - A modern Minecraft launcher
	pkgver = %s
	pkgrel = 1
	url = https://xmcl.app/
	arch = x86_64
	arch = aarch64
	license = MIT
	makedepends = curl
	makedepends = libarchive
	optdepends = jre8-openjdk: Minimum requirement for launching older game versions
	optdepends = jre11-openjdk: Recommended Java version for launching versions 1.12-1.17
	optdepends = jre17-openjdk: Recommended Java version for launching version 1.17 and above
	optdepends = jre21-openjdk: Recommended Java version for launching version 1.20.5+ and above
	provides = xmcl
	conflicts = xmcl-electron-bin
	source = %s/%s

pkgname = xmcl-launcher
`, versionNum, ReleaseURL, versionTag)
}

// PromptUserToBuild asks the user if they want to build the package
func (u *PackageUpdater) PromptUserToBuild(ctx context.Context) (bool, error) {
	fmt.Print("Do you want to build the package? (y/N) ")

	// Create a channel to capture the user input
	responseCh := make(chan string, 1)
	errCh := make(chan error, 1)

	go func() {
		response, err := u.reader.ReadString('\n')
		if err != nil {
			errCh <- err
			return
		}
		responseCh <- response
	}()

	select {
	case <-ctx.Done():
		fmt.Println() // Add newline for clean exit
		logger.Info("Operation cancelled by user.")
		return false, ctx.Err()
	case err := <-errCh:
		if err == io.EOF {
			fmt.Println() // Add newline for clean exit
			return false, nil
		}
		return false, fmt.Errorf("reading user input: %w", err)
	case response := <-responseCh:
		response = strings.ToLower(strings.TrimSpace(response))
		return response == "y" || response == "yes", nil
	}
}

// BuildPackage executes makepkg -s to build the package
func (u *PackageUpdater) BuildPackage(ctx context.Context) error {
	logger.Action("Running makepkg -s...")

	cmd := exec.CommandContext(ctx, "makepkg", "-s")
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr

	// Create new process group and make it the foreground process group
	cmd.SysProcAttr = &syscall.SysProcAttr{
		Setpgid:   true,
		Pdeathsig: syscall.SIGTERM, // Send SIGTERM to child when parent dies
	}

	// Start the command
	if err := cmd.Start(); err != nil {
		return fmt.Errorf("starting makepkg: %w", err)
	}

	// Wait for completion or cancellation
	done := make(chan error, 1)
	go func() {
		done <- cmd.Wait()
	}()

	select {
	case <-ctx.Done():
		// Context cancelled, kill the entire process group
		if cmd.Process != nil {
			pgid, err := syscall.Getpgid(cmd.Process.Pid)
			if err == nil {
				// Kill entire process group (negative PID kills process group)
				syscall.Kill(-pgid, syscall.SIGTERM)
				// Give it a moment to terminate gracefully
				time.Sleep(2 * time.Second)
				// Force kill if still running
				syscall.Kill(-pgid, syscall.SIGKILL)
			}
		}
		return fmt.Errorf("build was cancelled")
	case err := <-done:
		if err != nil {
			if exitError, ok := err.(*exec.ExitError); ok {
				return fmt.Errorf("makepkg failed with exit code %d", exitError.ExitCode())
			}
			return fmt.Errorf("running makepkg: %w", err)
		}
		return nil
	}
}

// fileExists checks if a file exists
func fileExists(filename string) bool {
	_, err := os.Stat(filename)
	return !os.IsNotExist(err)
}

// run executes the main application logic
func (u *PackageUpdater) run() error {
	// Create context with signal handling for Ctrl+C
	ctx, cancel := context.WithCancel(context.Background())
	defer cancel()

	// Handle Ctrl+C gracefully
	sigCh := make(chan os.Signal, 1)
	signal.Notify(sigCh, os.Interrupt, syscall.SIGTERM)
	go func() {
		<-sigCh
		cancel()
	}()

	// Check if PKGBUILD exists
	if !fileExists(PkgbuildFile) {
		return fmt.Errorf("%s not found in the current directory", PkgbuildFile)
	}

	// Fetch latest version with timeout
	fetchCtx, fetchCancel := context.WithTimeout(ctx, 10*time.Second)
	defer fetchCancel()

	latestVersion, err := u.FetchLatestVersion(fetchCtx)
	if err != nil {
		if ctx.Err() != nil {
			return fmt.Errorf("operation cancelled")
		}
		return fmt.Errorf("failed to get the latest version: %w", err)
	}

	logger.Info("Latest version found: %s", latestVersion)

	// Update PKGBUILD
	if err := u.UpdatePkgbuild(latestVersion); err != nil {
		return fmt.Errorf("failed to update %s: %w", PkgbuildFile, err)
	}

	// Create .SRCINFO
	if err := u.CreateSrcinfo(latestVersion); err != nil {
		return fmt.Errorf("failed to create %s: %w", SrcinfoFile, err)
	}

	logger.Success("Successfully updated files to version %s", latestVersion)

	// Ask user if they want to build
	shouldBuild, err := u.PromptUserToBuild(ctx)
	if err != nil {
		if ctx.Err() != nil {
			return fmt.Errorf("operation cancelled")
		}
		return fmt.Errorf("error during build prompt: %w", err)
	}

	if shouldBuild {
		buildCtx, buildCancel := context.WithTimeout(ctx, 5*time.Minute)
		defer buildCancel()

		if err := u.BuildPackage(buildCtx); err != nil {
			if ctx.Err() != nil {
				return fmt.Errorf("build cancelled")
			}
			return fmt.Errorf("failed to build package: %w", err)
		}
		logger.Success("Package built successfully!")
	} else {
		logger.Info("Skipping package build.")
	}

	return nil
}

func main() {
	updater := NewPackageUpdater()

	if err := updater.run(); err != nil {
		logger.Error("%v", err)
		os.Exit(1)
	}
}

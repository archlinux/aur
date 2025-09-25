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

const (
	githubAPIURL = "https://api.github.com/repos/Voxelum/x-minecraft-launcher/releases/latest"
	pkgbuildFile = "PKGBUILD"
	srcinfoFile  = ".SRCINFO"
	httpTimeout  = 15 * time.Second
	buildTimeout = 10 * time.Minute
	userAgent    = "xmcl-package-updater/2.0"
)

// GitHubRelease represents the API response structure
type GitHubRelease struct {
	TagName string `json:"tag_name"`
}

// Config holds application configuration
type Config struct {
	HTTPTimeout  time.Duration
	BuildTimeout time.Duration
}

// Logger provides colored console output
type Logger struct{}

const (
	colorReset  = "\033[0m"
	colorRed    = "\033[91m"
	colorGreen  = "\033[92m"
	colorYellow = "\033[93m"
	colorBlue   = "\033[94m"
)

func (l *Logger) Success(msg string, args ...interface{}) {
	fmt.Printf(colorGreen+"✓ "+msg+colorReset+"\n", args...)
}

func (l *Logger) Error(msg string, args ...interface{}) {
	fmt.Fprintf(os.Stderr, colorRed+"✗ "+msg+colorReset+"\n", args...)
}

func (l *Logger) Info(msg string, args ...interface{}) {
	fmt.Printf(colorYellow+"ℹ "+msg+colorReset+"\n", args...)
}

func (l *Logger) Action(msg string, args ...interface{}) {
	fmt.Printf(colorBlue+"→ "+msg+colorReset+"\n", args...)
}

var log = &Logger{}

// HTTPClient wraps http.Client with convenience methods
type HTTPClient struct {
	client *http.Client
}

func NewHTTPClient(timeout time.Duration) *HTTPClient {
	return &HTTPClient{
		client: &http.Client{Timeout: timeout},
	}
}

func (c *HTTPClient) GetJSON(ctx context.Context, url string, result interface{}) error {
	req, err := http.NewRequestWithContext(ctx, "GET", url, nil)
	if err != nil {
		return fmt.Errorf("creating request: %w", err)
	}

	req.Header.Set("User-Agent", userAgent)

	resp, err := c.client.Do(req)
	if err != nil {
		return fmt.Errorf("executing request: %w", err)
	}
	defer resp.Body.Close()

	if resp.StatusCode != http.StatusOK {
		return fmt.Errorf("HTTP %d: %s", resp.StatusCode, resp.Status)
	}

	return json.NewDecoder(resp.Body).Decode(result)
}

// FileManager handles file operations
type FileManager struct{}

func (fm *FileManager) Exists(path string) bool {
	_, err := os.Stat(path)
	return err == nil
}

func (fm *FileManager) ReadLines(path string) ([]string, error) {
	content, err := os.ReadFile(path)
	if err != nil {
		return nil, fmt.Errorf("reading file %s: %w", path, err)
	}
	return strings.Split(string(content), "\n"), nil
}

func (fm *FileManager) WriteLines(path string, lines []string) error {
	content := strings.Join(lines, "\n")
	err := os.WriteFile(path, []byte(content), 0644)
	if err != nil {
		return fmt.Errorf("writing file %s: %w", path, err)
	}
	return nil
}

// CommandRunner executes system commands
type CommandRunner struct{}

func (cr *CommandRunner) Run(ctx context.Context, name string, args ...string) error {
	cmd := exec.CommandContext(ctx, name, args...)
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr

	if err := cmd.Run(); err != nil {
		return fmt.Errorf("running %s: %w", name, err)
	}
	return nil
}

func (cr *CommandRunner) RunWithOutput(ctx context.Context, name string, args ...string) ([]byte, error) {
	cmd := exec.CommandContext(ctx, name, args...)
	output, err := cmd.Output()
	if err != nil {
		return nil, fmt.Errorf("running %s: %w", name, err)
	}
	return output, nil
}

// PKGBUILDUpdater handles PKGBUILD modifications
type PKGBUILDUpdater struct {
	fm *FileManager
}

func NewPKGBUILDUpdater(fm *FileManager) *PKGBUILDUpdater {
	return &PKGBUILDUpdater{fm: fm}
}

func (u *PKGBUILDUpdater) UpdateVersion(version string) error {
	lines, err := u.fm.ReadLines(pkgbuildFile)
	if err != nil {
		return err
	}

	versionNum := strings.TrimPrefix(version, "v")
	pkgverRegex := regexp.MustCompile(`^pkgver=.*$`)
	pkgrelRegex := regexp.MustCompile(`^pkgrel=.*$`)

	for i, line := range lines {
		trimmed := strings.TrimSpace(line)
		switch {
		case pkgverRegex.MatchString(trimmed):
			lines[i] = fmt.Sprintf("pkgver=%s", versionNum)
		case pkgrelRegex.MatchString(trimmed):
			lines[i] = "pkgrel=1"
		}
	}

	return u.fm.WriteLines(pkgbuildFile, lines)
}

// ReleaseChecker fetches latest version from GitHub
type ReleaseChecker struct {
	httpClient *HTTPClient
}

func NewReleaseChecker(httpClient *HTTPClient) *ReleaseChecker {
	return &ReleaseChecker{httpClient: httpClient}
}

func (rc *ReleaseChecker) GetLatestVersion(ctx context.Context) (string, error) {
	var release GitHubRelease
	err := rc.httpClient.GetJSON(ctx, githubAPIURL, &release)
	if err != nil {
		return "", fmt.Errorf("fetching latest release: %w", err)
	}

	if release.TagName == "" {
		return "", fmt.Errorf("no tag_name in API response")
	}

	return release.TagName, nil
}

// UserInteraction handles user prompts
type UserInteraction struct {
	reader *bufio.Reader
}

func NewUserInteraction() *UserInteraction {
	return &UserInteraction{
		reader: bufio.NewReader(os.Stdin),
	}
}

func (ui *UserInteraction) ConfirmBuild(ctx context.Context) (bool, error) {
	fmt.Print("Build package now? [y/N]: ")

	responseCh := make(chan string, 1)
	errCh := make(chan error, 1)

	go func() {
		response, err := ui.reader.ReadString('\n')
		if err != nil {
			if err == io.EOF {
				responseCh <- ""
				return
			}
			errCh <- err
			return
		}
		responseCh <- strings.ToLower(strings.TrimSpace(response))
	}()

	select {
	case <-ctx.Done():
		fmt.Println()
		return false, ctx.Err()
	case err := <-errCh:
		return false, err
	case response := <-responseCh:
		return response == "y" || response == "yes", nil
	}
}

// PackageBuilder handles package building operations
type PackageBuilder struct {
	cmdRunner *CommandRunner
	fm        *FileManager
}

func NewPackageBuilder(cmdRunner *CommandRunner, fm *FileManager) *PackageBuilder {
	return &PackageBuilder{
		cmdRunner: cmdRunner,
		fm:        fm,
	}
}

func (pb *PackageBuilder) UpdateChecksums(ctx context.Context) error {
	return pb.cmdRunner.Run(ctx, "updpkgsums")
}

func (pb *PackageBuilder) UpdateSRCINFO(ctx context.Context) error {
	output, err := pb.cmdRunner.RunWithOutput(ctx, "makepkg", "--printsrcinfo")
	if err != nil {
		return err
	}

	err = os.WriteFile(srcinfoFile, output, 0644)
	if err != nil {
		return fmt.Errorf("writing %s: %w", srcinfoFile, err)
	}

	return nil
}

func (pb *PackageBuilder) BuildPackage(ctx context.Context) error {
	cmd := exec.CommandContext(ctx, "makepkg", "-s")
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr

	// Handle process group for proper signal handling
	cmd.SysProcAttr = &syscall.SysProcAttr{
		Setpgid:   true,
		Pdeathsig: syscall.SIGTERM,
	}

	if err := cmd.Start(); err != nil {
		return fmt.Errorf("starting makepkg: %w", err)
	}

	done := make(chan error, 1)
	go func() {
		done <- cmd.Wait()
	}()

	select {
	case <-ctx.Done():
		pb.killProcessGroup(cmd)
		return fmt.Errorf("build cancelled")
	case err := <-done:
		if err != nil {
			if exitError, ok := err.(*exec.ExitError); ok {
				return fmt.Errorf("makepkg failed with exit code %d", exitError.ExitCode())
			}
			return fmt.Errorf("makepkg error: %w", err)
		}
		return nil
	}
}

func (pb *PackageBuilder) killProcessGroup(cmd *exec.Cmd) {
	if cmd.Process == nil {
		return
	}

	if pgid, err := syscall.Getpgid(cmd.Process.Pid); err == nil {
		syscall.Kill(-pgid, syscall.SIGTERM)
		time.Sleep(2 * time.Second)
		syscall.Kill(-pgid, syscall.SIGKILL)
	}
}

// Application is the main application struct
type Application struct {
	releaseChecker  *ReleaseChecker
	pkgbuildUpdater *PKGBUILDUpdater
	packageBuilder  *PackageBuilder
	userInteraction *UserInteraction
	fm              *FileManager
	config          *Config
}

func NewApplication(config *Config) *Application {
	httpClient := NewHTTPClient(config.HTTPTimeout)
	fm := &FileManager{}
	cmdRunner := &CommandRunner{}

	return &Application{
		releaseChecker:  NewReleaseChecker(httpClient),
		pkgbuildUpdater: NewPKGBUILDUpdater(fm),
		packageBuilder:  NewPackageBuilder(cmdRunner, fm),
		userInteraction: NewUserInteraction(),
		fm:              fm,
		config:          config,
	}
}

func (app *Application) validateEnvironment() error {
	if !app.fm.Exists(pkgbuildFile) {
		return fmt.Errorf("%s not found in current directory", pkgbuildFile)
	}

	requiredCommands := []string{"updpkgsums", "makepkg"}
	for _, cmd := range requiredCommands {
		if _, err := exec.LookPath(cmd); err != nil {
			return fmt.Errorf("required command '%s' not found in PATH", cmd)
		}
	}

	return nil
}

func (app *Application) updatePackageFiles(ctx context.Context, version string) error {
	log.Action("Updating PKGBUILD...")
	if err := app.pkgbuildUpdater.UpdateVersion(version); err != nil {
		return fmt.Errorf("updating PKGBUILD: %w", err)
	}

	log.Action("Updating checksums...")
	if err := app.packageBuilder.UpdateChecksums(ctx); err != nil {
		return fmt.Errorf("updating checksums: %w", err)
	}

	log.Action("Updating .SRCINFO...")
	if err := app.packageBuilder.UpdateSRCINFO(ctx); err != nil {
		return fmt.Errorf("updating .SRCINFO: %w", err)
	}

	return nil
}

func (app *Application) Run() error {
	ctx, cancel := context.WithCancel(context.Background())
	defer cancel()

	// Handle interrupts gracefully
	sigCh := make(chan os.Signal, 1)
	signal.Notify(sigCh, os.Interrupt, syscall.SIGTERM)
	go func() {
		<-sigCh
		log.Info("Interrupt received, cancelling...")
		cancel()
	}()

	// Validate environment
	if err := app.validateEnvironment(); err != nil {
		return err
	}

	// Get latest version
	log.Action("Fetching latest version from GitHub...")
	fetchCtx, fetchCancel := context.WithTimeout(ctx, app.config.HTTPTimeout)
	defer fetchCancel()

	version, err := app.releaseChecker.GetLatestVersion(fetchCtx)
	if err != nil {
		if ctx.Err() != nil {
			return fmt.Errorf("operation cancelled")
		}
		return fmt.Errorf("getting latest version: %w", err)
	}

	log.Info("Latest version: %s", version)

	// Update package files
	updateCtx, updateCancel := context.WithTimeout(ctx, 60*time.Second)
	defer updateCancel()

	if err := app.updatePackageFiles(updateCtx, version); err != nil {
		if ctx.Err() != nil {
			return fmt.Errorf("operation cancelled")
		}
		return err
	}

	log.Success("Package files updated to version %s", version)

	// Ask user about building
	shouldBuild, err := app.userInteraction.ConfirmBuild(ctx)
	if err != nil {
		if ctx.Err() != nil {
			return fmt.Errorf("operation cancelled")
		}
		return fmt.Errorf("getting user input: %w", err)
	}

	if !shouldBuild {
		log.Info("Skipping package build")
		return nil
	}

	// Build package
	log.Action("Building package...")
	buildCtx, buildCancel := context.WithTimeout(ctx, app.config.BuildTimeout)
	defer buildCancel()

	if err := app.packageBuilder.BuildPackage(buildCtx); err != nil {
		if ctx.Err() != nil {
			return fmt.Errorf("build cancelled")
		}
		return fmt.Errorf("building package: %w", err)
	}

	log.Success("Package built successfully!")
	return nil
}

func main() {
	config := &Config{
		HTTPTimeout:  httpTimeout,
		BuildTimeout: buildTimeout,
	}

	app := NewApplication(config)

	if err := app.Run(); err != nil {
		log.Error("%v", err)
		os.Exit(1)
	}
}

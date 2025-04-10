package main

import (
	"fmt"
	"os"
	"os/exec"
	"strings"
	"time"

	"fyne.io/fyne/v2"
	"fyne.io/fyne/v2/app"
	"fyne.io/fyne/v2/container"
	"fyne.io/fyne/v2/dialog"
	"fyne.io/fyne/v2/widget"
)

// checkDisplayServer checks if the current display server is supported
func checkDisplayServer() error {
	// Check if running under Wayland
	if os.Getenv("WAYLAND_DISPLAY") != "" ||
		os.Getenv("XDG_SESSION_TYPE") == "wayland" ||
		os.Getenv("WAYLAND_SOCKET") != "" {
		return nil // Wayland is supported
	}

	return fmt.Errorf("no Wayland display server detected")
}

// getDisplayServerType returns the type of display server being used
func getDisplayServerType() string {
	if os.Getenv("WAYLAND_DISPLAY") != "" ||
		os.Getenv("XDG_SESSION_TYPE") == "wayland" ||
		os.Getenv("WAYLAND_SOCKET") != "" {
		return "Wayland"
	}

	return "Unknown"
}

// getDesktopEntry returns the appropriate desktop entry path based on display server
func getDesktopEntry() string {
	displayType := getDisplayServerType()
	switch displayType {
	case "Wayland":
		return "/usr/share/applications/system76-power-gui-wayland.desktop"
	default:
		// Default to Wayland if we can't determine
		return "/usr/share/applications/system76-power-gui-wayland.desktop"
	}
}

// executeCommand runs a given command with sudo and returns its output or an error.
func executeCommand(command string, args ...string) (string, error) {
	cmdArgs := append([]string{command}, args...)
	cmd := exec.Command("pkexec", cmdArgs...)

	// Set up command environment
	cmd.Env = append(os.Environ(),
		"WAYLAND_DISPLAY="+os.Getenv("WAYLAND_DISPLAY"),
		"XDG_SESSION_TYPE="+os.Getenv("XDG_SESSION_TYPE"),
		"WAYLAND_SOCKET="+os.Getenv("WAYLAND_SOCKET"),
	)

	output, err := cmd.CombinedOutput()
	if err != nil {
		return "", fmt.Errorf("command execution failed: %v\nOutput: %s", err, string(output))
	}

	return string(output), nil
}

// getStatus retrieves the current system76-power profile.
func getStatus() (string, error) {
	// First check if system76-power is available
	if _, err := exec.LookPath("system76-power"); err != nil {
		return "", fmt.Errorf("system76-power is not installed or not in PATH: %v", err)
	}

	// Try to get the profile
	output, err := executeCommand("system76-power", "profile")
	if err != nil {
		return "", fmt.Errorf("failed to get current profile: %v", err)
	}

	profile := strings.TrimSpace(output)
	if profile == "" {
		return "", fmt.Errorf("received empty profile from system76-power")
	}

	return profile, nil
}

// isNonCriticalError checks if the error is non-critical (like SCSI errors)
func isNonCriticalError(output string) bool {
	// Check for SCSI-related errors in DBus error output
	return strings.Contains(output, "failed to set scsi host profiles") &&
		strings.Contains(output, "org.freedesktop.DBus.Error.Failed")
}

// trySetProfile attempts to set the profile once
func trySetProfile(profile string) error {
	output, err := executeCommand("system76-power", "profile", profile)
	if err != nil {
		// Check if this is a non-critical error
		if isNonCriticalError(output) {
			// Wait a moment for the profile to be applied
			time.Sleep(time.Millisecond * 500)

			// Verify if the profile was set despite the SCSI error
			currentProfile, checkErr := getStatus()
			if checkErr == nil && currentProfile == profile {
				fmt.Printf("Profile set to %s (with non-critical SCSI warnings)\n", profile)
				return nil
			}
		}
		return fmt.Errorf("failed to set profile: %v", err)
	}
	return nil
}

// setProfile sets the system76-power profile to the specified mode with one retry.
func setProfile(profile string) error {
	// First attempt
	err := trySetProfile(profile)
	if err == nil {
		fmt.Printf("Profile set to %s successfully.\n", profile)
		return nil
	}

	// If first attempt failed, wait a bit and retry once
	fmt.Printf("First attempt failed, retrying after delay...\n")
	time.Sleep(time.Second * 1)

	// Second attempt
	err = trySetProfile(profile)
	if err == nil {
		fmt.Printf("Profile set to %s successfully on second attempt.\n", profile)
		return nil
	}

	return fmt.Errorf("failed to set profile to %s after retry: %v", profile, err)
}

type powerApp struct {
	app    fyne.App
	window fyne.Window
}

// createTrayMenu creates the menu for the window
func (p *powerApp) createMenu() *fyne.MainMenu {
	menu := fyne.NewMainMenu(
		fyne.NewMenu("Power Profile",
			fyne.NewMenuItem("Battery Mode", func() {
				if err := setProfile("battery"); err != nil {
					showError(err, p.window)
				}
			}),
			fyne.NewMenuItem("Balanced Mode", func() {
				if err := setProfile("balanced"); err != nil {
					showError(err, p.window)
				}
			}),
			fyne.NewMenuItem("Performance Mode", func() {
				if err := setProfile("performance"); err != nil {
					showError(err, p.window)
				}
			}),
			fyne.NewMenuItemSeparator(),
			fyne.NewMenuItem("Quit", func() { p.app.Quit() }),
		),
	)
	return menu
}

// showError displays an error in a dialog with selectable text
func showError(err error, window fyne.Window) {
	errEntry := widget.NewMultiLineEntry()
	errEntry.SetText(err.Error())
	errEntry.Disable()
	d := dialog.NewCustom("Error", "OK", errEntry, window)
	d.Resize(fyne.NewSize(400, 100))
	d.Show()
}

// updateStatus periodically updates the status label
func (p *powerApp) updateStatus(statusLabel *widget.Label) {
	for {
		status, err := getStatus()
		if err != nil {
			fmt.Fprintf(os.Stderr, "Error updating status: %v\n", err)
			time.Sleep(5 * time.Second)
			continue
		}
		statusLabel.SetText(fmt.Sprintf("%s", status))
		time.Sleep(1 * time.Second)
	}
}

func main() {
	// Check display server compatibility first
	displayType := getDisplayServerType()
	if err := checkDisplayServer(); err != nil {
		fmt.Fprintf(os.Stderr, "Error: %v\n", err)
		fmt.Fprintf(os.Stderr, "This application requires Wayland display server.\n")
		fmt.Fprintf(os.Stderr, "Detected display server: %s\n", displayType)
		fmt.Fprintf(os.Stderr, "Environment variables:\n")
		fmt.Fprintf(os.Stderr, "WAYLAND_DISPLAY: %s\n", os.Getenv("WAYLAND_DISPLAY"))
		fmt.Fprintf(os.Stderr, "XDG_SESSION_TYPE: %s\n", os.Getenv("XDG_SESSION_TYPE"))
		fmt.Fprintf(os.Stderr, "WAYLAND_SOCKET: %s\n", os.Getenv("WAYLAND_SOCKET"))
		os.Exit(1)
	}

	// Create application
	a := app.New()
	w := a.NewWindow("System76 Power Profile")

	// Create our app structure
	powerApp := &powerApp{
		app:    a,
		window: w,
	}

	// Set up menu
	w.SetMainMenu(powerApp.createMenu())

	// Create main window content
	statusLabel := widget.NewLabel("Current profile: Unknown")

	// Start background status updater
	go powerApp.updateStatus(statusLabel)

	// Create profile buttons
	batteryButton := widget.NewButton("Battery Mode", func() {
		if err := setProfile("battery"); err != nil {
			fmt.Fprintf(os.Stderr, "Error setting profile: %v\n", err)
			return
		}
	})

	balancedButton := widget.NewButton("Balanced Mode", func() {
		if err := setProfile("balanced"); err != nil {
			fmt.Fprintf(os.Stderr, "Error setting profile: %v\n", err)
			return
		}
	})

	performanceButton := widget.NewButton("Performance Mode", func() {
		if err := setProfile("performance"); err != nil {
			fmt.Fprintf(os.Stderr, "Error setting profile: %v\n", err)
			return
		}
	})

	// Set up window content
	w.SetContent(container.NewVBox(
		statusLabel,
		widget.NewSeparator(),
		batteryButton,
		balancedButton,
		performanceButton,
	))

	// Set window properties
	w.Resize(fyne.NewSize(300, 200))
	w.SetCloseIntercept(func() { w.Hide() }) // Hide instead of close

	// Start application
	w.Show()
	a.Run()
}

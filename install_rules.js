function Controller() {
    installer.autoRejectMessageBoxes();
    installer.setMessageBoxAutomaticAnswer("OverwriteTargetDirectory", QMessageBox.Yes);
    installer.setMessageBoxAutomaticAnswer("stopProcessesForUpdates", QMessageBox.Ignore);
    installer.setMessageBoxAutomaticAnswer("installationError", QMessageBox.Ignore);
    installer.installationFinished.connect(function() {
        gui.clickButton(buttons.NextButton);
    });
    installer.uninstallationFinished.connect(function() {
        gui.clickButton(buttons.NextButton);
    });
}

Controller.prototype.WelcomePageCallback = function() {
    console.log("component: " + gui.currentPageWidget());
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.CredentialsPageCallback = function() {
    console.log("component: " + gui.currentPageWidget());
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.IntroductionPageCallback = function() {
    console.log("component: " + gui.currentPageWidget());
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.TargetDirectoryPageCallback = function() {
    console.log("component: " + gui.currentPageWidget());
    gui.currentPageWidget().TargetDirectoryLineEdit.setText("/opt/SailfishOS/SDK");
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.PerformInstallationPageCallback = function() {
    var widget = gui.currentPageWidget();
    console.log("component: " + widget);
}

Controller.prototype.DynamicWorkspaceWidgetCallback = function() {
    var widget = gui.currentPageWidget();
    console.log("component: " + widget);
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.ComponentSelectionPageCallback = function() {
    var widget = gui.currentPageWidget();
    console.log("component: " + widget);
    widget.selectAll();
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.LicenseAgreementPageCallback = function() {
    gui.currentPageWidget().AcceptLicenseRadioButton.setChecked(true);
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.StartMenuDirectoryPageCallback = function() {
    console.log("component: " + gui.currentPageWidget());
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.ReadyForInstallationPageCallback = function() {
    console.log("component: " + gui.currentPageWidget());
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.FinishedPageCallback = function() {
    var widget = gui.currentPageWidget();
    console.log("component: " + widget);

    var checkBoxForm = widget.RunItCheckBox;
    console.log("component: " + checkBoxForm);

    if (checkBoxForm) {
        checkBoxForm.checked = false;
    }
    gui.clickButton(buttons.FinishButton);
}
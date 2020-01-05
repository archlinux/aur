unix:!macx {
	isEmpty(PREFIX) {
		PREFIX = /usr
	}

	target.path = $${PREFIX}/bin

	icon.path = $${PREFIX}/share/pixmaps
	icon.files = applications/vokoscreenNG.png

	desktop.path = $${PREFIX}/share/applications
	desktop.files = applications/vokoscreenNG.desktop

	INSTALLS += target icon desktop
}

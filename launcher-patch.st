PhLVmProvider subclass: #PhLVmProviderArchlinux90
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'PharoLauncher-Core-Download-Arch'.

PhLVmProviderArchlinux90 compile: 'urlTemplate
	^ ''https://badetitou.github.io/files/archlinux/90-x64-Arch.zip'''.

PhLVmProviderArchlinux90 compile: 'urlForStable: useStableVm
	^ self urlTemplate'.

PhLVmProviderArchlinux90 compile: 'urlForPharo: pharoVersion stable: useStableVm
	^ self urlTemplate'.

PhLVmProvider class compile: 'for: aPhLVirtualMachineOrManager
	| class |
	class := aPhLVirtualMachineOrManager pharoVersion asInteger < 90
		ifTrue: [ PhLVmProviderUntilPharo80 ]
		ifFalse: [ aPhLVirtualMachineOrManager pharoVersion asInteger < 110
				ifTrue: [ PhLVmProviderArchlinux90 ]
				ifFalse: [ self ] ].
	^ class new
		vmManager: aPhLVirtualMachineOrManager;
		yourself'.


Smalltalk snapshot: true andQuit: true
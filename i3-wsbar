#!/usr/bin/env perl

use strict;
use warnings;
use Pod::Usage;
use IPC::Run qw(start pump);
use AnyEvent::I3;
use AnyEvent;
use v5.10;

my $dmplex = "";
if ($#ARGV >= 0) {
	$dmplex = $ARGV[0] . " ";
}

my $i3 = i3;
my $workspaces = [];

# Disable buffering
$| = 1;

# Wait a short amount of time and try to connect to i3 again
sub reconnect {
	my $timer;
	my $c = sub {
		$timer = AnyEvent->timer(
			after => 0.01,
			cb => sub { $i3->connect->cb(\&connected) }
		);
	};
	$c->();
}

# Connection attempt succeeded or failed
sub connected {
	my ($cv) = @_;
	
	if (!$cv->recv) {
		reconnect();
		return;
	}
	
	$i3->subscribe({
		workspace => \&ws_change,
		_error => sub { reconnect() }
	});
	ws_change();
}

# Called when a ws changes
sub ws_change {
	# Request the current workspaces and update the output afterwards
	$i3->get_workspaces->cb(
		sub {
			my ($cv) = @_;
			$workspaces = $cv->recv;
			update_output();
		}
	);
}

sub update_output {
	my $dzen_bg = "#000000";
	my $out;
	my $width = "1366";

	$out = qq|$dmplex|;
	$out .= qq|^pa(;0)|;
	for my $ws (@{$workspaces})
	{
		my ($bg, $fg) = qw(333333 888888);
		($bg, $fg) = qw(4c7899 ffffff) if $ws->{visible};
		($bg, $fg) = qw(900000 ffffff) if $ws->{urgent};

		my $cmd = q|i3-msg "workspace | . $ws->{num} . q|"|;
		my $name = $ws->{name};

		# Begin the clickable area
		$out .= qq|^ca(1,$cmd)|;

		# Draw the rest of the bar in the background color, but
		# don’t move the "cursor"
		$out .= qq|^p(_LOCK_X)^fg(#$bg)^r(${width}x20)^p(_UNLOCK_X)|;
		# Draw the name of the workspace without overwriting the
		# background color
		$out .= qq|^p(+4;+1)^fg(#$fg)^ib(1)$name^ib(0)^p(+5;-1)|;
		# Draw the rest of the bar in the normal background color
		# without moving the "cursor"
		$out .= qq|^p(_LOCK_X)^fg($dzen_bg)^r(${width}x17)^p(_UNLOCK_X)|;

		# End the clickable area
		$out .= qq|^ca()|;

		# Move to the next rect, reset Y coordinate
		$out .= qq|^p(2)^pa(;0)|;
	}

	$out .= qq|^p(+5)|;
	$out .= "\n";

	print $out;
}

$i3->connect->cb(\&connected);

# let AnyEvent do the rest ("endless loop")
AnyEvent->condvar->recv

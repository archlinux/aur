#!/usr/bin/perl

# Copyright (C) 2011-2017 Daniel "Trizen" Șuteu
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#
#-------------------------------------------------------
#  Appname: srt-delay
#  Version: 0.0.6
#  Created: 26 December 2011
#  Edit on: 19 October 2020
#  https://github.com/trizen
#-------------------------------------------------------

use 5.014;
use strict;
use warnings;

use Getopt::Long qw(GetOptions);

sub usage {
    my ($exit_code) = @_;
    print <<"USAGE";
usage: $0 [options] [seconds] [file.srt]

Options:
    -b  --backup    : backup original to .bak
    -d  --delay=f   : number of seconds of delay
    -s  --scale=f   : scale the timestamps by a multiple

Examples: $0 -b -d=1.439 file.srt
          $0 -b -d=0.321 file.srt
          $0 -b -d=-3.14 file.srt
USAGE
    exit($exit_code // 0);
}

sub time2sec {
    my @out;
    foreach my $time (@_) {
        my ($hours, $min, $sec, $milisec) = split(/[:,]/, $time, 4);
        push @out, $hours * 3600 + $min * 60 + $sec + $milisec / 1000;
    }
    return @out;
}

sub sec2time {
    my @out;
    foreach my $sec (map { sprintf '%.3f', $_ } @_) {
        push @out,
          sprintf('%02d:%02d:%02d,%03d', ($sec / 3600 % 24, $sec / 60 % 60, $sec % 60, substr($sec, index($sec, '.') + 1)));
    }
    return @out;
}

my $delay  = 0;
my $backup = 0;
my $scale  = 1;

GetOptions(
           "b|backup!" => \$backup,
           "s|scale=f" => \$scale,
           "d|delay=f" => \$delay,
           "h|help"    => sub { usage(0) },
          )
  or die("Error in command line arguments");

my @files = grep { -f $_ } @ARGV;

@files || usage(2);

foreach my $file (@files) {
    my @output;
    open my $fh, '<', $file or die "Unable to open for read ${file}: $!\n";
    while (defined(my $line = <$fh>)) {
        if ($line =~ /^\d+:\d+:\d+(?:,\d+)?\s*-->\s*\d+:\d+:\d+(?:,\d+)?(\s*)\z/) {
            push @output, join(
                ' --> ',
                sec2time(
                    map {
                        my $sec = $scale * $_ + $delay;
                        ($sec >= 0)
                          ? $sec
                          : !warn "[!] Time cannot be lower than zero at line $.\n";
                    } time2sec(split(/\s*-->\s*/, $line, 2))
                )
              )
              . $1;
        }
        else { push @output, $line }
    }

    close $fh;
    rename $file, "$file.bak" if $backup;

    open $fh, '>', $file or die "Unable to open for write ${file}: $!\n";
    print {$fh} @output;
    close $fh;
}

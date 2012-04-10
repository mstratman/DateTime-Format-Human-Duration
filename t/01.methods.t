use Test::More tests => 22;
use lib '../lib';

BEGIN {
    use_ok( 'DateTime::Format::Human::Duration' );
}

diag( "Testing DateTime::Format::Human::Duration $DateTime::Format::Human::Duration::VERSION" );

# plan skip_all => 'DateTime required for creating DateTime object and durations' if $@;
# That fails under Test::More 0.70 like so:
#   You tried to plan twice at t/01.methods.t line 11.
#   Looks like you planned 22 tests but only ran 1.
#   Looks like your test died just after 1.

SKIP: {
    eval 'use DateTime';
    skip 'DateTime required for creating DateTime object and durations', 22 if $@;

    my $span = DateTime::Format::Human::Duration->new();
    ok(ref $span eq 'DateTime::Format::Human::Duration', 'Obj creation');
    my $time = time;
    my $dua = DateTime->from_epoch( 'epoch' => $time );
    my $dub = DateTime->from_epoch( 'epoch' => ($time + 2), 'locale' => 'fr' );
    my $duc = DateTime->from_epoch( 'epoch' => ($time + 63) );
    my $dud = DateTime->from_epoch( 'epoch' => ($time + 3625.4455) );
    my $due = DateTime->from_epoch( 'epoch' => ($time + 23775453.345) );
    my $duf = DateTime->from_epoch( 'epoch' => ($time + 61) );

    my $dura = $dua - $dua;
    # my $durb = $dua - $dub;
    my $durc = $dua - $dub;
    my $durd = $dub - $dua;
    my $dure = $dua - $duc;
    my $durf = $dua - $dud;
    my $durg = $dua - $due;

    ok( $span->format_duration($dura) eq 'no time', 'No difference w/ default no_time');
    ok( $span->format_duration($dura,  'no_time' => 'absolutely no time' ) eq 'absolutely no time', 'No difference w/ no_time');
    ok( $span->format_duration($dura,  'no_time' => '' ) eq '', 'No difference w/ empty no_time');
    ok( $span->format_duration($durc) eq '2 seconds', '1 value');
    ok( $span->format_duration_between($dub, $dua) eq '2 seconds', 'Reverse/Negative is still positive (not "no time")');
    ok( $span->format_duration_between($dua, $duf) eq '1 minute and 1 second', '2 (singular values)');
    ok( $span->format_duration($dure) eq '1 minute and 3 seconds', '2 values (mixed)' );
    ok( $span->format_duration($durf) eq '1 hour, 25 seconds, and 445499897 nanoseconds', '> 2 values (3)');

    ok( $span->format_duration($durg) eq '9 months, 1 day, 4 hours, 17 minutes, 33 seconds, and 345000028 nanoseconds', '> 2 values (5)');

    ok( $span->format_duration($durc, 'future' => 'Hello, You have %s left') eq 'Hello, You have 2 seconds left', 'string with %s');
    ok( $span->format_duration($durc, 'future' => 'You have') eq 'You have 2 seconds', 'string w/ out %s');
    ok( $span->format_duration_between($dua, $dub) eq '2 seconds', 'DateTime object method format_duration_between()');

    ok( $span->format_duration_between($dua, $duc, 'past'=>'Was done %s ago.','future' => 'Will be done in %s.') eq 'Will be done in 1 minute and 3 seconds.','$a->format_duration_between($b): $a < $b = future');
    ok( $span->format_duration_between($duc, $dua, 'past'=>'Was done %s ago.','future' => 'Will be done in %s.') eq 'Was done 1 minute and 3 seconds ago.','$a->format_duration_between($b): $a > $b = past');

    ok( $span->format_duration_between( $duc, $duc->clone()->add('seconds'=> 62) ) eq '1 minute and 2 seconds', 'clone exmple');
    ok( $span->format_duration( DateTime::Duration->new('seconds'=> 62) ) eq '62 seconds', 'Ambiguous duration (baseless)');

    # test 'locale' key
    ok( $span->format_duration($dure, 'locale' => 'fr') eq '1 minute et 3 seconds', 'locale key as string format_duration()');
    ok( $span->format_duration($dure, 'locale' => $dub) eq '1 minute et 3 seconds', 'locale key as $DateTime obj format_duration()');
    ok( $span->format_duration($dure, 'locale' => $dub->{'locale'}) eq '1 minute et 3 seconds', 'locale key as $DateTime->{\'locale\'} format_duration()');
    ok( $span->format_duration_between($dub, $duc) eq '1 minute et 1 seconde', 'Object\'s locale used in format_duration_between()');

};
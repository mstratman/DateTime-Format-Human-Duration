package DateTime::Format::Human::Duration::Locale::nb;
# XXX: this isn't really NB locale, I just cheat the system.
#
sub get_human_span_from_units_array {
    my ($years, $months, $weeks, $days, $hours, $minutes, $seconds, $nanoseconds, $args_hr) = @_; # note: has no negative numbers
    if ($years) {
        $s =  $years . "y";
    } elsif ($months) {
        $s =  $months . "mo";
    } elsif ($weeks) {
        $s =  $weeks . "w";
    } elsif ($days) {
        $s =  $days . "d";
    } elsif ($hours) {
        $s =  $hours . "h";
    } elsif ($minutes) {
        $s =  $minutes . "mi";
    } elsif ($seconds) {
        $s =  "moments";
    }
    return $s;
}

1;

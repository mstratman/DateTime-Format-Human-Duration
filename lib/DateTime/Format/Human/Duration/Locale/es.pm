package DateTime::Format::Human::Duration::Locale::es;

use strict;
use warnings;

# Note to self: change 01.methods.t use of 'es' if this hashref changes or is removed

# 1 year, 1 month, 1 week, 1 day, 1 hour, 1 minute, 1 second, and 1 nanosecond
# 2 years, 2 months, 2 weeks, 2 days, 2 hours, 2 minutes, 2 seconds, and 2 nanoseconds

sub get_human_span_hashref {
    return {
        'no_oxford_comma' => 0,
        'no_time' => 'no hay tiempo',
        'and'     => 'y',    
        'year'  => 'año',
        'years' => 'años',
        'month'  => 'mes',
        'months' => 'meses',
        'week'  => 'semana',
        'weeks' => 'semanas',
        'day'  => 'día',
        'days' => 'días',
        'hour'  => 'hora',
        'hours' => 'horas',
        'minute'  => 'minuto',
        'minutes' => 'minutos',
        'second'  => 'segundo',
        'seconds' => 'segundos',
        'nanosecond'  => 'nanosegundo',
        'nanoseconds' => 'nanosegundos',
    };
}

# get_human_span_from_units_array() is used instead of get_human_span_hashref() if get_human_span_from_units_array() exists
# 
# sub get_human_span_from_units_array {
#    my ($years, $months, $weeks, $days, $hours, $minutes, $seconds, $nanoseconds, $args_hr) = @_; # note: has no negative numbers
#    ...
#    return $string; # 1 year, 2days, 4 hours, and 17 minutes
# }

1;
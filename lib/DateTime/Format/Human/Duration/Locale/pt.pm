package DateTime::Format::Human::Duration::Locale::pt;

use strict;
use warnings;

sub get_human_span_hashref {
    return {
        'no_oxford_comma' => 0,
        'no_time' => 'nenhum momento',
        'and'     => 'e',    
        'year'  => 'ano',
        'years' => 'anos',
        'month'  => 'mês',
        'months' => 'meses',
        'week'  => 'semana',
        'weeks' => 'semanas',
        'day'  => 'dia',
        'days' => 'dias',
        'hour'  => 'hora',
        'hours' => 'horas',
        'minute'  => 'minuto',
        'minutes' => 'minutos',
        'second'  => 'segundo',
        'seconds' => 'segundos',
        'nanosecond'  => 'nanosegundo', # nanosecond ?
        'nanoseconds' => 'nanosegundos', # nanosegundos ?
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
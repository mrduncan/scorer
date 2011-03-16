String Scorer
=============

String scorer is a port of Joshaven Potter's [string_score][0] to Ruby.

Usage
-----

Install using `gem install scorer`

    "Hello World".score("HW")  # => 0.681818181818182
    "Hello World".score("Hello World")  # => 1
    "Hello World".score("Hellz")  # => 0

Benchmarks
----------

All benchmarks below were run on a 2GHz Intel Core i7 MacBook Pro.

Ruby 1.8.7-p334

    Benchmarking 4000 iterations...
    Rehearsal ------------------------------------------------------
    one letter           0.050000   0.000000   0.050000 (  0.051634)
    two letters          0.080000   0.000000   0.080000 (  0.079367)
    full match           0.010000   0.000000   0.010000 (  0.008245)
    13 char / 32 char    0.400000   0.000000   0.400000 (  0.400755)
    70 char / 446 char   2.160000   0.020000   2.180000 (  2.175756)
    --------------------------------------------- total: 2.720000sec

                            user     system      total        real
    one letter           0.050000   0.000000   0.050000 (  0.050115)
    two letters          0.080000   0.000000   0.080000 (  0.079156)
    full match           0.000000   0.000000   0.000000 (  0.002531)
    13 char / 32 char    0.400000   0.000000   0.400000 (  0.399183)
    70 char / 446 char   2.140000   0.020000   2.160000 (  2.150696)

REE 1.8.7-2011.03

    Benchmarking 4000 iterations...
    Rehearsal ------------------------------------------------------
    one letter           0.050000   0.000000   0.050000 (  0.044487)
    two letters          0.080000   0.000000   0.080000 (  0.079872)
    full match           0.000000   0.000000   0.000000 (  0.002488)
    13 char / 32 char    0.370000   0.000000   0.370000 (  0.375615)
    70 char / 446 char   2.030000   0.020000   2.050000 (  2.052322)
    --------------------------------------------- total: 2.550000sec

                            user     system      total        real
    one letter           0.040000   0.000000   0.040000 (  0.043564)
    two letters          0.070000   0.000000   0.070000 (  0.072628)
    full match           0.010000   0.000000   0.010000 (  0.002404)
    13 char / 32 char    0.380000   0.010000   0.390000 (  0.379886)
    70 char / 446 char   2.070000   0.020000   2.090000 (  2.087970)

Ruby 1.9.2-p180

    Benchmarking 4000 iterations...
    Rehearsal ------------------------------------------------------
    one letter           0.030000   0.000000   0.030000 (  0.031515)
    two letters          0.040000   0.000000   0.040000 (  0.046282)
    full match           0.010000   0.000000   0.010000 (  0.003206)
    13 char / 32 char    0.220000   0.000000   0.220000 (  0.228381)
    70 char / 446 char   1.250000   0.000000   1.250000 (  1.244834)
    --------------------------------------------- total: 1.550000sec

                            user     system      total        real
    one letter           0.030000   0.000000   0.030000 (  0.027971)
    two letters          0.050000   0.000000   0.050000 (  0.047023)
    full match           0.000000   0.000000   0.000000 (  0.001183)
    13 char / 32 char    0.240000   0.000000   0.240000 (  0.232444)
    70 char / 446 char   1.270000   0.010000   1.280000 (  1.275776)

JRuby 1.6.0

    Benchmarking 4000 iterations...
    Rehearsal ------------------------------------------------------
    one letter           0.435000   0.000000   0.435000 (  0.434000)
    two letters          0.314000   0.000000   0.314000 (  0.314000)
    full match           0.018000   0.000000   0.018000 (  0.018000)
    13 char / 32 char    0.345000   0.000000   0.345000 (  0.345000)
    70 char / 446 char   0.607000   0.000000   0.607000 (  0.608000)
    --------------------------------------------- total: 1.719000sec

                             user     system      total        real
    one letter           0.022000   0.000000   0.022000 (  0.022000)
    two letters          0.027000   0.000000   0.027000 (  0.027000)
    full match           0.001000   0.000000   0.001000 (  0.001000)
    13 char / 32 char    0.113000   0.000000   0.113000 (  0.113000)
    70 char / 446 char   0.600000   0.000000   0.600000 (  0.600000)

TODO
----

- Speed improvements (currently just a direct translation from JS)

Author
------
Matt Duncan | [mattduncan.org](http://mattduncan.org) |
[matt@mattduncan.org](mailto:matt@mattduncan.org)

[0]: http://github.com/joshaven/string_score

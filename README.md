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
    one letter           0.040000   0.010000   0.050000 (  0.048167)
    two letters          0.080000   0.000000   0.080000 (  0.077245)
    full match           0.000000   0.000000   0.000000 (  0.002621)
    13 char / 32 char    0.390000   0.000000   0.390000 (  0.390027)
    70 char / 446 char   2.080000   0.020000   2.100000 (  2.097540)
    --------------------------------------------- total: 2.620000sec

                            user     system      total        real
    one letter           0.050000   0.000000   0.050000 (  0.049213)
    two letters          0.080000   0.000000   0.080000 (  0.078087)
    full match           0.000000   0.000000   0.000000 (  0.002672)
    13 char / 32 char    0.390000   0.000000   0.390000 (  0.392568)
    70 char / 446 char   2.110000   0.020000   2.130000 (  2.123299)

REE 1.8.7-2011.03

    Benchmarking 4000 iterations...
    Rehearsal ------------------------------------------------------
    one letter           0.040000   0.000000   0.040000 (  0.041641)
    two letters          0.070000   0.000000   0.070000 (  0.070398)
    full match           0.000000   0.000000   0.000000 (  0.002513)
    13 char / 32 char    0.370000   0.000000   0.370000 (  0.369695)
    70 char / 446 char   1.970000   0.020000   1.990000 (  1.993213)
    --------------------------------------------- total: 2.470000sec

                            user     system      total        real
    one letter           0.040000   0.000000   0.040000 (  0.040514)
    two letters          0.070000   0.000000   0.070000 (  0.070292)
    full match           0.010000   0.000000   0.010000 (  0.002479)
    13 char / 32 char    0.350000   0.010000   0.360000 (  0.357149)
    70 char / 446 char   1.960000   0.020000   1.980000 (  1.976666)

Ruby 1.9.2-p180

    Benchmarking 4000 iterations...
    Rehearsal ------------------------------------------------------
    one letter           0.030000   0.000000   0.030000 (  0.027239)
    two letters          0.040000   0.000000   0.040000 (  0.046683)
    full match           0.000000   0.000000   0.000000 (  0.001215)
    13 char / 32 char    0.240000   0.000000   0.240000 (  0.235381)
    70 char / 446 char   1.290000   0.000000   1.290000 (  1.291830)
    --------------------------------------------- total: 1.600000sec

                            user     system      total        real
    one letter           0.030000   0.000000   0.030000 (  0.024999)
    two letters          0.040000   0.010000   0.050000 (  0.044981)
    full match           0.000000   0.000000   0.000000 (  0.001216)
    13 char / 32 char    0.230000   0.000000   0.230000 (  0.233336)
    70 char / 446 char   1.290000   0.000000   1.290000 (  1.280618)

JRuby 1.6.0

    Benchmarking 4000 iterations...
    Rehearsal ------------------------------------------------------
    one letter           0.373000   0.000000   0.373000 (  0.373000)
    two letters          0.274000   0.000000   0.274000 (  0.274000)
    full match           0.024000   0.000000   0.024000 (  0.024000)
    13 char / 32 char    0.445000   0.000000   0.445000 (  0.445000)
    70 char / 446 char   0.659000   0.000000   0.659000 (  0.659000)
    --------------------------------------------- total: 1.775000sec

                            user     system      total        real
    one letter           0.021000   0.000000   0.021000 (  0.021000)
    two letters          0.020000   0.000000   0.020000 (  0.021000)
    full match           0.002000   0.000000   0.002000 (  0.002000)
    13 char / 32 char    0.095000   0.000000   0.095000 (  0.095000)
    70 char / 446 char   0.490000   0.000000   0.490000 (  0.490000)

TODO
----

- Speed improvements (currently just a direct translation from JS)

Author
------
Matt Duncan | [mattduncan.org](http://mattduncan.org) |
[matt@mattduncan.org](mailto:matt@mattduncan.org)

[0]: http://github.com/joshaven/string_score

create_clock -period 10 -waveform {0 5} \$auto\$clkbufmap.cc:262:execute\$1715
create_clock -period 10 -waveform {2.5 7.5} \$auto\$clkbufmap.cc:262:execute\$1717
create_clock -period 2.5 -waveform {0 1.25} \$auto\$clkbufmap.cc:262:execute\$1719
create_clock -period 5 -waveform {1.25 3.75} \$auto\$clkbufmap.cc:262:execute\$1721
create_clock -period 10 -waveform {0 5} \$techmap1617\FDCE_0.C
create_clock -period 10 -waveform {2.5 7.5} main_clkout0
create_clock -period 2.5 -waveform {0 1.25} main_clkout1
create_clock -period 5 -waveform {1.25 3.75} main_clkout2

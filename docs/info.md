## How it works

This is a two-stage Operational Amplifier designed using SkyWater 130nm technology.
It features a differential input stage with active load and a common-source output stage with Miller compensation.
The design is optimized for a 1.8V supply voltage and drives a 2pF capacitive load.

## How to test

1. **Power Supply:** Connect 1.8V to VDPWR and 0V to VGND.
2. **Bias:** Connect a 10uA current source to the Ibias pin (ua[3]).
3. **Input:** Apply differential or single-ended signals to Vin+ (ua[0]) and Vin- (ua[1]).
4. **Output:** Measure the output signal at Vout (ua[2]).

## External hardware

None required, other than standard laboratory equipment (Power Supply, Signal Generator, Oscilloscope).

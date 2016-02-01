Moved to https://github.com/UA3MQJ/fpga-synth

# FPGA based modular synth #

FPGA (a digital Field Programmable Array) based modular synth.

<a href='https://sites.google.com/site/analogsynthdiy/sobstvennye-razrabotki/sintezator-na-baze-plis'>Documentation in Russian is on the site</a>

I'm doing an open source project of the hardware platform for creating digital and analog synthesizers. The project consists of modules from which (as of bricks), you can create your desired synthesizer (Mono Synth, Poly Synth, Organ, etc).

# Technical specifications and parameters that are planned #

Generating Unit:

  * 16 Polyphonic
  * Every vote - two generators with a detuning frequency, phase, and pan control
  * Selectable and configurable modes: one voice, unison, polyphonic
  * Switching waveform of each generator: sine, triangle, saw, square, PWM, supersaw.
  * External analog VCA controlled PWM with FPGAs
  * External analogue VCF controls the frequency with FPGAs
  * LFO inside the FPGA
  * ADSR inside the FPGA
  * Additional modules within the FPGA to emulate a fully digital VCA and VCF with the output of the FPGA (lo fi quality)

Control and display unit:

  * May be completely absent - version of the synthesizer as a rack unit, fully managed by MIDI, having only audio outputs
  * Analogue controls (variable resistors) with control in one direction (Control unit - Generating unit)
  * Digital controls (encoder) + position indicators, with the ability to control in both directions (with the ability to save and restore the position of the controls)

# The structure of the source tree #

[modules](http://code.google.com/p/fpga-synth/wiki/Modules) - modules are the building blocks of the synthesizer (common to all synthesizers)

benches - Test modules, which I check the work of the individual modules. Use <a href='http://bleyer.org/icarus/'>Icarus Verilog</a>

ModuleTester - Test project in the Quartus 11 in which I insert the test module, load it and compile inputs to determine its size in cells, memory multipliers, as well as the maximum frequency

VitaPolyOne - Quartus project of synthesizer <a href='https://sites.google.com/site/analogsynthdiy/sobstvennye-razrabotki/sintezator-na-baze-plis/6-vsti/1-vita-poly'>VitaPolyOne</a>

# Please donate project #
<a href='https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=527FFNJ2XQFVA'> <img src='https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif'>
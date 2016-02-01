# Features #

  * Controlled by MIDI commands
  * One voice (Waveform - Saw)
  * Pitch Wheel
  * ADSR
  * Digital OR Analog VCA

# MIDI Implementation Chart #

| **Function** | **Sub-Fun** | **TX** | **RX** | **Remarks** |
|:-------------|:------------|:-------|:-------|:------------|
| Basic Channel | default     | X      | 1-16   | any channel |
| Basic Channel | changed     | X      | X      |             |
| Note Number  |             | X      | 0-127  | Note 8 - 12544 Hz |
| Velocity     | note ON     | X      | X      | note ON     |
| Velocity     | note ON     | X      | X      | note OFF    |
| Pitch Bender |             | X      | 0-8192 | Pitch -1200..+1199 cents |
| Control Change | 16, 17, 18, 19 | X      | O      | A, D, S, R  |

O - Implemented

X - NOT implemented

# Ctrlr.com based VSTi #
<img src='https://fpga-synth.googlecode.com/svn/wiki/vita_poly_one_vsti.png'>

<h1>Foto</h1>
<img src='https://fpga-synth.googlecode.com/svn/wiki/vita_poly_one_photo1.jpg'>

<img src='https://fpga-synth.googlecode.com/svn/wiki/vita_poly_one_photo2.jpg'>

<h1>Audio examples</h1>

<ul><li><a href='https://soundcloud.com/vitasynth/vitasynth-saw-220-hz'>SAW 220 Hz</a>
</li><li><a href='https://soundcloud.com/vitasynth/vitasynth-square-wave-440-hz'>Square 440 Hz</a>
</li><li><a href='https://soundcloud.com/vitasynth/vitasynth-noise-rnd-8bit-stereo'>Stereo Noise</a>
</li><li><a href='https://soundcloud.com/vitasynth/vitasynth-saw-220-hz-saw-1hz-in-digital-vca'>SAW 200 Hz and SAW 1 Hz to DCA (Digital VCA)</a>
</li><li><a href='https://soundcloud.com/vitasynth/vitasynth-8-voice-sawsqr-bach'>Mixer test (poliphonic sound)</a>
</li><li><a href='https://soundcloud.com/vitasynth/tiasu-colour-negative-basspitch-wheel-test'>Pitch Wheel Test</a></li></ul>


<h1>Links</h1>
<a href='https://sites.google.com/site/analogsynthdiy/sobstvennye-razrabotki/sintezator-na-baze-plis/6-vsti/1-vita-poly'>Information about the project on the site (RUS)</a>.
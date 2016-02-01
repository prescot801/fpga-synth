# Hardware modules #

  * [Single button](Single_button.md)
  * [Switch](Switch.md)
  * [Led](Led.md)
  * [Single 7-segment display](Seven_segment_display.md)
  * [MIDI In](MIDI_In.md)
  * [1Bit Audio out](1Bit_Audio_out.md)
  * [VCA](VCA.md)


# FPGA modules #

## Generators ##

| **Monule Name** | **CLK** | **Function** | **Cells** | **MEM** | **MUL** | **Fmax/Restricted Fmax on C iv** | **Comment** |
|:----------------|:--------|:-------------|:----------|:--------|:--------|:---------------------------------|:------------|
| [dds32.v](https://code.google.com/p/fpga-synth/source/browse/trunk/modules/dds32.v) | Yes     | DDS generator 32 bit in / out  | 44        | -       | -       | 236.97 МГц / 236.97 МГц          |
| [note2dds.v](https://code.google.com/p/fpga-synth/source/browse/trunk/modules/note2dds.v) | Yes     | Note (0..127) to dds32 adder converter | 120       | -       |-        | 453 МГц / 250 МГц                | Лог схема с памятью (currrent stable)|
| [note2dds\_3st\_gen.v](https://code.google.com/p/fpga-synth/source/browse/trunk/modules/note2dds_3st_gen.v) | Yes     | Преобразование значения ноты 0..127 для входа dds32| 127       | -       |-        | 453 МГц / 250 МГц                | Получилась лог схема с памятью|
| [note2dds\_2st\_gen.v](https://code.google.com/p/fpga-synth/source/browse/trunk/modules/note2dds_2st_gen.v) | Yes     | Преобразование значения ноты 0..127 для входа dds32| 205       | -       |-        | 453 МГц / 238 МГц                | Получилась лог схема с памятью |
| [note2dds\_1st\_gen.v](https://code.google.com/p/fpga-synth/source/browse/trunk/modules/note2dds_1st_gen.v) | Yes     | Преобразование значения ноты 0..127 для входа dds32| 44        | 4096    |-        | 449 МГц / 238 МГц                | Получилась память |
| [note\_pitch2dds.v](https://code.google.com/p/fpga-synth/source/browse/trunk/modules/note_pitch2dds.v) | Yes     | Note (0..127) + pitch (0..8192) to dds32 adder converter | 266       | -       |-        | 66 МГц / 66 МГц                  | Данные из модуля note2dds.v (currrent)|
| [note\_pitch2dds\_2st\_gen.v](https://code.google.com/p/fpga-synth/source/browse/trunk/modules/note_pitch2dds_2st_gen.v) | Yes     | Преобразование значения ноты 0..127 + pitch для входа dds32| 364       | -       |-        | 91 МГц / 91 МГц                  | задержка в 5 клок (последовательный) |
| [note\_pitch2dds\_1st\_gen.v](https://code.google.com/p/fpga-synth/source/browse/trunk/modules/note_pitch2dds_1st_gen.v) | Yes     | Преобразование значения ноты 0..127 + pitch для входа dds32| 590       | -       |-        | 54 МГц / 54 МГц                  | задержка в 1 клок, но большой и 54 МГц (на грани) |
| [adsr32.v](https://code.google.com/p/fpga-synth/source/browse/trunk/modules/adsr32.v) (alpha) | Yes     |  ADSR генератор 32 битные входы и один выход | 167       | -       | -       | 107.32 МГц / 107.32 МГц          |
| [lin2exp.v](https://code.google.com/p/fpga-synth/source/browse/trunk/modules/lin2exp.v) | no      |  Преобразователь значения контрола 0..127 в 32 бита для входа ADSR. Кусочно-линейный.  | 333-429   | -       | -       | 439.75 МГц / 250 МГц             | recommended not to apply |
| [lin2exp\_t.v](https://code.google.com/p/fpga-synth/source/browse/trunk/modules/lin2exp_t.v) | no      |  Преобразователь значения 0..127 в 32 бита для входа ADSR. Табличный (if-elseif).  | 115       | -       | -       | ?                                | recommended not to apply |
| [rnd1.v](https://code.google.com/p/fpga-synth/source/browse/trunk/modules/rnd1.v) | Yes     | RND gen 1 bit | 32        | -       | -       | 728 МГц / 250 МГц                |             |
| [rnd8.v](https://code.google.com/p/fpga-synth/source/browse/trunk/modules/rnd8.v) | yes     | RND gen 8 bit | 250       | -       | -       | 622 МГц / 250 МГц                |             |


## DAC ##

| **Monule Name** | **CLK** | **Function** | **Cells** | **MEM** | **MUL** | **Fmax/Restricted Fmax on C iv** | **Comment** |
|:----------------|:--------|:-------------|:----------|:--------|:--------|:---------------------------------|:------------|
| [pwm8dac1.v](https://code.google.com/p/fpga-synth/source/browse/trunk/modules/pwm8dac1.v) | Yes     |  8 -> 1 PWM D/A converter Fdiscr = CLK/256 | 17        | -       | -       | 194 МГц / 194 МГц                | recommended for use |

## MIDI\_IN ##
| **Monule Name** | **CLK** | **Function** | **Cells** | **MEM** | **MUL** | **Fmax/Restricted Fmax on C iv** | **Comment** |
|:----------------|:--------|:-------------|:----------|:--------|:--------|:---------------------------------|:------------|
| [midi\_in.v](https://code.google.com/p/fpga-synth/source/browse/trunk/modules/midi_in.v) | Yes     | MIDI message decoder | ?         | ?       | ?       | ? МГц / ? МГц                    |             |
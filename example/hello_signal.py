#/usr/bin/env python3

from gnuradio import analog
from gnuradio import blocks
from gnuradio import audio
from gnuradio import gr 
import sys

# membuat class untuk block
class top_block(gr.top_block):
    def __init__(self):
        gr.top_block.__init__(self, "Hello word")

       # define your parameter for sampling signal  
        samp_rate = 32000
        
        # paramter freq
        freq1 = 440

        # paramter amplitudo atau tinggi glombang
        ampl = 0.1 


        # memasukan kedalam audio sink atau bunyi 
        self.audio_sink = audio.sink(32000, "", True)
        
        # sinyal analog dari sumber 2
        self.analog_sig_source_1 = analog.sig_source_f(samp_rate, analog.GR_COS_WAVE, 350, ampl, 0)

        # sinyal analog dari sumber 1
        self.analog_sig_source_0 = analog.sig_source_f(samp_rate, analog.GR_COS_WAVE, 440, ampl, 0)

        # Menghubungkan bloc sinyal sumber 1 dengan audio
        self.connect((self.analog_sig_source_0, 0), (self.audio_sink, 1))
        self.connect((self.analog_sig_source_1, 0), (self.audio_sink, 0))


if __name__ == '__main__':
    tb = top_block()
    tb.start()
    input("Press Enter to quit: ")
    tb.stop()

#!/bin/bash

deepspeech --model models/macsen_190109/output_graph.pb --alphabet models/macsen_190109/alphabet.txt --lm models/macsen_190109/lm.binary --trie models/macsen_190109/trie --audio $1

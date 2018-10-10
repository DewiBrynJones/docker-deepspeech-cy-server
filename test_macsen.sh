#!/bin/bash

deepspeech --model models/macsen_180924/output_graph.pb --alphabet models/macsen_180924/alphabet.txt --lm models/macsen_180924/lm.binary --trie models/macsen_180924/trie --audio $1

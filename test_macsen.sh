#!/bin/bash

deepspeech --model models/macsen_190208/output_graph.pb --alphabet models/macsen_190208/alphabet.txt --lm models/macsen_190208/lm.binary --trie models/macsen_190208/trie --audio $1

#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import os
import sys
import language_modelling_utils as lmutils
import config

CORPUS_URL="https://api.techiaith.org/assistant/get_all_sentences"
CORPUS_TEXT_FILE="/django-deepspeech-server/corpus.txt"

def main():
   conf = config.ConfigDeepSpeech()
   lmutils.fetch_corpus(CORPUS_URL, CORPUS_TEXT_FILE)

   lm_file_path=conf.get_config('lm')
   trie_file_path=conf.get_config('trie')
   alphabet_file_path=conf.get_config('alphabet')

   lm_binary_file_path=lmutils.create_binary_language_model(CORPUS_TEXT_FILE)
   lmutils.create_trie(trie_file_path, alphabet_file_path, lm_binary_file_path)
    


if __name__ == "__main__":
    main()    

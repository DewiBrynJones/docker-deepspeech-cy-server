import os
import json

CONFIG_FILE_PATH='/django-deepspeech-server/speech_server_main/config/config.json'

class ConfigDeepSpeech:
    
    def get_config(self, key):
        print('inside module')
        
        with open(CONFIG_FILE_PATH, 'r') as f:
            config = json.load(f)
            
        ds_config = config['deepspeech']
        model = ds_config['model']
        alphabet = ds_config['alphabet']
        lm = ds_config['lm']
        trie = ds_config['trie']
        audiofiledir = ds_config['audiofiledir']
        audiofilelength = ds_config['audiofilelength']
        debug = ds_config['debug']
        if key == 'model':
            return model
        elif key == 'alphabet':
            return alphabet
        elif key == 'lm':
            return lm
        elif key == 'trie':
            return trie
        elif key == 'audiofiledir':
            return audiofiledir
        elif key == 'audiofilelength':
            return audiofilelength
        elif key == 'debug':
            return debug
        else:
            raise Exception('Invalid key value.')
        

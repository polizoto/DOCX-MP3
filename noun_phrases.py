#!/usr/bin/env python

# Need to install NLTK
# Need to find and replace these characters (“ ” ’)
# Need to download punkt
# need to download averaged_perceptron_tagger

import os
import sys
from collections import Counter
from nltk import pos_tag, word_tokenize

class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

print ("Collecting Proper Nouns... ", end="", flush=True)

def read_text():
	with open('noun_phrases_raw.txt', 'r', errors='ignore') as f:
		book = f.read()
	f.close()
	return book
	
def text_tokenize(book):
    tokenize = word_tokenize(book)
    return tokenize	
	
def tagging(tokenize):
    tagged_text = pos_tag(tokenize)
    return tagged_text
	
def find_proper_nouns(tagged_text):
    proper_nouns = []
    i = 0
    while i < len(tagged_text):
        if tagged_text[i][1] == 'NNP':
            if tagged_text[i+1][1] == 'NNP':
                proper_nouns.append(tagged_text[i][0].lower() +
                                    " " + tagged_text[i+1][0].lower())
                i+=1 
            else:
                proper_nouns.append(tagged_text[i][0].lower())
        i+=1 
    return proper_nouns

def summarize_text(proper_nouns, top_num):
    counts = dict(Counter(proper_nouns).most_common(top_num))
    return counts
	
a = read_text()
b = text_tokenize(a)
c = tagging(b)
d = find_proper_nouns(c)
e = summarize_text(d, 100)

repr(dict)
file = open("Noun_Phrases.txt", "w")
file.write(repr(e))
file.close

print(f"{bcolors.OKGREEN}Done.\n{bcolors.ENDC}")
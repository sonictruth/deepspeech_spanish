#! /usr/bin/env python

"""
1. Load all corpora where a path is given.
2. Clean transcriptions.
3. Merge all corpora
4. Create Train/Dev/Test splits
5. Export for DeepSpeech
"""

import os
import sys

sys.path.append(os.path.abspath(os.path.join(__file__, os.path.pardir)))

import argparse

import audiomate
from audiomate.corpus import io
from audiomate.corpus import subset

import text_cleaning


def clean_transcriptions(corpus):
    for utterance in corpus.utterances.values():
        ll = utterance.label_lists[audiomate.corpus.LL_WORD_TRANSCRIPT]

        for label in ll:
            label.value = text_cleaning.clean_sentence(label.value)


if __name__ == '__main__':
    cv_path = '../es_work/es/'

    corpora = []

    print(cv_path);

    cv_corpus = audiomate.Corpus.load(cv_path, reader='common-voice')
    corpora.append(cv_corpus)


    merged_corpus = audiomate.Corpus.merge_corpora(corpora)
    clean_transcriptions(merged_corpus)

    splitter = subset.Splitter(merged_corpus, random_seed=38)
    splits = splitter.split(
        {'train': 0.7, 'dev': 0.15, 'test': 0.15}, separate_issuers=True)

    merged_corpus.import_subview('train', splits['train'])
    merged_corpus.import_subview('dev', splits['dev'])
    merged_corpus.import_subview('test', splits['test'])

    deepspeech_writer = io.MozillaDeepSpeechWriter()
    deepspeech_writer.save(merged_corpus, '../es_work/es_out/')

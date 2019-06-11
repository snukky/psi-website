#! /usr/bin/env python3
# -*- coding: utf-8 -*-

import yaml

with open('_data/seminars.yml', 'r') as data_stream:
    try:
        data = yaml.safe_load(data_stream)
        for record in reversed(data):
            print('<p>\n{}'.format(record['date']), end='')
            if 'author' in record:
                print('<br>\n<em>{}</em>'.format(record['author']), end='')
            if 'institute' in record:
                print(' ({})'.format(record['institute']), end='')
            if 'title' in record:
                print('<br>\n<strong>{}</strong>'.format(record['title']), end='')
            if 'abstract' in record:
                print('<br>\n{}'.format(record['abstract']), end='')
            print('\n</p>')
    except yaml.YAMLError as e:
        print(e)
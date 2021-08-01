#!/usr/bin/env python3
import sys
from typing import IO


class Reducer:

    def __init__(self, fh: IO, sep="\t"):
        self.fh = fh
        self.sep = sep

    def read_in(self):
        for line in self.fh.readlines():
            yield line.rstrip().split(self.sep)


if __name__ == '__main__':
    delim = "\t"
    reducer = Reducer(sys.stdin, delim)

    last_total = 0
    last_country = None
    last_year = None
    last_item_type = None
    for (year, item_type, country, units_sold) in reducer.read_in():
        if country == last_country and year == last_year and item_type == last_item_type:
            last_total += int(units_sold)
            pass
        else:   # new record, print the last one's stats
            if last_country:    # handle initial case when last_country is None
                print('{}\t{}\t{}\t{}'.format(last_year, last_item_type, last_country, last_total))
            last_country = country
            last_year = year
            last_item_type = item_type
            last_total = int(units_sold)

    # last item
    print('{}\t{}\t{}\t{}'.format(last_year, last_item_type, last_country, last_total))

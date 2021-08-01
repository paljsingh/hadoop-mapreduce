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
    top_n = int(sys.argv[1]) if len(sys.argv) > 1 else 10

    last_year = None
    count = 0
    for (year, order_id, profit) in reducer.read_in():
        if year == last_year:
            if count < top_n:
                print('{}\t{}\t{}'.format(year, order_id, profit))
            else:
                pass  # skip these items.
        else:  # new record, print the last one's stats
            print('{}\t{}\t{}'.format(year, order_id, profit))
            count = 0
            last_year = year
        count += 1

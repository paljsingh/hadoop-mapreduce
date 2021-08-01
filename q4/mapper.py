#!/usr/bin/env python3
import re
import sys
from typing import IO
from enum import Enum


class Mapper:

    def __init__(self, fh: IO):
        """
        initialize a mapper object.
        :param fh: file handle or stdin.
        """
        self.fh = fh
        pass

    def read_in(self):
        """
        read input file handle
        :return: return 1 record at a time as list.
        """
        for line in self.fh.readlines():
            yield re.split(r", *", line.rstrip())


class Columns(Enum):

    index = 0
    region = 1
    country = 2
    item_type = 3
    sales_channel = 4
    order_priority = 5
    order_date = 6
    order_id = 7
    ship_date = 8
    units_sold = 9
    unit_price = 10
    unit_cost = 11
    total_revenue = 12
    total_cost = 13
    total_profit = 14


if __name__ == '__main__':
    mapper = Mapper(sys.stdin)
    iterator = mapper.read_in()
    next(iterator)      # skip header

    # What are the top 10 order id for a given year by the total_profit
    # we are using 'order_date' field for extracting the year
    for fields in iterator:
        (year, order_id, total_profit) = (fields[Columns.order_date.value][:4], fields[Columns.order_id.value],
                                          fields[Columns.total_profit.value])

        print('{}\t{}\t{}'.format(year, order_id, total_profit))

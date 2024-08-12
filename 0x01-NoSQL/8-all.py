#!/usr/bin/env python3
""" Python Module for 8-all.py """
import pymongo


def list_all(mongo_collection):
    """ function lists all documents in a collection """
    cursor = mongo_collection.find({})
    return cursor

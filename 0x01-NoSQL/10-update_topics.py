#!/usr/bin/env python3
"""
    Function to modify the topics of a school document by its name:
        Prototype: def update_topics(mongo_collection, name, topics):
        mongo_collection: the pymongo collection object
        name (string): the school name to search for
        topics (list of strings): the new topics to assign to the school
"""


def update_topics(mongo_collection, name, topics):
    """Function to modify the topics of a school document by its name"""
    mongo_collection.update_many(
        { 'name': name },
        { '$set': { 'topics': topics }}
    )

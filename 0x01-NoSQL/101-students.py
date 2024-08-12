#!/usr/bin/env python3
""" Python Module for 101-students.py
 """

def top_students(mongo_collection):
    """ Returns all students sorted by average score """
    return mongo_collection.aggregate([
        {
            '$project': {
                'name': '$name',
                'averageScore': {
                    '$avg': "$topics.score"
                }
            }
        },
        {
            '$sort': {
                "averageScore": -1
            }
        }
    ])

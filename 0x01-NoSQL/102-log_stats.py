#!/usr/bin/env python3
""" Python Module """
from pymongo import MongoClient


if __name__ == "__main__":
    """ Enhance 12-log_stats.py by including the top 10 most frequent IP addresses
     in the nginx collection of the logs database """
    client = MongoClient('mongodb://127.0.0.1:27017')
    col = client.logs.nginx
    print("{} logs".format(col.estimated_document_count()))
    print("Methods:")
    for method in ["GET", "POST", "PUT", "PATCH", "DELETE"]:
        count = col.count_documents({'method': method})
        print("\tmethod {}: {}".format(method, count))
    status_get = col.count_documents({'method': 'GET', 'path': "/status"})
    print("{} status check".format(status_get))
    print("IPs:")
    top_ips = col.aggregate([
        {"$group": {
                "_id": "$ip",
                "count": {"$sum": 1}
            }
        },
        {"$sort": {"count": -1}},
        {"$limit": 10},
        {"$project": {
            "_id": 0,
            "ip": "$_id",
            "count": 1
        }}
    ])
    for ip in top_ips:
        print("\t{}: {}".format(ip.get('ip'), ip.get('count')))

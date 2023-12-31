import sqlite3
import json
from datetime import datetime
from models import Tag

TAG = [


]

def get_all_tags():
    """this will return every tag"""

    with sqlite3.connect("./db.sqlite3") as conn:

        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        db_cursor.execute("""
        SELECT
            t.id,
            t.label
        FROM Tags AS t
        ORDER BY label ASC;""")

    tags = []

    dataset = db_cursor.fetchall()

    for row in dataset:
        tag = Tag(row['id'], row['label'])
        tags.append(tag.__dict__)
    
    return tags

def create_new_tag(new_tag):
    """this will aloow for new tags"""

    with sqlite3.connect("./db.sqlite3") as conn:

        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        db_cursor.execute("""
        INSERT INTO Tags
            ( label)
        VALUES 
            ( ?);
        """, (new_tag['label'], ))

        id = db_cursor.lastrowid

        new_tag['id'] = id
    
    return new_tag
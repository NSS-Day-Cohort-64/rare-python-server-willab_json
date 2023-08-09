import sqlite3
import json
from models import Category

CATEGORY = [


]

def get_all_categories():
    # Open a connection to the database
    with sqlite3.connect("./db.sqlite3") as conn:

        # Just use these. It's a Black Box.
        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()
        
        db_cursor.execute("""
        SELECT
            c. id, 
            c. label
        FROM `CATEGORIES` c
        ORDER BY label ASC                          
        """) 
        
        categories = []

        dataset = db_cursor.fetchall()

        for row in dataset:

            category = Category(row['id'], row['label'])

        

    # Add the dictionary representation of the snake to the list
            categories.append(category.__dict__)
        
        return categories


def create_new_category(new_category):
    with sqlite3.connect("./db.sqlite3") as conn:
        db_cursor = conn.cursor()

        db_cursor.execute("""
        INSERT INTO `Categories`
            (label)
        VALUES
            (?);
        """,(new_category['label'],))

        # The `lastrowid` property on the cursor will return
        # the primary key of the last thing that got added to
        # the database.
        id = db_cursor.lastrowid

        # Add the `id` property to the animal dictionary that
        # was sent by the client so that the client sees the
        # primary key in the response.
        new_category['id'] = id


    return new_category
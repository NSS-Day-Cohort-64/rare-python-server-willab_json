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
        """) 
        
        categories = []

        dataset = db_cursor.fetchall()

        for row in dataset:

            category = Category(row['id'], row['label'])

        

    # Add the dictionary representation of the snake to the list
            categories.append(category.__dict__)
        
        return categories
        

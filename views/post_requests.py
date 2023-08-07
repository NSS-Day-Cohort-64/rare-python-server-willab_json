import sqlite3
import json
from models import Post, Category, User

POST = [


]
    

def get_all_posts():
    # Open a connection to the database
    with sqlite3.connect("./db.sqlite3") as conn:

        # Just use these. It's a Black Box.
        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()
        # Write the SQL query to get the information you want
        db_cursor.execute("""
        SELECT
            p. id,
            p. user_id,
            p. category_id,
            p. title,
            p. publication_date,
            p. image_url,
            p. content,
            p. approved,
            u. first_name user_first,
            u. last_name  user_last,
            u. email email,
            u. bio,
            u. username,
            u. password,
            u. profile_image_url,
            u. created_on,
            u. active,
            c. label category_label
        FROM `Posts` p
        JOIN `Users` u
            ON u.id = p.user_id
        JOIN `Categories` c
            ON c.id = p.category_id
        ORDER BY publication_date DESC;
        """)
        
        # Initialize an empty list to hold all animal representations
        posts = []

        dataset = db_cursor.fetchall()

        for row in dataset:
        
            post = Post(row['id'], row['user_id'], row['category_id'], row['title'],
                        row['publication_date'], row['image_url'], row['content'], row['approved'])

            user = User(row['user_id'], row['user_first'], row['user_last'], row['email'], row['bio'],
                        row['username'], row['password'], row['profile_image_url'], row['created_on'], row['active'])

            category = Category(row['category_id'], row['category_label'])

                # Add the dictionary representation of owner to the snake
            post.user = user.__dict__

    # Add the dictionary representation of the species to the snake
            post.category = category.__dict__

    # Add the dictionary representation of the snake to the list
            posts.append(post.__dict__)
        
        return posts


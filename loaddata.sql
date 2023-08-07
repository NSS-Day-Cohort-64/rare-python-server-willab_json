CREATE TABLE "Users" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "first_name" varchar,
  "last_name" varchar,
  "email" varchar,
  "bio" varchar,
  "username" varchar,
  "password" varchar,
  "profile_image_url" varchar,
  "created_on" date,
  "active" bit
);

CREATE TABLE "DemotionQueue" (
  "action" varchar,
  "admin_id" INTEGER,
  "approver_one_id" INTEGER,
  FOREIGN KEY(`admin_id`) REFERENCES `Users`(`id`),
  FOREIGN KEY(`approver_one_id`) REFERENCES `Users`(`id`),
  PRIMARY KEY (action, admin_id, approver_one_id)
);


CREATE TABLE "Subscriptions" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "follower_id" INTEGER,
  "author_id" INTEGER,
  "created_on" date,
  FOREIGN KEY(`follower_id`) REFERENCES `Users`(`id`),
  FOREIGN KEY(`author_id`) REFERENCES `Users`(`id`)
);

CREATE TABLE "Posts" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "user_id" INTEGER,
  "category_id" INTEGER,
  "title" varchar,
  "publication_date" date,
  "image_url" varchar,
  "content" varchar,
  "approved" bit,
  FOREIGN KEY(`user_id`) REFERENCES `Users`(`id`),
);

CREATE TABLE "Comments" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "post_id" INTEGER,
  "author_id" INTEGER,
  "content" varchar,
  FOREIGN KEY(`post_id`) REFERENCES `Posts`(`id`),
  FOREIGN KEY(`author_id`) REFERENCES `Users`(`id`)
);

CREATE TABLE "Reactions" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "label" varchar,
  "image_url" varchar
);

CREATE TABLE "PostReactions" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "user_id" INTEGER,
  "reaction_id" INTEGER,
  "post_id" INTEGER,
  FOREIGN KEY(`user_id`) REFERENCES `Users`(`id`),
  FOREIGN KEY(`reaction_id`) REFERENCES `Reactions`(`id`),
  FOREIGN KEY(`post_id`) REFERENCES `Posts`(`id`)
);

CREATE TABLE "Tags" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "label" varchar
);

CREATE TABLE "PostTags" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "post_id" INTEGER,
  "tag_id" INTEGER,
  FOREIGN KEY(`post_id`) REFERENCES `Posts`(`id`),
  FOREIGN KEY(`tag_id`) REFERENCES `Tags`(`id`)
);

CREATE TABLE "Categories" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "label" varchar
);

INSERT INTO Categories ('label') VALUES ('News');
INSERT INTO Tags ('label') VALUES ('JavaScript');
INSERT INTO Reactions ('label', 'image_url') VALUES ('happy', 'https://pngtree.com/so/happy');


INSERT INTO `Posts` (user_id, category_id, title, publication_date, image_url, content, approved)
VALUES
    (1, 2, 'Sample Post 1', '2023-08-07', 'https://example.com/image1.jpg', 'This is the content of Sample Post 1.', 1),
    (2, 1, 'Sample Post 2', '2023-08-06', 'https://example.com/image2.jpg', 'This is the content of Sample Post 2.', 1),
    (3, 3, 'Sample Post 3', '2023-08-05', 'https://example.com/image3.jpg', 'This is the content of Sample Post 3.', 0),
    (1, 2, 'Sample Post 4', '2023-08-04', 'https://example.com/image4.jpg', 'This is the content of Sample Post 4.', 1),
    (4, 1, 'Sample Post 5', '2023-08-03', 'https://example.com/image5.jpg', 'This is the content of Sample Post 5.', 1),
    (2, 3, 'Sample Post 6', '2023-08-02', 'https://example.com/image6.jpg', 'This is the content of Sample Post 6.', 1),
    (3, 2, 'Sample Post 7', '2023-08-01', 'https://example.com/image7.jpg', 'This is the content of Sample Post 7.', 0),
    (4, 1, 'Sample Post 8', '2023-07-31', 'https://example.com/image8.jpg', 'This is the content of Sample Post 8.', 1),
    (1, 3, 'Sample Post 9', '2023-07-30', 'https://example.com/image9.jpg', 'This is the content of Sample Post 9.', 1),
    (2, 2, 'Sample Post 10', '2023-07-29', 'https://example.com/image10.jpg', 'This is the content of Sample Post 10.', 1),

INSERT INTO `Posts` (user_id, category_id, title, publication_date, image_url, content, approved)
VALUES
    (2, 2, 'Sample Post 10', '2023-07-31', 'https://example.com/image10.jpg', 'This is the content of Sample Post 10.', 1);

INSERT INTO users (first_name, last_name, email, bio, username, password, profile_image_url, created_on, active)
VALUES
    ('John', 'Doe', 'john@example.com', 'Software engineer', 'johndoe', 'hashedpassword123', 'https://example.com/john.jpg', '2023-08-07', 1),
    ('Jane', 'Smith', 'jane@example.com', 'Travel enthusiast', 'janesmith', 'hashedpassword456', 'https://example.com/jane.jpg', '2023-08-06', 1),
    ('Michael', 'Johnson', 'michael@example.com', 'Fitness trainer', 'michaeljohnson', 'hashedpassword789', 'https://example.com/michael.jpg', '2023-08-05', 1),
    ('Emily', 'Brown', 'emily@example.com', 'Food blogger', 'emilybrown', 'hashedpasswordabc', 'https://example.com/emily.jpg', '2023-08-04', 1),
    ('Alex', 'Williams', 'alex@example.com', 'Musician', 'alexwilliams', 'hashedpassworddef', 'https://example.com/alex.jpg', '2023-08-03', 0),
    ('Samantha', 'Martinez', 'samantha@example.com', 'Art lover', 'samanthamartinez', 'hashedpasswordxyz', 'https://example.com/samantha.jpg', '2023-08-02', 1),
    ('David', 'Taylor', 'david@example.com', 'Photographer', 'davidtaylor', 'hashedpassword456', 'https://example.com/david.jpg', '2023-08-01', 0),
    ('Linda', 'Harris', 'linda@example.com', 'Nature lover', 'lindaharris', 'hashedpassword123', 'https://example.com/linda.jpg', '2023-07-31', 1),
    ('Chris', 'Clark', 'chris@example.com', 'Gamer', 'chrisclark', 'hashedpasswordabc', 'https://example.com/chris.jpg', '2023-07-30', 1),
    ('Michelle', 'Scott', 'michelle@example.com', 'Fashion designer', 'michellescott', 'hashedpassworddef', 'https://example.com/michelle.jpg', '2023-07-29', 0);

INSERT INTO categories (id, label)
VALUES
    (NULL, 'Fiction'),
    (NULL, 'Non-Fiction'),
    (NULL, 'Mystery'),
    (NULL, 'Science Fiction'),
    (NULL, 'Fantasy'),
    (NULL, 'Romance'),
    (NULL, 'Biography'),
    (NULL, 'History');


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
            c. label category_label
        FROM `Posts` p
        JOIN `Users` u
            ON u.id = p.user_id
        JOIN `Categories` c
            ON c.id = p.category_id
        ORDER BY publication_date DESC;
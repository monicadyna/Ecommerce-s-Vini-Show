CREATE TABLE order_reviews
(
    review_id VARCHAR(32) NOT NULL
    , order_id VARCHAR(32) NOT NULL
    , review_score INT
    , review_comment_title VARCHAR(255)
    , review_comment_message TEXT
    , review_creation_date DATE
    , review_answer_timestamp TIMESTAMP
    , PRIMARY KEY (review_id)
);


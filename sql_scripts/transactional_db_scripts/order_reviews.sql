CREATE TABLE IF NOT EXISTS transac_data.order_reviews
(
      review_id VARCHAR(32) NOT NULL
    , order_id VARCHAR(32) NOT NULL
    , review_score INT
    , review_comment_title VARCHAR(50)
    , review_comment_message VARCHAR(255)
    , review_creation_date DATE
    , review_answer_timestamp DATETIME
    , PRIMARY KEY (review_id, order_id)
);


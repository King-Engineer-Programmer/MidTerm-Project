-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/Cji6iG
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "review" (
    "date" date   NOT NULL,
    "lang" varchar(4)   NOT NULL,
    "country" varchar(50)   NOT NULL,
    "source" varchar(100)   NOT NULL,
    "score" numeric(10,2)   NOT NULL,
    "author" varchar(5000)   NOT NULL,
    "product" varchar(5000)   NOT NULL,
    "review_id" int   NOT NULL,
    CONSTRAINT "pk_review" PRIMARY KEY (
        "review_id"
     )
);
​
CREATE TABLE "url" (
    
    "phone_url" varchar(100)   NOT NULL,
    "domain" varchar(500)   NOT NULL,
    "review_id" int   NOT NULL,
    "url_id" varchar(100)   NOT NULL,
    CONSTRAINT "pk_url" PRIMARY KEY (
        "url_id"
     )
);
​
ALTER TABLE "url" ADD CONSTRAINT "fk_url_review_id" FOREIGN KEY("review_id")
REFERENCES "review" ("review_id");


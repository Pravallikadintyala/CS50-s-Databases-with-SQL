CREATE TABLE ingredients (
    "flour_price" REAL,
    "yeast_price" REAL,
    "oil_price" REAL,
    "butter_price" REAL,
    "sugar_price" REAL
);

CREATE TABLE donuts(
    "name_of_donut" TEXT NOT NULL,
    "contains_gluten" TEXT NOT NULL CHECK(contains_gluten IN ('yes','no')),
    "price" REAL,
    PRIMARY KEY ("name_of_donut")
);

CREATE TABLE product(
    "product_id" INTEGER NOT NULL,
    "product_name" TEXT NOT NULL,
    "price" REAL NOT NULL,
    "stock_quantity" INTEGER,
    PRIMARY KEY ("product_id"),
    FOREIGN KEY ("product_name") REFERENCES donuts("name_of_donut")
);

CREATE TABLE Orders(
    "Order_id" INTEGER,
    "customer_id" INTEGER NOT NULL,
    "order_date" DATE NOT NULL,
    "total_amount" DECIMAL NOT NULL,
    PRIMARY KEY("Order_id")
);

CREATE TABLE customers(
    "Customer_id" INTEGER NOT NULL,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "order_details" TEXT NOT NULL,
     PRIMARY KEY("Customer_id")
);

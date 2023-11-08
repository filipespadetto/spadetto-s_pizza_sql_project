CREATE TABLE "orders" (
    "row_id" NUMBER(10)   NOT NULL,
    "order_id" VARCHAR2(10)   NOT NULL,
    "created_at" DATE   NOT NULL,
    "item_id" VARCHAR2(10)   NOT NULL,
    "quantity" NUMBER(10)   NOT NULL,
    "cust_id" NUMBER(10)   NOT NULL,
    "delivery" NUMBER(1)   NOT NULL,
    "add_id" NUMBER(10)   NOT NULL,
    CONSTRAINT "pk_orders" PRIMARY KEY ("row_id")
);

CREATE TABLE "customers" (
    "cust_id" NUMBER(10)   NOT NULL,
    "cust_firstname" VARCHAR2(50)   NOT NULL,
    "cust_lastname" VARCHAR2(50)   NOT NULL,
    CONSTRAINT "pk_customers" PRIMARY KEY ("cust_id")
);

CREATE TABLE "address" (
    "add_id" NUMBER(10)   NOT NULL,
    "delivery_adress1" VARCHAR2(200)   NOT NULL,
    "delivery_adress2" VARCHAR2(200)   NULL,
    "delivery_city" VARCHAR2(50)   NOT NULL,
    "delivery_zipcode" VARCHAR2(20)   NOT NULL,
    CONSTRAINT "pk_address" PRIMARY KEY ("add_id")
);

CREATE TABLE "item" (
    "item_id" VARCHAR2(10)   NOT NULL,
    "sku" VARCHAR2(20)   NOT NULL,
    "item_name" VARCHAR2(100)   NOT NULL,
    "item_cat" VARCHAR2(100)   NOT NULL,
    "item_size" VARCHAR2(10)   NOT NULL,
    "item_price" NUMBER(10, 2)   NOT NULL,
    CONSTRAINT "pk_item" PRIMARY KEY ("item_id")
);

CREATE TABLE "ingredient" (
    "ing_id" VARCHAR2(10)   NOT NULL,
    "ing_name" VARCHAR2(200)   NOT NULL,
    "ing_weight" NUMBER(10)   NOT NULL,
    "ing_meas" VARCHAR2(20)   NOT NULL,
    "ing_price" NUMBER(5, 2)   NOT NULL,
    CONSTRAINT "pk_ingredient" PRIMARY KEY ("ing_id")
);

CREATE TABLE "recipe" (
    "row_id" NUMBER(10)   NOT NULL,
    "recipe_id" VARCHAR2(20)   NOT NULL,
    "ing_id" VARCHAR2(10)   NOT NULL,
    "quantity" NUMBER(10)   NOT NULL,
    CONSTRAINT "pk_recipe" PRIMARY KEY ("row_id")
);

CREATE TABLE "inventory" (
    "inv_id" NUMBER(10)   NOT NULL,
    "item_id" VARCHAR2(10)   NOT NULL,
    "quantity" NUMBER(10)   NOT NULL,
    CONSTRAINT "pk_inventory" PRIMARY KEY ("inv_id")
);

CREATE TABLE "staff" (
    "staff_id" VARCHAR2(20)   NOT NULL,
    "first_name" VARCHAR2(50)   NOT NULL,
    "last_name" VARCHAR2(50)   NOT NULL,
    "position" VARCHAR2(100)   NOT NULL,
    "hourly_rate" NUMBER(5, 2)   NOT NULL,
    CONSTRAINT "pk_staff" PRIMARY KEY ("staff_id")
);

CREATE TABLE "shift" (
    "shift_id" VARCHAR2(20)   NOT NULL,
    "day_of_week" VARCHAR2(10)   NOT NULL,
    "start_time" DATE   NOT NULL,
    "end_time" DATE   NOT NULL
);

CREATE TABLE "rota" (
    "row_id" NUMBER(10)   NOT NULL,
    "rota_id" VARCHAR2(20)   NOT NULL,
    "date" DATE   NOT NULL,
    "shift_id" VARCHAR2(20)   NOT NULL,
    "staff_id" VARCHAR2(20)   NOT NULL,
    CONSTRAINT "pk_rota" PRIMARY KEY ("row_id")
);

ALTER TABLE "customers" ADD CONSTRAINT "fk_customers_cust_id" FOREIGN KEY ("cust_id") REFERENCES "orders" ("cust_id");

ALTER TABLE "address" ADD CONSTRAINT "fk_address_add_id" FOREIGN KEY ("add_id") REFERENCES "orders" ("add_id");

ALTER TABLE "item" ADD CONSTRAINT "fk_item_item_id" FOREIGN KEY ("item_id") REFERENCES "orders" ("item_id");

ALTER TABLE "ingredient" ADD CONSTRAINT "fk_ingredient_ing_id" FOREIGN KEY ("ing_id") REFERENCES "recipe" ("ing_id");

ALTER TABLE "recipe" ADD CONSTRAINT "fk_recipe_recipe_id" FOREIGN KEY ("recipe_id") REFERENCES "item" ("sku");

ALTER TABLE "inventory" ADD CONSTRAINT "fk_inventory_item_id" FOREIGN KEY ("item_id") REFERENCES "recipe" ("ing_id");

ALTER TABLE "shift" ADD CONSTRAINT "fk_shift_shift_id" FOREIGN KEY ("shift_id") REFERENCES "rota" ("shift_id");

ALTER TABLE "rota" ADD CONSTRAINT "fk_rota_date" FOREIGN KEY ("date") REFERENCES "orders" ("created_at");

ALTER TABLE "rota" ADD CONSTRAINT "fk_rota_staff_id" FOREIGN KEY ("staff_id") REFERENCES "staff" ("staff_id");

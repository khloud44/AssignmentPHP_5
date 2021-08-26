CREATE DATABASE assigment_5 COLLATE 'utf8_general_ci';               /*TO create database*/

CREATE TABLE goverments (                                       /* to create goverment table*/
     id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) UNIQUE NOT NULL,
    eddress VARCHAR(255) NOT NULL UNIQUE,
    create_at DATETIME  DEFAULT NOW(),
    PRIMARY KEY(id) 
);

CREATE TABLE stores (                                                /* to create stores table in database*/
    id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) UNIQUE NOT NULL,
    eddress VARCHAR(255) NOT NULL UNIQUE,
    goverment_id INTEGER UNSIGNED,
    create_at DATETIME  DEFAULT NOW(),
    PRIMARY KEY(id) ,
    FOREIGN KEY(goverment_id) REFERENCES goverments(id)
);


CREATE TABLE suppliers (                                               /*to create suppliers table */
    id INTEGER UNSIGNED NOT NULL UNIQUE AUTO_INCREMENT,
    name VARCHAR(255) UNIQUE NOT NULL,
    age INTEGER(3) NOT NULL ,
    email VARCHAR(255) UNIQUE NOT NULL ,
    create_at DATETIME  DEFAULT NOW(),
    PRIMARY KEY(id)  
);
CREATE TABLE products (                                           /* to create products table*/
    id INTEGER UNSIGNED NOT NULL UNIQUE AUTO_INCREMENT,
    supplier_id INTEGER UNSIGNED,
    name VARCHAR(255) UNIQUE NOT NULL,
    code INTEGER UNSIGNED UNIQUE NOT NULL ,
    discription text ,
    price FLOAT UNSIGNED NOT NULL ,
    create_at DATETIME  DEFAULT NOW(),
    PRIMARY KEY(id),
    FOREIGN KEY(supplier_id) REFERENCES suppliers(id),    
);


CREATE TABLE stores_suppliers (                                  /*to create pivot table between stores & suppliers*/
    id INTEGER UNSIGNED NOT NULL UNIQUE AUTO_INCREMENT,
    strore_id INTEGER UNSIGNED,
    supplier_id INTEGER UNSIGNED,
    create_at DATETIME  DEFAULT NOW(),
    PRIMARY KEY(id), 
    FOREIGN KEY(strore_id) REFERENCES stores(id),
    FOREIGN KEY(supplier_id) REFERENCES suppliers(id)
);
CREATE TABLE stores_products (                                  /*to create pivot table between stores & suppliers*/
    id INTEGER UNSIGNED NOT NULL UNIQUE AUTO_INCREMENT,
    strore_id INTEGER UNSIGNED,
    products_id INTEGER UNSIGNED,
    create_at DATETIME  DEFAULT NOW(),
    PRIMARY KEY(id), 
    FOREIGN KEY(strore_id) REFERENCES stores(id),
    FOREIGN KEY(products_id) REFERENCES products(id)
);

 


-- CREATE TABLE stores_goverment (                                  /*to create pivot table between stores & goverment*/
--     id INTEGER UNSIGNED NOT NULL UNIQUE AUTO_INCREMENT,
--     strore_id INTEGER UNSIGNED,
--     goverment_id INTEGER UNSIGNED,
--     create_at DATETIME  DEFAULT NOW(),
--     PRIMARY KEY(id), 
--     FOREIGN KEY(strore_id) REFERENCES stores(id),
--     FOREIGN KEY(goverment_id) REFERENCES goverments(id)
-- );
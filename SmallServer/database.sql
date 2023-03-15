create TABLE films(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    year VARCHAR(4)
);

create TABLE genres(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    film_id INTEGER,
    FOREIGN KEY (film_id) REFERENCES films (id)
);
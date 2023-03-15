const db = require('../db');

const createGenre = async (req, res) => {
    const {name, filmId} = req.body;
    const newGenre = await db.query('INSERT INTO genres (name, film_id) values ($1, $2) RETURNING *', [name, filmId]);
    res.send(newGenre.rows[0]);
}

const getGenresByFilm = async (req, res) => {
    const id = req.query.id;
    const genres = await db.query('SELECT * FROM genres WHERE film_id = $1', [id]);
    res.send(genres.rows);
}

module.exports = {
    createGenre,
    getGenresByFilm,
}
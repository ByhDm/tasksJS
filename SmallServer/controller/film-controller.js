const db = require('../db');

const createFilm = async (req, res) => {
    const {name, year} = req.body;
    const newFilm = await db.query('INSERT INTO films (name, year) values ($1, $2) RETURNING *', [name, year]);
    res.send(newFilm.rows[0]);
}

const getFilms = async (req, res) => {
    const films = await db.query('SELECT * FROM films');
    res.send(films.rows);
}

const getOneFilm = async (req, res) => {
    const id = req.params.id;
    const film = await db.query('SELECT * FROM films WHERE id = $1', [id]);
    res.send(film.rows[0]);
}

const updateFilm = async (req, res) => {
    const {id, name, year} = req.body;
    const film = await db.query('UPDATE films set name = $1, year = $2 WHERE id = $3 RETURNING *', [name, year, id]);
    res.send(film.rows[0]);
}

const deleteFilm = async (req, res) => {
    const id = req.params.id;
    const film = await db.query('DELETE FROM films WHERE id = $1', [id]);
    res.send(film.rows[0]);
}

module.exports = {
    createFilm,
    getFilms,
    getOneFilm,
    updateFilm,
    deleteFilm,
}
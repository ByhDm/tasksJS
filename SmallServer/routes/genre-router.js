const Router = require('../framework/Router');
const genreController = require('../controller/genre_controller');
const router = new Router();

router.post('/genre', genreController.createGenre);
router.get('/genre', genreController.getGenresByFilm);

module.exports = router;
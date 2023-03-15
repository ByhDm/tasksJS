const Router = require('../framework/Router');
const filmController = require('../controller/film-controller');
const router = new Router();

router.post('/films', filmController.createFilm);
router.get('/films', filmController.getFilms);
router.get('/film', filmController.getOneFilm);
router.put('/films', filmController.updateFilm);
router.delete('/filmdelete', filmController.deleteFilm);

module.exports = router;
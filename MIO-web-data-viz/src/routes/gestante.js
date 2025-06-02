var express = require("express");
var router = express.Router();

var infoGestanteController = require("../controllers/gestanteController");

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.post("/cadastrar", function (req, res) {
    infoGestanteController.cadastrar(req, res);
})

router.post("/buscar/:idGestante", function (req, res) {
    infoGestanteController.buscarInfoGestante(req, res);
});

module.exports = router;
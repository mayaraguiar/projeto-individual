var express = require("express");
var router = express.Router();

var gestanteController = require("../controllers/gestanteController");

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js

router.post("/buscar/:idGestante", function (req, res) {
    infoGestanteController.buscarInfoGestante(req, res);
});

router.post("/cadastrarComGestante", function (req, res) {
    gestanteController.cadastrarComGestante(req, res);
})


module.exports = router;
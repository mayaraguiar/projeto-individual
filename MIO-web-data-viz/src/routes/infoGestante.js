var express = require("express");
var router = express.Router();
var infoGestanteController = require("../controllers/infoGestanteController");


router.post("/cadastrarInfoGestante", function (req, res) {

    infoGestanteController.cadastrarInfoGestante(req, res);

})

module.exports = router;
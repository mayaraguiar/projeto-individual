var express = require("express");
var router = express.Router();

var dashController = require("../controllers/dashController");

router.get("/dataProvavelParto", function (req, res) {
    dashController.buscarDataProvavelDoParto(req, res);
});

//  router.get("//:idAquario", function (req, res) {
//      medidaController.buscarMedidasEmTempoReal(req, res);
//  })

module.exports = router;
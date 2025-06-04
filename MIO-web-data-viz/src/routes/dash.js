var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/dashController");

router.get("/dataProvavelParto", function (req, res) {
    medidaController.buscarDataProvavelDoParto(req, res);
});

// router.get("/tempo-real/:idAquario", function (req, res) {
//     medidaController.buscarMedidasEmTempoReal(req, res);
// })

module.exports = router;